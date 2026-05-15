public class TitleStandardizer {

    private class Token {
        String  pat;
        String  abbr;
        Integer grp;
        Integer pri;
        Token(String p, String a, Integer g, Integer r) {
            pat = p; abbr = a; grp = g; pri = r;
        }
    }

    private static List<Map<String,String>> PRENORM;
    private static List<Token>              TOKENS;
    private static Pattern                  CXO_PAT;
    private static Set<String>              TC_CONNECTORS;
    private static Pattern                  ABBR_DOT_PAT;
    private static Pattern                  ALLCAPS_PAT;
    private static Pattern                  BU_SPLIT_PAT;
    private static Pattern                  DOT_DASH_PAT;

    private static void init() {
        if (PRENORM != null) return;

        PRENORM = new List<Map<String,String>>();
        addPN('\\bSVP\\b',         'Sr. VP');
        addPN('\\bEVP\\b',         'Exec. VP');
        addPN('\\bAVP\\b',         'Assoc. VP');
        addPN('\\bSnr\\.?\\b',     'Senior');
        addPN('\\bMgmt\\b',        'Mgr.');
        addPN('\\bCoord\\.?\\b',   'Coordinator');
        addPN('\\bPrin\\.?\\b',    'Principal');
        addPN('\\bConsult\\.?\\b', 'Consultant');
        addPN('\\bDr\\.?\\b',      'Dir.');

        CXO_PAT = Pattern.compile('(?i)\\bChief\\s+(\\w+)\\s+Officer\\b');

        TOKENS = new List<Token>();
        // Multi-word phrases FIRST (order matters)
        TOKENS.add(new Token('(?i)\\bManaging\\s+Director\\b', 'MD',            2, 2));
        TOKENS.add(new Token('(?i)\\bVice\\s+President\\b',    'VP',            2, 3));
        TOKENS.add(new Token('(?i)\\bHead\\s+of\\b',           'Head',          1, 5));
        // Single words - full spelling
        TOKENS.add(new Token('(?i)\\bSenior\\b',               'Sr.',           1, 1));
        TOKENS.add(new Token('(?i)\\bExecutive\\b',            'Exec.',         1, 2));
        TOKENS.add(new Token('(?i)\\bAssociate\\b',            'Assoc.',        1, 3));
        TOKENS.add(new Token('(?i)\\bJunior\\b',               'Jr.',           1, 4));
        TOKENS.add(new Token('(?i)\\bHead\\b',                 'Head',          1, 5));
        TOKENS.add(new Token('(?i)\\bLead\\b',                 'Lead',          1, 6));
        TOKENS.add(new Token('(?i)\\bDirector\\b',             'Dir.',          2, 4));
        TOKENS.add(new Token('(?i)\\bManager\\b',              'Mgr.',          2, 5));
        TOKENS.add(new Token('(?i)\\bPrincipal\\b',            'Principal',     2, 5));
        TOKENS.add(new Token('(?i)\\bAnalysts?\\b',            'Analyst',       2, 6));
        TOKENS.add(new Token('(?i)\\bConsultant\\b',           'Consultant',    2, 7));
        TOKENS.add(new Token('(?i)\\bCoordinator\\b',          'Coordinator',   2, 8));
        TOKENS.add(new Token('(?i)\\bAdministrator\\b',        'Administrator', 2, 9));
        // Already-abbreviated variants
        TOKENS.add(new Token('(?i)\\bSr\\.(?=\\s|$)',          'Sr.',           1, 1));
        TOKENS.add(new Token('(?i)\\bExec\\.',                 'Exec.',         1, 2));
        TOKENS.add(new Token('(?i)\\bAssoc\\.',                'Assoc.',        1, 3));
        TOKENS.add(new Token('(?i)\\bJr\\.(?=\\s|$)',          'Jr.',           1, 4));
        TOKENS.add(new Token('(?i)\\bDir\\.',                  'Dir.',          2, 4));
        TOKENS.add(new Token('(?i)\\bMgr\\.',                  'Mgr.',          2, 5));
        TOKENS.add(new Token('(?i)\\bVP\\b',                   'VP',            2, 3));
        // Already-abbreviated CXO titles
        TOKENS.add(new Token('(?i)\\bCEO\\b',  'CEO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCMO\\b',  'CMO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCOO\\b',  'COO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCFO\\b',  'CFO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCTO\\b',  'CTO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCDO\\b',  'CDO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCHRO\\b', 'CHRO', 2, 1));
        TOKENS.add(new Token('(?i)\\bCIO\\b',  'CIO',  2, 1));
        TOKENS.add(new Token('(?i)\\bCSO\\b',  'CSO',  2, 1));

        TC_CONNECTORS = new Set<String>{
            'of','and','the','a','an','for','in','at','with','to','by',
            'or','nor','but','yet','so','via'
        };
        ABBR_DOT_PAT = Pattern.compile('\\.$');
        ALLCAPS_PAT  = Pattern.compile('^[A-Z][A-Z0-9&]{1,5}$');
        BU_SPLIT_PAT = Pattern.compile('^(.*?)\\s*[-,]\\s*(.+)$');
        DOT_DASH_PAT = Pattern.compile('\\.\\s+-\\s+');
    }

    private static void addPN(String pat, String rep) {
        Map<String,String> m = new Map<String,String>{'pat'=>pat,'rep'=>rep};
        PRENORM.add(m);
    }

    public static String standardize(String title) {
        init();
        if (String.isBlank(title)) return title;

        String working = title.trim();

        // Step 1: Pre-normalize
        for (Map<String,String> v : PRENORM) {
            working = Pattern.compile('(?i)' + v.get('pat'))
                             .matcher(working).replaceAll(v.get('rep'));
        }

        // Step 2: CXO extraction
        Map<String, Integer> foundSortKey = new Map<String, Integer>();
        Map<String, String>  foundAbbr    = new Map<String, String>();

        Matcher cxoM = CXO_PAT.matcher(working);
        if (cxoM.find()) {
            String mid = cxoM.group(1);
            String cxo = 'C' + mid.substring(0,1).toUpperCase() + 'O';
            if (!foundAbbr.containsKey(cxo)) {
                foundAbbr.put(cxo, cxo);
                foundSortKey.put(cxo, 201);
            }
            working = cxoM.replaceFirst(' ');
        }

        // Step 3: Main token extraction
        for (Token tok : TOKENS) {
            Pattern p = Pattern.compile(tok.pat);
            Matcher m = p.matcher(working);
            if (m.find()) {
                if (!foundAbbr.containsKey(tok.abbr)) {
                    foundAbbr.put(tok.abbr, tok.abbr);
                    foundSortKey.put(tok.abbr, tok.grp * 100 + tok.pri);
                }
                working = p.matcher(working).replaceAll(' ');
            }
        }

        // Step 4: Clean remaining text
        working = working.replaceAll('\\s+', ' ');
        working = working.replaceAll('\\s+,', ',');
        working = working.replaceAll(',\\s*,', ',');
        working = working.replaceAll('\\(\\s*\\)', '');
        working = working.replaceAll('\\s+', ' ').trim();

        // Step 5: No tokens found — just title-case the cleaned title
        if (foundAbbr.isEmpty()) {
            return applyTitleCase(trimPunct(working));
        }

        // Step 6: Sort tokens and build prefix
        List<Integer> sortKeys = new List<Integer>(foundSortKey.values());
        sortKeys.sort();
        Map<Integer, String> keyToAbbr = new Map<Integer, String>();
        for (String abbr : foundSortKey.keySet()) {
            keyToAbbr.put(foundSortKey.get(abbr), abbr);
        }
        List<String> prefixParts = new List<String>();
        for (Integer k : sortKeys) {
            prefixParts.add(keyToAbbr.get(k));
        }
        String prefix = String.join(prefixParts, ' ');

        // Step 7: BU split on first '-' or ',' in remaining text
        String outStr;
        Matcher buM = BU_SPLIT_PAT.matcher(working);
        if (buM.matches()) {
            String func = trimPunct(buM.group(1));
            String bu   = buM.group(2).trim();
            String tcBu = applyTitleCase(bu);
            if (String.isNotBlank(func)) {
                outStr = prefix + ' ' + applyTitleCase(func) + ' - ' + tcBu;
            } else {
                outStr = prefix + ' - ' + tcBu;
            }
        } else {
            String clean = trimPunct(working);
            if (String.isNotBlank(clean)) {
                outStr = prefix + ' ' + applyTitleCase(clean);
            } else {
                outStr = prefix;
            }
        }

        // Step 8: Clean up ". - " sequences
        outStr = DOT_DASH_PAT.matcher(outStr).replaceAll('. ');

        return outStr;
    }

    @TestVisible
    private static String applyTitleCase(String text) {
        if (String.isBlank(text)) return text;
        List<String> words  = text.split('\\s+');
        List<String> result = new List<String>();
        for (String w : words) {
            if (String.isBlank(w)) continue;
            if (ALLCAPS_PAT.matcher(w).matches()) { result.add(w); continue; }
            if (ABBR_DOT_PAT.matcher(w).find())   { result.add(w); continue; }
            if (TC_CONNECTORS.contains(w.toLowerCase())) { result.add(w.toLowerCase()); continue; }
            Integer firstAlpha = -1;
            for (Integer ci = 0; ci < w.length(); ci++) {
                String ch = w.substring(ci, ci+1);
                if (ch.isAlpha()) { firstAlpha = ci; break; }
            }
            if (firstAlpha >= 0) {
                result.add(
                    w.substring(0, firstAlpha) +
                    w.substring(firstAlpha, firstAlpha+1).toUpperCase() +
                    w.substring(firstAlpha+1).toLowerCase()
                );
            } else {
                result.add(w);
            }
        }
        return String.join(result, ' ');
    }

    private static String trimPunct(String s) {
        if (s == null) return '';
        return s.replaceAll('^[\\s,;:\\-]+|[\\s,;:\\-]+$', '');
    }
}