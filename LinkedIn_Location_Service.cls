/**
 * LinkedInLocationService
 *
 * Parses Clay-sourced LinkedIn location strings and updates Contact address fields.
 *
 * Writes to:
 *   - MailingCountryCode  (ISO 2-letter, all contacts)
 *   - MailingStateCode    (ISO 2-letter, US contacts only)
 *   - MailingCity         (free text, max 40 chars)
 *
 * Behaviour:
 *   - Non-US states used for country extrapolation only, never written.
 *   - Major city names infer state/country when LinkedIn provides city only.
 *   - When any address field changes, MailingStreet and MailingPostalCode are
 *     cleared so stale street/zip from a previous location is not retained.
 *   - City names are cleaned of metro/area suffixes and truncated to 40 chars.
 */
public class LinkedInLocationService {

    public static List<Contact> parseAndUpdate(List<Contact> contacts) {
        List<Contact> updated = new List<Contact>();

        for (Contact c : contacts) {
            if (String.isBlank(c.LinkedIn_Location__c)) {
                continue;
            }

            LocationParts parsed = parseLocation(c.LinkedIn_Location__c);
            enrichParsedLocation(parsed);

            Boolean changed = false;

            // Country code
            if (String.isNotBlank(parsed.countryCode)) {
                if (shouldOverwrite(c.MailingCountryCode, parsed.countryCode)) {
                    c.MailingCountryCode = parsed.countryCode;
                    changed = true;
                }
            }

            // State code — US only
            if (String.isNotBlank(parsed.stateCode) && parsed.countryCode == 'US') {
                if (shouldOverwrite(c.MailingStateCode, parsed.stateCode)) {
                    c.MailingStateCode = parsed.stateCode;
                    changed = true;
                }
            }

            // City
            if (String.isNotBlank(parsed.city)) {
                String cleanCity = cleanCityName(parsed.city);
                if (String.isNotBlank(cleanCity) && cleanCity.length() > 40) {
                    cleanCity = cleanCity.left(40).trim();
                }
                if (String.isNotBlank(cleanCity) && shouldOverwrite(c.MailingCity, cleanCity)) {
                    c.MailingCity = cleanCity;
                    changed = true;
                }
            }

            // If any address field changed, clear street and zip
            // so stale data from a previous location is not retained
            if (changed) {
                c.MailingStreet     = null;
                c.MailingPostalCode = null;
                updated.add(c);
            }
        }
        return updated;
    }


    // ─── Location parser ──────────────────────────────────────────────
    public static LocationParts parseLocation(String raw) {
        LocationParts lp = new LocationParts();
        if (String.isBlank(raw)) return lp;

        List<String> tokens = new List<String>();
        for (String t : raw.split(',')) {
            String trimmed = t.trim();
            if (String.isNotBlank(trimmed)) {
                tokens.add(trimmed);
            }
        }

        if (tokens.isEmpty()) return lp;

        // ── 1 token ──
        if (tokens.size() == 1) {
            String single = tokens[0];
            if (LinkedInLocationData.isKnownCountry(single)) {
                lp.rawCountry = single;
            } else if (LinkedInLocationData.isKnownState(single)) {
                lp.rawState = single;
            } else {
                lp.city = single;
            }
            return lp;
        }

        // ── 2 tokens ──
        if (tokens.size() == 2) {
            String first  = tokens[0];
            String second = tokens[1];

            if (first.equalsIgnoreCase(second)) {
                if (LinkedInLocationData.isKnownCountry(second)) {
                    lp.rawCountry = second;
                } else {
                    lp.city = first;
                }
                return lp;
            }

            if (LinkedInLocationData.isKnownCountry(second)) {
                lp.rawCountry = second;
                if (LinkedInLocationData.isKnownState(first)) {
                    lp.rawState = first;
                } else {
                    lp.city = first;
                }
                return lp;
            }

            if (LinkedInLocationData.isKnownState(second)) {
                lp.rawState = second;
                lp.city = first;
                return lp;
            }

            lp.city = first;
            lp.rawState = second;
            return lp;
        }

        // ── 3+ tokens ──
        lp.rawCountry = tokens[tokens.size() - 1];
        String stateCandidate = tokens[tokens.size() - 2];

        if (!stateCandidate.equalsIgnoreCase(lp.rawCountry)) {
            lp.rawState = stateCandidate;
        }

        List<String> cityParts = new List<String>();
        for (Integer i = 0; i < tokens.size() - 2; i++) {
            cityParts.add(tokens[i]);
        }
        lp.city = String.join(cityParts, ', ');

        return lp;
    }

    // ─── Post-parse enrichment ────────────────────────────────────────
    @TestVisible
    private static void enrichParsedLocation(LocationParts lp) {

        // 1. Resolve country code from raw country text
        if (String.isNotBlank(lp.rawCountry)) {
            lp.countryCode = LinkedInLocationData.getCountryCode(lp.rawCountry);
        }

        // 2. Extrapolate country from state when missing
        if (String.isNotBlank(lp.rawState)) {
            if (String.isBlank(lp.countryCode)) {
                String extrapolated = LinkedInLocationData.getCountryCodeForState(lp.rawState);
                if (String.isNotBlank(extrapolated)) {
                    lp.countryCode = extrapolated;
                }
            }
            if (lp.countryCode == 'US') {
                lp.stateCode = LinkedInLocationData.getUSStateCode(lp.rawState);
            }
        }

        // 3. Infer state/country from city when both are still missing
        if (String.isNotBlank(lp.city) && String.isBlank(lp.countryCode)) {
            String cleanedForLookup = cleanCityName(lp.city);
            LinkedInLocationData.CityLocation inferred =
                LinkedInLocationData.inferFromCity(cleanedForLookup);
            if (inferred != null) {
                lp.countryCode = inferred.countryCode;
                if (String.isNotBlank(inferred.stateCode) && lp.countryCode == 'US') {
                    lp.stateCode = inferred.stateCode;
                }
            }
        }

        // 4. If we have country and city but no state, try inferring state for US
        if (lp.countryCode == 'US' && String.isBlank(lp.stateCode) && String.isNotBlank(lp.city)) {
            String cleanedForLookup = cleanCityName(lp.city);
            LinkedInLocationData.CityLocation inferred =
                LinkedInLocationData.inferFromCity(cleanedForLookup);
            if (inferred != null && String.isNotBlank(inferred.stateCode)) {
                lp.stateCode = inferred.stateCode;
            }
        }
    }

    // ─── Helpers ──────────────────────────────────────────────────────
    private static Boolean shouldOverwrite(String existing, String newValue) {
        if (String.isBlank(newValue)) return false;
        if (String.isBlank(existing)) return true;
        return !existing.trim().equalsIgnoreCase(newValue.trim());
    }

    public static String cleanCityName(String city) {
        if (String.isBlank(city)) return city;

        String cleaned = city;

        cleaned = cleaned.replaceAll('(?i)\\s+Metropolitan Area$', '');
        cleaned = cleaned.replaceAll('(?i)\\s+Metro Area$', '');
        cleaned = cleaned.replaceAll('(?i)\\s+City Metropolitan Area$', '');
        cleaned = cleaned.replaceAll('(?i)\\s+Metroplex$', '');

        if (cleaned.startsWithIgnoreCase('Greater ')) {
            if (cleaned.endsWithIgnoreCase(' Area')) {
                String cityCore = cleaned.substringAfter('Greater ').substringBeforeLast(' Area');
                if (String.isNotBlank(cityCore)) {
                    cleaned = cityCore;
                }
            } else {
                String cityCore = cleaned.substringAfter('Greater ');
                if (String.isNotBlank(cityCore)) {
                    cleaned = cityCore;
                }
            }
        }

        cleaned = cleaned.replaceAll('(?i)\\s+Bay Area$', '');

        // Catch-all: strip trailing " Area" from remaining patterns
        cleaned = cleaned.replaceAll('(?i)\\s+Area$', '');

        return cleaned.trim();
    }

    // ─── Inner class ──────────────────────────────────────────────────
    public class LocationParts {
        public String city;
        public String rawState;
        public String rawCountry;
        public String countryCode;
        public String stateCode;

        public LocationParts() {
            this.city        = null;
            this.rawState    = null;
            this.rawCountry  = null;
            this.countryCode = null;
            this.stateCode   = null;
        }
    }
}