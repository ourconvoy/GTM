/**
 * LinkedInLocationData
 *
 * Reference data for LinkedIn → Salesforce location mapping.
 *
 * With State & Country Picklists enabled, we write to:
 *   - MailingCountryCode (ISO 3166-1 alpha-2)
 *   - MailingStateCode   (US only — ISO 3166-2:US two-letter codes)
 *   - MailingCity         (free text, max 40 chars)
 *
 * Includes major city → location inference for when LinkedIn only provides
 * a city name with no state or country.
 */
public class LinkedInLocationData {

    // ═══════════════════════════════════════════════════════════════════
    //  COUNTRY → ISO CODE
    // ═══════════════════════════════════════════════════════════════════
    private static Map<String, String> countryCodeMap;

    public static Map<String, String> getCountryCodeMap() {
        if (countryCodeMap != null) return countryCodeMap;
        countryCodeMap = new Map<String, String>();

        // A
        countryCodeMap.put('afghanistan', 'AF');
        countryCodeMap.put('af', 'AF');
        countryCodeMap.put('albania', 'AL');
        countryCodeMap.put('al', 'AL');
        countryCodeMap.put('algeria', 'DZ');
        countryCodeMap.put('dz', 'DZ');
        countryCodeMap.put('andorra', 'AD');
        countryCodeMap.put('ad', 'AD');
        countryCodeMap.put('angola', 'AO');
        countryCodeMap.put('ao', 'AO');
        countryCodeMap.put('antigua and barbuda', 'AG');
        countryCodeMap.put('ag', 'AG');
        countryCodeMap.put('argentina', 'AR');
        countryCodeMap.put('ar', 'AR');
        countryCodeMap.put('armenia', 'AM');
        countryCodeMap.put('am', 'AM');
        countryCodeMap.put('australia', 'AU');
        countryCodeMap.put('au', 'AU');
        countryCodeMap.put('austria', 'AT');
        countryCodeMap.put('at', 'AT');
        countryCodeMap.put('österreich', 'AT');
        countryCodeMap.put('at', 'AT');
        countryCodeMap.put('azerbaijan', 'AZ');
        countryCodeMap.put('az', 'AZ');

        // B

        countryCodeMap.put('bahamas', 'BS');
        countryCodeMap.put('bs', 'BS');
        countryCodeMap.put('the bahamas', 'BS');
        countryCodeMap.put('bs', 'BS');
        countryCodeMap.put('bahrain', 'BH');
        countryCodeMap.put('bh', 'BH');
        countryCodeMap.put('bangladesh', 'BD');
        countryCodeMap.put('bd', 'BD');
        countryCodeMap.put('barbados', 'BB');
        countryCodeMap.put('bb', 'BB');
        countryCodeMap.put('belarus', 'BY');
        countryCodeMap.put('by', 'BY');
        countryCodeMap.put('belgium', 'BE');
        countryCodeMap.put('be', 'BE');
        countryCodeMap.put('belgique', 'BE');
        countryCodeMap.put('be', 'BE');
        countryCodeMap.put('belgië', 'BE');
        countryCodeMap.put('be', 'BE');
        countryCodeMap.put('belize', 'BZ');
        countryCodeMap.put('bz', 'BZ');
        countryCodeMap.put('benin', 'BJ');
        countryCodeMap.put('bj', 'BJ');
        countryCodeMap.put('bhutan', 'BT');
        countryCodeMap.put('bt', 'BT');
        countryCodeMap.put('bolivia', 'BO');
        countryCodeMap.put('bo', 'BO');
        countryCodeMap.put('bosnia and herzegovina', 'BA');
        countryCodeMap.put('ba', 'BA');
        countryCodeMap.put('botswana', 'BW');
        countryCodeMap.put('bw', 'BW');
        countryCodeMap.put('brazil', 'BR');
        countryCodeMap.put('br', 'BR');
        countryCodeMap.put('brasil', 'BR');
        countryCodeMap.put('br', 'BR');
        countryCodeMap.put('brunei', 'BN');
        countryCodeMap.put('bn', 'BN');
        countryCodeMap.put('bulgaria', 'BG');
        countryCodeMap.put('bg', 'BG');
        countryCodeMap.put('burkina faso', 'BF');
        countryCodeMap.put('bf', 'BF');
        countryCodeMap.put('burundi', 'BI');
        countryCodeMap.put('bi', 'BI');



        // C

        countryCodeMap.put('cabo verde', 'CV');
        countryCodeMap.put('cv', 'CV');
        countryCodeMap.put('cape verde', 'CV');
        countryCodeMap.put('cv', 'CV');
        countryCodeMap.put('cambodia', 'KH');
        countryCodeMap.put('kh', 'KH');
        countryCodeMap.put('cameroon', 'CM');
        countryCodeMap.put('cm', 'CM');
        countryCodeMap.put('canada', 'CA');
        countryCodeMap.put('ca', 'CA');
        countryCodeMap.put('central african republic', 'CF');
        countryCodeMap.put('cf', 'CF');
        countryCodeMap.put('chad', 'TD');
        countryCodeMap.put('td', 'TD');
        countryCodeMap.put('chile', 'CL');
        countryCodeMap.put('cl', 'CL');
        countryCodeMap.put('china', 'CN');
        countryCodeMap.put('cn', 'CN');
        countryCodeMap.put('colombia', 'CO');
        countryCodeMap.put('co', 'CO');
        countryCodeMap.put('comoros', 'KM');
        countryCodeMap.put('km', 'KM');
        countryCodeMap.put('congo', 'CG');
        countryCodeMap.put('cg', 'CG');
        countryCodeMap.put('democratic republic of the congo', 'CD');
        countryCodeMap.put('cd', 'CD');
        countryCodeMap.put('costa rica', 'CR');
        countryCodeMap.put('cr', 'CR');
        countryCodeMap.put('croatia', 'HR');
        countryCodeMap.put('hr', 'HR');
        countryCodeMap.put('hrvatska', 'HR');
        countryCodeMap.put('hr', 'HR');
        countryCodeMap.put('cuba', 'CU');
        countryCodeMap.put('cu', 'CU');
        countryCodeMap.put('cyprus', 'CY');
        countryCodeMap.put('cy', 'CY');
        countryCodeMap.put('czech republic', 'CZ');
        countryCodeMap.put('cz', 'CZ');
        countryCodeMap.put('czechia', 'CZ');
        countryCodeMap.put('cz', 'CZ');



        // D

        countryCodeMap.put('denmark', 'DK');
        countryCodeMap.put('dk', 'DK');
        countryCodeMap.put('danmark', 'DK');
        countryCodeMap.put('dk', 'DK');
        countryCodeMap.put('djibouti', 'DJ');
        countryCodeMap.put('dj', 'DJ');
        countryCodeMap.put('dominica', 'DM');
        countryCodeMap.put('dm', 'DM');
        countryCodeMap.put('dominican republic', 'DO');
        countryCodeMap.put('do', 'DO');



        // E

        countryCodeMap.put('ecuador', 'EC');
        countryCodeMap.put('ec', 'EC');
        countryCodeMap.put('egypt', 'EG');
        countryCodeMap.put('eg', 'EG');
        countryCodeMap.put('el salvador', 'SV');
        countryCodeMap.put('sv', 'SV');
        countryCodeMap.put('equatorial guinea', 'GQ');
        countryCodeMap.put('gq', 'GQ');
        countryCodeMap.put('eritrea', 'ER');
        countryCodeMap.put('er', 'ER');
        countryCodeMap.put('estonia', 'EE');
        countryCodeMap.put('ee', 'EE');
        countryCodeMap.put('eswatini', 'SZ');
        countryCodeMap.put('sz', 'SZ');
        countryCodeMap.put('swaziland', 'SZ');
        countryCodeMap.put('sz', 'SZ');
        countryCodeMap.put('ethiopia', 'ET');
        countryCodeMap.put('et', 'ET');



        // F

        countryCodeMap.put('fiji', 'FJ');
        countryCodeMap.put('fj', 'FJ');
        countryCodeMap.put('finland', 'FI');
        countryCodeMap.put('fi', 'FI');
        countryCodeMap.put('suomi', 'FI');
        countryCodeMap.put('fi', 'FI');
        countryCodeMap.put('france', 'FR');
        countryCodeMap.put('fr', 'FR');



        // G

        countryCodeMap.put('gabon', 'GA');
        countryCodeMap.put('ga', 'GA');
        countryCodeMap.put('gambia', 'GM');
        countryCodeMap.put('gm', 'GM');
        countryCodeMap.put('the gambia', 'GM');
        countryCodeMap.put('gm', 'GM');
        countryCodeMap.put('georgia', 'GE');
        countryCodeMap.put('ge', 'GE');
        countryCodeMap.put('germany', 'DE');
        countryCodeMap.put('de', 'DE');
        countryCodeMap.put('deutschland', 'DE');
        countryCodeMap.put('de', 'DE');
        countryCodeMap.put('ghana', 'GH');
        countryCodeMap.put('gh', 'GH');
        countryCodeMap.put('greece', 'GR');
        countryCodeMap.put('gr', 'GR');
        countryCodeMap.put('grenada', 'GD');
        countryCodeMap.put('gd', 'GD');
        countryCodeMap.put('guatemala', 'GT');
        countryCodeMap.put('gt', 'GT');
        countryCodeMap.put('guinea', 'GN');
        countryCodeMap.put('gn', 'GN');
        countryCodeMap.put('guinea-bissau', 'GW');
        countryCodeMap.put('gw', 'GW');
        countryCodeMap.put('guyana', 'GY');
        countryCodeMap.put('gy', 'GY');



        // H

        countryCodeMap.put('haiti', 'HT');
        countryCodeMap.put('ht', 'HT');
        countryCodeMap.put('honduras', 'HN');
        countryCodeMap.put('hn', 'HN');
        countryCodeMap.put('hong kong', 'HK');
        countryCodeMap.put('hk', 'HK');
        countryCodeMap.put('hungary', 'HU');
        countryCodeMap.put('hu', 'HU');



        // I

        countryCodeMap.put('iceland', 'IS');
        countryCodeMap.put('is', 'IS');
        countryCodeMap.put('india', 'IN');
        countryCodeMap.put('in', 'IN');
        countryCodeMap.put('indonesia', 'ID');
        countryCodeMap.put('id', 'ID');
        countryCodeMap.put('iran', 'IR');
        countryCodeMap.put('ir', 'IR');
        countryCodeMap.put('iraq', 'IQ');
        countryCodeMap.put('iq', 'IQ');
        countryCodeMap.put('ireland', 'IE');
        countryCodeMap.put('ie', 'IE');
        countryCodeMap.put('israel', 'IL');
        countryCodeMap.put('il', 'IL');
        countryCodeMap.put('italy', 'IT');
        countryCodeMap.put('it', 'IT');
        countryCodeMap.put('italia', 'IT');
        countryCodeMap.put('it', 'IT');



        // J

        countryCodeMap.put('jamaica', 'JM');
        countryCodeMap.put('jm', 'JM');
        countryCodeMap.put('japan', 'JP');
        countryCodeMap.put('jp', 'JP');
        countryCodeMap.put('jordan', 'JO');
        countryCodeMap.put('jo', 'JO');



        // K

        countryCodeMap.put('kazakhstan', 'KZ');
        countryCodeMap.put('kz', 'KZ');
        countryCodeMap.put('kenya', 'KE');
        countryCodeMap.put('ke', 'KE');
        countryCodeMap.put('kiribati', 'KI');
        countryCodeMap.put('ki', 'KI');
        countryCodeMap.put('kosovo', 'XK');
        countryCodeMap.put('xk', 'XK');
        countryCodeMap.put('kuwait', 'KW');
        countryCodeMap.put('kw', 'KW');
        countryCodeMap.put('kyrgyzstan', 'KG');
        countryCodeMap.put('kg', 'KG');



        // L

        countryCodeMap.put('laos', 'LA');
        countryCodeMap.put('la', 'LA');
        countryCodeMap.put('latvia', 'LV');
        countryCodeMap.put('lv', 'LV');
        countryCodeMap.put('lebanon', 'LB');
        countryCodeMap.put('lb', 'LB');
        countryCodeMap.put('lesotho', 'LS');
        countryCodeMap.put('ls', 'LS');
        countryCodeMap.put('liberia', 'LR');
        countryCodeMap.put('lr', 'LR');
        countryCodeMap.put('libya', 'LY');
        countryCodeMap.put('ly', 'LY');
        countryCodeMap.put('liechtenstein', 'LI');
        countryCodeMap.put('li', 'LI');
        countryCodeMap.put('lithuania', 'LT');
        countryCodeMap.put('lt', 'LT');
        countryCodeMap.put('luxembourg', 'LU');
        countryCodeMap.put('lu', 'LU');



        // M

        countryCodeMap.put('macau', 'MO');
        countryCodeMap.put('mo', 'MO');
        countryCodeMap.put('macao', 'MO');
        countryCodeMap.put('mo', 'MO');
        countryCodeMap.put('madagascar', 'MG');
        countryCodeMap.put('mg', 'MG');
        countryCodeMap.put('malawi', 'MW');
        countryCodeMap.put('mw', 'MW');
        countryCodeMap.put('malaysia', 'MY');
        countryCodeMap.put('my', 'MY');
        countryCodeMap.put('maldives', 'MV');
        countryCodeMap.put('mv', 'MV');
        countryCodeMap.put('mali', 'ML');
        countryCodeMap.put('ml', 'ML');
        countryCodeMap.put('malta', 'MT');
        countryCodeMap.put('mt', 'MT');
        countryCodeMap.put('marshall islands', 'MH');
        countryCodeMap.put('mh', 'MH');
        countryCodeMap.put('mauritania', 'MR');
        countryCodeMap.put('mr', 'MR');
        countryCodeMap.put('mauritius', 'MU');
        countryCodeMap.put('mu', 'MU');
        countryCodeMap.put('mexico', 'MX');
        countryCodeMap.put('mx', 'MX');
        countryCodeMap.put('méxico', 'MX');
        countryCodeMap.put('micronesia', 'FM');
        countryCodeMap.put('fm', 'FM');
        countryCodeMap.put('moldova', 'MD');
        countryCodeMap.put('md', 'MD');
        countryCodeMap.put('monaco', 'MC');
        countryCodeMap.put('mc', 'MC');
        countryCodeMap.put('mongolia', 'MN');
        countryCodeMap.put('mn', 'MN');
        countryCodeMap.put('montenegro', 'ME');
        countryCodeMap.put('me', 'ME');
        countryCodeMap.put('morocco', 'MA');
        countryCodeMap.put('ma', 'MA');
        countryCodeMap.put('mozambique', 'MZ');
        countryCodeMap.put('mz', 'MZ');
        countryCodeMap.put('myanmar', 'MM');
        countryCodeMap.put('mm', 'MM');
        countryCodeMap.put('burma', 'MM');
        countryCodeMap.put('mm', 'MM');



        // N

        countryCodeMap.put('namibia', 'NA');
        countryCodeMap.put('na', 'NA');
        countryCodeMap.put('nauru', 'NR');
        countryCodeMap.put('nr', 'NR');
        countryCodeMap.put('nepal', 'NP');
        countryCodeMap.put('np', 'NP');
        countryCodeMap.put('netherlands', 'NL');
        countryCodeMap.put('nl', 'NL');
        countryCodeMap.put('nederland', 'NL');
        countryCodeMap.put('nl', 'NL');
        countryCodeMap.put('the netherlands', 'NL');
        countryCodeMap.put('nl', 'NL');
        countryCodeMap.put('new zealand', 'NZ');
        countryCodeMap.put('nz', 'NZ');
        countryCodeMap.put('aotearoa', 'NZ');
        countryCodeMap.put('nz', 'NZ');
        countryCodeMap.put('nicaragua', 'NI');
        countryCodeMap.put('ni', 'NI');
        countryCodeMap.put('niger', 'NE');
        countryCodeMap.put('ne', 'NE');
        countryCodeMap.put('nigeria', 'NG');
        countryCodeMap.put('ng', 'NG');
        countryCodeMap.put('north korea', 'KP');
        countryCodeMap.put('kp', 'KP');
        countryCodeMap.put('north macedonia', 'MK');
        countryCodeMap.put('mk', 'MK');
        countryCodeMap.put('macedonia', 'MK');
        countryCodeMap.put('mk', 'MK');
        countryCodeMap.put('norway', 'NO');
        countryCodeMap.put('no', 'NO');
        countryCodeMap.put('norge', 'NO');
        countryCodeMap.put('no', 'NO');



        // O
        
        countryCodeMap.put('oman', 'OM');
        countryCodeMap.put('om', 'OM');

        
        
        // P

        countryCodeMap.put('pakistan', 'PK');
        countryCodeMap.put('pk', 'PK');
        countryCodeMap.put('palau', 'PW');
        countryCodeMap.put('pw', 'PW');
        countryCodeMap.put('palestine', 'PS');
        countryCodeMap.put('ps', 'PS');
        countryCodeMap.put('panama', 'PA');
        countryCodeMap.put('pa', 'PA');
        countryCodeMap.put('papua new guinea', 'PG');
        countryCodeMap.put('pg', 'PG');
        countryCodeMap.put('paraguay', 'PY');
        countryCodeMap.put('py', 'PY');
        countryCodeMap.put('peru', 'PE');
        countryCodeMap.put('pe', 'PE');
        countryCodeMap.put('philippines', 'PH');
        countryCodeMap.put('ph', 'PH');
        countryCodeMap.put('the philippines', 'PH');
        countryCodeMap.put('ph', 'PH');
        countryCodeMap.put('poland', 'PL');
        countryCodeMap.put('pl', 'PL');
        countryCodeMap.put('polska', 'PL');
        countryCodeMap.put('pl', 'PL');
        countryCodeMap.put('portugal', 'PT');
        countryCodeMap.put('pt', 'PT');



        // Q
        
        countryCodeMap.put('qatar', 'QA');
        countryCodeMap.put('qa', 'QA');

        
        
        
        // R

        countryCodeMap.put('romania', 'RO');
        countryCodeMap.put('ro', 'RO');
        countryCodeMap.put('russia', 'RU');
        countryCodeMap.put('ru', 'RU');
        countryCodeMap.put('russian federation', 'RU');
        countryCodeMap.put('ru', 'RU');
        countryCodeMap.put('rwanda', 'RW');
        countryCodeMap.put('rw', 'RW');



        // S

        countryCodeMap.put('saudi arabia', 'SA');
        countryCodeMap.put('sa', 'SA');
        countryCodeMap.put('senegal', 'SN');
        countryCodeMap.put('sn', 'SN');
        countryCodeMap.put('serbia', 'RS');
        countryCodeMap.put('rs', 'RS');
        countryCodeMap.put('seychelles', 'SC');
        countryCodeMap.put('sc', 'SC');
        countryCodeMap.put('sierra leone', 'SL');
        countryCodeMap.put('sl', 'SL');
        countryCodeMap.put('singapore', 'SG');
        countryCodeMap.put('sg', 'SG');
        countryCodeMap.put('slovakia', 'SK');
        countryCodeMap.put('sk', 'SK');
        countryCodeMap.put('slovenia', 'SI');
        countryCodeMap.put('si', 'SI');
        countryCodeMap.put('solomon islands', 'SB');
        countryCodeMap.put('sb', 'SB');
        countryCodeMap.put('somalia', 'SO');
        countryCodeMap.put('so', 'SO');
        countryCodeMap.put('south africa', 'ZA');
        countryCodeMap.put('za', 'ZA');
        countryCodeMap.put('south korea', 'KR');
        countryCodeMap.put('korea', 'KR');
        countryCodeMap.put('kr', 'KR');
        countryCodeMap.put('south sudan', 'SS');
        countryCodeMap.put('ss', 'SS');
        countryCodeMap.put('spain', 'ES');
        countryCodeMap.put('españa', 'ES');
        countryCodeMap.put('es', 'ES');
        countryCodeMap.put('sri lanka', 'LK');
        countryCodeMap.put('lk', 'LK');
        countryCodeMap.put('sudan', 'SD');
        countryCodeMap.put('sd', 'SD');
        countryCodeMap.put('suriname', 'SR');
        countryCodeMap.put('sr', 'SR');
        countryCodeMap.put('sweden', 'SE');
        countryCodeMap.put('sverige', 'SE');
        countryCodeMap.put('se', 'SE');
        countryCodeMap.put('switzerland', 'CH');
        countryCodeMap.put('schweiz', 'CH');
        countryCodeMap.put('suisse', 'CH');
        countryCodeMap.put('svizzera', 'CH');
        countryCodeMap.put('ch', 'CH');
        countryCodeMap.put('syria', 'SY');
        countryCodeMap.put('sy', 'SY');



        // T

        countryCodeMap.put('taiwan', 'TW');
        countryCodeMap.put('tw', 'TW');
        countryCodeMap.put('tajikistan', 'TJ');
        countryCodeMap.put('tj', 'TJ');
        countryCodeMap.put('tanzania', 'TZ');
        countryCodeMap.put('tz', 'TZ');
        countryCodeMap.put('thailand', 'TH');
        countryCodeMap.put('th', 'TH');
        countryCodeMap.put('timor-leste', 'TL');
        countryCodeMap.put('tl', 'TL');
        countryCodeMap.put('togo', 'TG');
        countryCodeMap.put('tg', 'TG');
        countryCodeMap.put('tonga', 'TO');
        countryCodeMap.put('to', 'TO');
        countryCodeMap.put('trinidad and tobago', 'TT');
        countryCodeMap.put('tt', 'TT');
        countryCodeMap.put('tunisia', 'TN');
        countryCodeMap.put('tn', 'TN');
        countryCodeMap.put('turkey', 'TR');
        countryCodeMap.put('türkiye', 'TR');
        countryCodeMap.put('tr', 'TR');
        countryCodeMap.put('turkmenistan', 'TM');
        countryCodeMap.put('tm', 'TM');
        countryCodeMap.put('tuvalu', 'TV');
        countryCodeMap.put('tv', 'TV');



        // U

        countryCodeMap.put('uganda', 'UG');
        countryCodeMap.put('ug', 'UG');
        countryCodeMap.put('ukraine', 'UA');
        countryCodeMap.put('ua', 'UA');
        countryCodeMap.put('united arab emirates', 'AE');
        countryCodeMap.put('uae', 'AE');
        countryCodeMap.put('ae', 'AE');
        countryCodeMap.put('united kingdom', 'GB');
        countryCodeMap.put('uk', 'GB');
        countryCodeMap.put('great britain', 'GB');
        countryCodeMap.put('britain', 'GB');
        countryCodeMap.put('england', 'GB');
        countryCodeMap.put('gb', 'GB');
        countryCodeMap.put('united states', 'US');
        countryCodeMap.put('usa', 'US');
        countryCodeMap.put('u.s.', 'US');
        countryCodeMap.put('u.s.a.', 'US');
        countryCodeMap.put('united states of america', 'US');
        countryCodeMap.put('us', 'US');
        countryCodeMap.put('uruguay', 'UY');
        countryCodeMap.put('uy', 'UY');
        countryCodeMap.put('uzbekistan', 'UZ');
        countryCodeMap.put('uz', 'UZ');



        // V

        countryCodeMap.put('vanuatu', 'VU');
        countryCodeMap.put('vu', 'VU');
        countryCodeMap.put('vatican city', 'VA');
        countryCodeMap.put('va', 'VA');
        countryCodeMap.put('venezuela', 'VE');
        countryCodeMap.put('ve', 'VE');
        countryCodeMap.put('vietnam', 'VN');
        countryCodeMap.put('vn', 'VN');



        // Y
        countryCodeMap.put('yemen', 'YE');
        countryCodeMap.put('ye', 'YE');

        // Z

        countryCodeMap.put('zambia', 'ZM');
        countryCodeMap.put('zm', 'ZM');
        countryCodeMap.put('zimbabwe', 'ZW');
        countryCodeMap.put('zw', 'ZW');



        return countryCodeMap;
    }

    // ═══════════════════════════════════════════════════════════════════
    //  US STATE NAME → ISO CODE
    // ═══════════════════════════════════════════════════════════════════
    private static Map<String, String> usStateCodeMap;

    public static Map<String, String> getUSStateCodeMap() {
        if (usStateCodeMap != null) return usStateCodeMap;
        usStateCodeMap = new Map<String, String>();

        usStateCodeMap.put('alabama', 'AL');
        usStateCodeMap.put('al', 'AL');
        usStateCodeMap.put('alaska', 'AK');
        usStateCodeMap.put('ak', 'AK');
        usStateCodeMap.put('arizona', 'AZ');
        usStateCodeMap.put('az', 'AZ');
        usStateCodeMap.put('arkansas', 'AR');
        usStateCodeMap.put('ar', 'AR');
        usStateCodeMap.put('american samoa', 'AS');
        usStateCodeMap.put('as', 'AS');
        usStateCodeMap.put('california', 'CA');
        usStateCodeMap.put('ca', 'CA');
        usStateCodeMap.put('colorado', 'CO');
        usStateCodeMap.put('co', 'CO');
        usStateCodeMap.put('connecticut', 'CT');
        usStateCodeMap.put('ct', 'CT');
        usStateCodeMap.put('delaware', 'DE');
        usStateCodeMap.put('de', 'DE');
        usStateCodeMap.put('district of columbia', 'DC');
        usStateCodeMap.put('washington dc', 'DC');
        usStateCodeMap.put('washington d.c.', 'DC');
        usStateCodeMap.put('dc', 'DC');
        usStateCodeMap.put('florida', 'FL');
        usStateCodeMap.put('fl', 'FL');
        usStateCodeMap.put('georgia', 'GA');
        usStateCodeMap.put('ga', 'GA');
        usStateCodeMap.put('guam', 'GU');
        usStateCodeMap.put('gu', 'GU');
        usStateCodeMap.put('hawaii', 'HI');
        usStateCodeMap.put('hi', 'HI');
        usStateCodeMap.put('idaho', 'ID');
        usStateCodeMap.put('id', 'ID');
        usStateCodeMap.put('illinois', 'IL');
        usStateCodeMap.put('il', 'IL');
        usStateCodeMap.put('indiana', 'IN');
        usStateCodeMap.put('in', 'IN');
        usStateCodeMap.put('iowa', 'IA');
        usStateCodeMap.put('ia', 'IA');
        usStateCodeMap.put('kansas', 'KS');
        usStateCodeMap.put('ks', 'KS');
        usStateCodeMap.put('kentucky', 'KY');
        usStateCodeMap.put('ky', 'KY');
        usStateCodeMap.put('louisiana', 'LA');
        usStateCodeMap.put('la', 'LA');
        usStateCodeMap.put('maine', 'ME');
        usStateCodeMap.put('me', 'ME');
        usStateCodeMap.put('maryland', 'MD');
        usStateCodeMap.put('md', 'MD');
        usStateCodeMap.put('massachusetts', 'MA');
        usStateCodeMap.put('ma', 'MA');
        usStateCodeMap.put('michigan', 'MI');
        usStateCodeMap.put('mi', 'MI');
        usStateCodeMap.put('minnesota', 'MN');
        usStateCodeMap.put('mn', 'MN');
        usStateCodeMap.put('mississippi', 'MS');
        usStateCodeMap.put('ms', 'MS');
        usStateCodeMap.put('missouri', 'MO');
        usStateCodeMap.put('mo', 'MO');
        usStateCodeMap.put('montana', 'MT');
        usStateCodeMap.put('mt', 'MT');
        usStateCodeMap.put('northern mariana islands', 'MP');
        usStateCodeMap.put('mp', 'MP');
        usStateCodeMap.put('nebraska', 'NE');
        usStateCodeMap.put('ne', 'NE');
        usStateCodeMap.put('nevada', 'NV');
        usStateCodeMap.put('nv', 'NV');
        usStateCodeMap.put('new hampshire', 'NH');
        usStateCodeMap.put('nh', 'NH');
        usStateCodeMap.put('new jersey', 'NJ');
        usStateCodeMap.put('nj', 'NJ');
        usStateCodeMap.put('new mexico', 'NM');
        usStateCodeMap.put('nm', 'NM');
        usStateCodeMap.put('new york', 'NY');
        usStateCodeMap.put('ny', 'NY');
        usStateCodeMap.put('north carolina', 'NC');
        usStateCodeMap.put('nc', 'NC');
        usStateCodeMap.put('north dakota', 'ND');
        usStateCodeMap.put('nd', 'ND');
        usStateCodeMap.put('ohio', 'OH');
        usStateCodeMap.put('oh', 'OH');
        usStateCodeMap.put('oklahoma', 'OK');
        usStateCodeMap.put('ok', 'OK');
        usStateCodeMap.put('oregon', 'OR');
        usStateCodeMap.put('or', 'OR');
        usStateCodeMap.put('pennsylvania', 'PA');
        usStateCodeMap.put('pa', 'PA');
        usStateCodeMap.put('puerto rico', 'PR');
        usStateCodeMap.put('pr', 'PR');
        usStateCodeMap.put('rhode island', 'RI');
        usStateCodeMap.put('ri', 'RI');
        usStateCodeMap.put('south carolina', 'SC');
        usStateCodeMap.put('sc', 'SC');
        usStateCodeMap.put('south dakota', 'SD');
        usStateCodeMap.put('sd', 'SD');
        usStateCodeMap.put('tennessee', 'TN');
        usStateCodeMap.put('tn', 'TN');
        usStateCodeMap.put('texas', 'TX');
        usStateCodeMap.put('tx', 'TX');
        usStateCodeMap.put('utah', 'UT');
        usStateCodeMap.put('ut', 'UT');
        usStateCodeMap.put('vermont', 'VT');
        usStateCodeMap.put('vt', 'VT');
        usStateCodeMap.put('u.s. virgin islands', 'VI');
        usStateCodeMap.put('us virgin islands', 'VI');
        usStateCodeMap.put('vi', 'VI');
        usStateCodeMap.put('virginia', 'VA');
        usStateCodeMap.put('va', 'VA');
        usStateCodeMap.put('washington', 'WA');
        usStateCodeMap.put('wa', 'WA');
        usStateCodeMap.put('west virginia', 'WV');
        usStateCodeMap.put('wv', 'WV');
        usStateCodeMap.put('wisconsin', 'WI');
        usStateCodeMap.put('wi', 'WI');
        usStateCodeMap.put('wyoming', 'WY');
        usStateCodeMap.put('wy', 'WY');

        return usStateCodeMap;
    }
    
    
    

    // ═══════════════════════════════════════════════════════════════════
    //  STATE / PROVINCE → COUNTRY CODE (for extrapolation)
    // ═══════════════════════════════════════════════════════════════════
    private static Map<String, String> stateToCountryCodeMap;

    public static Map<String, String> getStateToCountryCodeMap() {
        if (stateToCountryCodeMap != null) return stateToCountryCodeMap;
        stateToCountryCodeMap = new Map<String, String>();
        
        // Notes by Eloy
    	// 
        // ALL the names have to be in lowercase.
        //
        
        
        // US — from usStateCodeMap
        for (String s : getUSStateCodeMap().keySet()) {
            stateToCountryCodeMap.put(s, 'US');
        }
        
        // Canada
        for (String s : new List<String>{
            'alberta', 'british columbia', 'manitoba', 'new brunswick', 'newfoundland and labrador', 'newfoundland',
			'northwest territories', 'nova scotia', 'nunavut', 'ontario', 'prince edward island', 'quebec', 'québec',
			'saskatchewan', 'yukon territories', 'yukon', 'ab', 'bc', 'mb', 'nb', 'nl', 'nt', 'ns', 'nu', 'on', 'pe', 'qc', 'sk', 'yt'}) { 
            stateToCountryCodeMap.put(s, 'CA'); 
        } 

        // Australia
        for (String s : new List<String>{
            'australian capital territory', 'new south wales', 'northen territory',
			'queensland', 'south australia', 'tasmania', 'victoria', 'western australia',
            'act', 'nsw', 'nt', 'sa', 'tas', 'vic'}) {
        	stateToCountryCodeMap.put(s, 'AU'); 
        }

        // United Kingdom (Note: Clay has UK as GB, but SF has it as United Kingdom.)
        for (String s : new List<String>{
            'england', 'scotland', 'wales', 'northern ireland', 'eng', 'sct', 'sco', 'wls', 'wal', 'nir' }) { 
            stateToCountryCodeMap.put(s, 'GB'); 
        }

        // India
        for (String s : new List<String>{
            'andhra pradesh','arunachal pradesh','assam','bihar',
            'chhattisgarh','goa','gujarat','haryana','himachal pradesh',
            'jharkhand','karnataka','kerala','madhya pradesh',
            'maharashtra','manipur','meghalaya','mizoram','nagaland',
            'odisha','punjab','rajasthan','sikkim','tamil nadu',
            'telangana','tripura','uttar pradesh','uttarakhand',
            'west bengal','delhi'}) { 
            stateToCountryCodeMap.put(s, 'IN'); 
        }

        // Germany
        for (String s : new List<String>{
            'baden-wurttemberg', 'baden-württemberg', 'bavaria', 'bayern', 'berlin', 'brandenburg', 'bremen',
			'hamburg', 'hesse', 'hessen', 'lower saxony', 'mecklenburg-vorpommern', 'north rhine-westphalia',
			'rhineland-palatinate', 'saarland', 'saxony', 'saxony-anhalt', 'schleswig-holstein',
			'thuringia', 'bw', 'by', 'be', 'bb', 'hb', 'hh', 'he', 'ni', 'mv', 'nw',
			'rp', 'sl', 'sn', 'st', 'sh', 'th'}) { 
            stateToCountryCodeMap.put(s, 'DE'); 
        }

        // Brazil
        for (String s : new List<String>{
            'são paulo', 'sao paulo','rio de janeiro','minas gerais','bahia',
            'paraná', 'parana','rio grande do sul','santa catarina','goiás', 'goias',
            'pernambuco','ceará', 'ceara','distrito federal'}) { 
            stateToCountryCodeMap.put(s, 'BR'); 
        }

        // Mexico
        for (String s : new List<String>{
            'aguascalientes', 'baja california', 'baja california sur', 'campeche',
			'chiapas', 'chihuahua', 'coahuila', 'colima', 'durango', 'federal district', 'distrito federal',
			'guanajuato', 'guerrero', 'hidalgo', 'jalisco', 'mexico state', 'mexico city',
			'ciudad de mexico', 'ciudad de méxico', 'estado de mexico', 'estado de méxico',
			'michoacán', 'morelos', 'nayarit', 'nuevo león', 'nuevo leon', 'oaxaca', 'puebla',
			'querétaro', 'queretaro', 'quintana roo', 'san luis potosí', 'san luis potosi', 'sinaloa', 'sonora',
			'tabasco', 'tamaulipas', 'tlaxcala', 'veracruz', 'yucatán', 'yucatan', 'zacatecas',
			'agu', 'bcn', 'bcs', 'cam', 'chp', 'chh', 'coa', 'col', 'dur', 'dif', 'gua', 'gro',
			'hid', 'jal', 'mex', 'mic', 'mor', 'nay', 'nle', 'oax', 'pue', 'que', 'roo', 'slp',
			'sin', 'son', 'tab', 'tam', 'tla', 'ver', 'yuc', 'zac'}) { 
            stateToCountryCodeMap.put(s, 'MX'); 
        }

        // France
        for (String s : new List<String>{
            'alsace', 'aquitaine', 'auvergne', 'basse-normandie', 'normandy', 'bourgogne',
			'bretagne', 'brittany', 'centre', 'champagne-ardenne', 'corse', 'franche-comte',
			'haute-normandie', 'ile-de-france', 'île-de-france', 'languedoc-roussillon', 'limousin',
			'lorraine', 'midi-pyrenees', 'nord-pas-de-calais', 'pays de la loire', 'picardie',
			'poitou-charentes', 'occitanie', 'provence-alpes-cote-d azur', 'provence', 'rhone-alpes',
			'nouvelle-aquitaine', 'grand est', 'hauts-de-france', 'als', 'aqu', 'auv', 'bn', 'nor',
			'bou', 'bre', 'cen', 'cha', 'cor', 'frc', 'hn', 'idf', 'lan', 'lim', 'lor',
			'mid', 'npc', 'pdl', 'pic', 'poi', 'occ', 'pac', 'rha', 'naq', 'ges', 'hdf'}) { 
            stateToCountryCodeMap.put(s, 'FR'); 
        }

        // Spain
        for (String s : new List<String>{
            'andalusia', 'andalucía', 'aragon', 'aragón', 'asturias', 'balearic islands',
			'basque country', 'canary islands', 'islas canarias', 'cantabria', 'cataluña',
			'catalunya', 'castile and leon', 'castilla y león', 'castile-la mancha', 'castilla',
			'catalonia', 'extremadura', 'galicia', 'la rioja', 'madrid', 'community of madrid',
			'comunidad de madrid', 'melilla', 'murcia', 'navarre', 'navarra', 'valencian community',
			'valencia', 'an', 'as', 'ib', 'pv', 'cb', 'cl', 'cm', 'ex', 'ri', 'ml', 'vc'}) { 
            stateToCountryCodeMap.put(s, 'ES'); 
        }

        // Italy
        for (String s : new List<String>{
            'agrigento', 'alessandria', 'ancona', 'aosta', 'arezzo', 'ascoli piceno',
			'asti', 'avellino', 'bari', 'barletta-andria-trani', 'belluno', 'benevento',
			'bergamo', 'biella', 'bologna', 'bolzano', 'brescia', 'brindisi', 'cagliari',
			'caltanissetta', 'campobasso', 'carbonia-iglesias', 'caserta', 'catania',
			'catanzaro', 'chieti', 'como', 'cosenza', 'cremona', 'crotone', 'cuneo',
			'enna', 'fermo', 'ferrara', 'florence', 'foggia', 'forlì-cesena', 'frosinone',
			'genoa', 'gorizia', 'grosseto', 'imperia', 'isernia', 'l´aquila', 'la spezia',
			'latina', 'lecce', 'lecco', 'livorno', 'lodi', 'lucca', 'macerata', 'mantua',
			'massa and carrara', 'matera', 'medio campidano', 'messina', 'milan', 'modena',
			'monza and brianza', 'naples', 'novara', 'nuoro', 'ogliastra', 'olbia-tempio',
			'oristano', 'padua', 'palermo', 'parma', 'pavia', 'perugia', 'pesaro and urbino',
			'pescara', 'piacenza', 'pisa', 'pistoia', 'pordenone', 'potenza', 'prato', 'ragusa',
			'ravenna', 'reggio calabria', 'reggio emilia', 'rieti', 'rimini', 'rome', 'rovigo',
			'salerno', 'sassari', 'savona', 'siena', 'sondrio', 'syracuse', 'taranto', 'teramo',
			'terni', 'trapani', 'trento', 'treviso', 'trieste', 'turin', 'udine', 'varese',
			'venice', 'verbano-cusio-ossola', 'vercelli', 'verona', 'vibo valentia', 'vicenza', 'viterbo',
			'lombardy', 'lombardia', 'lazio', 'tuscany', 'toscana',
			'veneto', 'piedmont', 'piemonte', 'emilia-romagna',
			'campania', 'sicily', 'sicilia', 'sardinia', 'sardegna', 'roma', 'vatican city', 'vaticano'}) { 
            stateToCountryCodeMap.put(s, 'IT'); 
        }

        // Netherlands
        for (String s : new List<String>{
            'north holland', 'noord-holland', 'south holland', 'zuid-holland',
			'north brabant', 'noord-brabant', 'gelderland', 'utrecht', 'drenthe',
			'flevoland', 'friesland', 'groningen', 'limburg', 'overijissel', 'zeeland'}) { 
            stateToCountryCodeMap.put(s, 'NL'); 
        }

        // Sweden
        for (String s : new List<String>{
            'stockholms län','västra götalands län','skåne län', 'stockholms'}) { 
            stateToCountryCodeMap.put(s, 'SE'); 
        }

        // Finland
        for (String s : new List<String>{
            'aland', 'central finland', 'central ostrobothnia', 'kainuu',
			'kanta-hame', 'kymenlaakso', 'lapland', 'north karelia', 'north ostrobothnia',
			'north savo', 'ostrobothnia', 'paijat-hame', 'satakunta', 'south karelia',
			'south ostrobothnia', 'south savo', 'southwest finland', 'tampere region',
			'uusimaa', 'pirkanmaa', 'varsinais-suomi'}) { 
            stateToCountryCodeMap.put(s, 'FI'); 
        }

        // New Zealand
        for (String s : new List<String>{
            'auckland', 'bay of plenty', 'canterbury', 'chatham islands',
			'gisborne', 'hawkes bay', 'manawatu-wanganui', 'marlborough', 'nelson',
			'northland', 'otago', 'southland', 'taranaki', 'tasman', 'waikato', 'wellington',
			'west coast'}) { 
            stateToCountryCodeMap.put(s, 'NZ'); 
        }

        // South Africa
        for (String s : new List<String>{
            'eastern cape', 'free state', 'gauteng', 'kwazulu-natal', 'limpopo',
			'mpumalanga', 'northern cape', 'north-west', 'western cape'}) { 
            stateToCountryCodeMap.put(s, 'ZA'); 
        }

        // Switzerland
        for (String s : new List<String>{
            'aarau', 'altdorf', 'appenzell', 'basel', 'bellinzona', 'bern',
			'chur', 'delemont', 'frauenfeld', 'fribourg', 'geneva', 'glarus',
			'herisau', 'liestal', 'lucerne', 'neuchatel', 'sarnen', 'schaffhausen',
			'schwyz', 'sion', 'solothurn', 'st. gallen', 'stans', 'vaud', 'zug',
			'zurich', 'zürich', 'genève', 'ticino'}) { 
            stateToCountryCodeMap.put(s, 'CH'); 
        }

        // UAE - United Arab Emirates
        for (String s : new List<String>{
            'abu dhabi', 'ajman', 'dubay', 'dubai', 'fujayrah', 'ras al khaymah', 'sharjah', 'umm al qaywayn'}) { 
            stateToCountryCodeMap.put(s, 'AE'); 
        }

        // Japan
        for (String s : new List<String>{
            'aichi', 'akita', 'aomori', 'chiba', 'ehime', 'fukui',
			'fukuoka', 'fukushima', 'gifu', 'gunma', 'hiroshima',
			'hokkaido', 'hyogo', 'ibaragi', 'ibaraki', 'ishikawa',
			'iwate', 'kagawa', 'kagoshima', 'kanagawa', 'kochi', 'kumamoto',
			'kyoto', 'mie', 'miyagi', 'miyazaki', 'nagano', 'nagasaki', 'nara',
			'niigata', 'oita', 'okinawa', 'osaka', 'saga', 'saitama', 'shiga',
			'shimane', 'shizuoka', 'tochigi', 'tokushima', 'tokyo', 'tottori',
			'toyama', 'wakayama', 'yamagata', 'yamaguchi', 'yamanashi'}) { 
            stateToCountryCodeMap.put(s, 'JP'); 
        }

        // South Korea - Korea, Republic of
        for (String s : new List<String>{
            'busan', 'chungcheongbuk-do', 'chungcheongnam-do', 'daegu',
			'daejeon', 'gangwon-do', 'gwangju', 'gyeonggi-do', 'gyeongsangbuk-do',
			'gyeongsangnam-do', 'incheon', 'jeju-do', 'jeollabuk-do', 'jeollanam-do',
			'sejong', 'seoul', 'ulsan', 'gyeonggi'}) { 
            stateToCountryCodeMap.put(s, 'KR'); 
        }

        // China
        for (String s : new List<String>{
            'anhui', 'beijing', 'chongqing', 'fujian', 'gansu', 'guangdong',
			'guangxi', 'guizhou', 'hainan', 'hebei', 'heilongjiang', 'henan',
			'hong kong', 'hubei', 'hunan', 'jiangsu', 'jiangxi', 'jilin', 'liaoning',
			'macao', 'nei mongol', 'ningxia', 'qinghai', 'shaanxi', 'shandong',
			'shanghai', 'shanxi', 'sichuan', 'taiwan', 'tianjin', 'xinjiang', 'xizang',
			'yunnan', 'zhejiang'}) { 
            stateToCountryCodeMap.put(s, 'CN'); 
        }

        // Philippines
        for (String s : new List<String>{
            'abra', 'agusan del norte', 'agusan del sur', 'aklan', 'albay', 'antique',
			'apayao', 'aurora', 'basilan', 'bataan', 'batanes', 'batangas', 'benguet',
			'biliran', 'bohol', 'bulacan', 'cagayan', 'camarines norte', 'camarines sur',
			'camiguin', 'capiz', 'cavite', 'cebu', 'compostela valley', 'cotabato',
			'davao del norte', 'davao del sur', 'davao oriental', 'davo occidental',
			'dinagat islands', 'eastern samar', 'guimaras', 'ifugao', 'ilocos norte',
			'ilocos sur', 'iloilo', 'isabela', 'kalinga', 'laguna', 'lanao del norte',
			'lanao del sur', 'la union', 'leyte', 'maguindanao', 'marinduque', 'masbate',
			'metro manila', 'misamis occidental', 'misamis oriental', 'mountain province',
			'negros occidental', 'negros oriental', 'northern samar', 'nueva ecija',
			'nueva vizcaya', 'occidental mindoro', 'oriental mindoro', 'palawan',
			'pampanga', 'pangasinan', 'quezon', 'quirino', 'rizal', 'romblon', 'samar',
			'sarangani', 'siquijor', 'sorsogon', 'south cotabato', 'southern leyte',
			'sultan kudarat', 'sulu', 'suriago del sur', 'surigao del norte', 'tarlac',
			'tawi-tawi', 'zambales', 'zamboanga del norte', 'zamboanga del sur',
			'zamboanga sibugay', 'national capital region', 'manila', 'davao'}) { 
            stateToCountryCodeMap.put(s, 'PH'); 
        }

        // Colombia
        for (String s : new List<String>{
            'amazonas', 'antioquia', 'arauca', 'atlantico', 'bolivar',
			'boyaca', 'caldas', 'caqueta', 'casanare', 'cauca', 'cesar', 'choco',
			'cordoba', 'cundinamarca', 'distrito capital', 'guainia', 'guaviare',
			'huila', 'magdalena', 'meta', 'narino', 'norte de santander', 'putumayo',
			'quindio', 'risaralda', 'san andres y providencia', 'santander', 'sucre',
			'tolima', 'valle del cauca', 'vaupes', 'vichada', 'bogotá', 'bogota', 'cartagena',
			'valle del cauca', 'medellin', 'medellín', 'barranquilla', 'cali', 'cúcuta',
			'bucaramanga', 'pereira', 'santa marta', 'ibague', 'ibagué', 'pasto', 'manizales'}) { 
            stateToCountryCodeMap.put(s, 'CO'); 
        }

        // Argentina
        for (String s : new List<String>{
            'buenos aires', 'catamarca', 'chaco', 'chubut', 'ciudad de buenos aires',
			'cordoba', 'corrientes', 'entre rios', 'formosa', 'jujuy', 'la pampa',
			'la rioja', 'mendoza', 'misiones', 'neuquen', 'rio negro', 'salta',
			'san luis', 'santa cruz', 'santa fe', 'santiago del estero',
			'são paulo', 'tierra del fuego', 'tucuman', 'rosario', 'córdoba',
			'la plata', 'san miguel del tucumán', 'mar del plata', 'salta',
			'resistencia', 'neuquen', 'neuquén', 'san miguel del tucuman', 'curitiba'}) { 
            stateToCountryCodeMap.put(s, 'AR'); 
        }

        // Nigeria
        for (String s : new List<String>{
            'lagos', 'kano', 'ibadan', 'abuja', 'port harcourt', 'benin city',
			'maiduguri', 'zaria', 'aba', 'jos', 'ilorin', 'ogbomoso', 'rivers', 'oyo', 'kano'}) { 
            stateToCountryCodeMap.put(s, 'NG'); 
        }

        // Ireland
        for (String s : new List<String>{
            'carlow', 'cavan', 'clare', 'cork', 'donegal', 'dublin', 'galway',
			'kerry', 'kildare', 'kilkenny', 'laois', 'leitrim', 'limerick',
			'longford', 'louth', 'mayo', 'meath', 'monaghan', 'offaly', 'roscommon',
			'sligo', 'tipperary', 'waterford', 'westmeath', 'wexford', 'wicklow', 'munster',
			'connacht', 'county dublin', 'county cork'}) { 
            stateToCountryCodeMap.put(s, 'IE'); 
        }

        // Poland
        for (String s : new List<String>{
            'warsaw', 'kraków', 'łódź', 'wrocław', 'poznań', 'gdańsk', 'szczecin',
			'bydgoszcz', 'lublin', 'białystok', 'katowice', 'gdynia', 'warsaw', 'krakow',
			'lodz', 'wroclaw', 'poznan', 'gdansk', 'bialystok', 'masovia', 'masovian voivodeship',
			'lesser poland', 'greater poland', 'silesia', 'pomerania'}) { 
            stateToCountryCodeMap.put(s, 'PL'); 
        }

        // Indonesia
        for (String s : new List<String>{
            'aceh', 'bali', 'bangka-belitung', 'banten', 'gorontalo', 'jakarta raya',
			'jambi', 'jawa barat', 'jawa tengah', 'jawa timur', 'kalimantan barat',
			'kalimantan selatan', 'kalimantan tengah', 'kalimantan timur', 'kalimantan utara',
			'kepulauan riau', 'lampung', 'maluku', 'maluku utara', 'nusa tenggara barat',
			'nusa tenggara timur', 'papua', 'papua barat', 'riau', 'sulawesi barat',
			'sulawesi selatan', 'sulawesi tengah', 'sulawesi tenggara', 'sulawesi utara',
			'sumatera barat', 'sumatera selatan', 'sumatera utara', 'jakarta', 'west java',
			'east java', 'central java' }) { 
            stateToCountryCodeMap.put(s, 'ID'); 
        }

        return stateToCountryCodeMap;
    }

    // ═══════════════════════════════════════════════════════════════════
    //  MAJOR CITY → LOCATION INFERENCE
    //  When LinkedIn only gives a city with no state/country, we infer.
    //  Key = lower-case city name (after cleaning)
    //  Value = CityLocation(countryCode, stateCode)
    //  stateCode is only set for US cities.
    // ═══════════════════════════════════════════════════════════════════
    private static Map<String, CityLocation> cityInferMap;

    public static Map<String, CityLocation> getCityInferMap() {
        if (cityInferMap != null) return cityInferMap;
        cityInferMap = new Map<String, CityLocation>();

        // ── US Major Cities ──
        cityInferMap.put('new york', new CityLocation('US', 'NY'));
        cityInferMap.put('new york city', new CityLocation('US', 'NY'));
        cityInferMap.put('n.y.', new CityLocation('US', 'NY'));
        cityInferMap.put('brooklyn', new CityLocation('US', 'NY'));
        cityInferMap.put('manhattan', new CityLocation('US', 'NY'));
        cityInferMap.put('queens', new CityLocation('US', 'NY'));
        cityInferMap.put('bronx', new CityLocation('US', 'NY'));
        cityInferMap.put('staten island', new CityLocation('US', 'NY'));
        cityInferMap.put('los angeles', new CityLocation('US', 'CA'));
        cityInferMap.put('san francisco', new CityLocation('US', 'CA'));
        cityInferMap.put('san diego', new CityLocation('US', 'CA'));
        cityInferMap.put('san jose', new CityLocation('US', 'CA'));
        cityInferMap.put('oakland', new CityLocation('US', 'CA'));
        cityInferMap.put('sacramento', new CityLocation('US', 'CA'));
        cityInferMap.put('irvine', new CityLocation('US', 'CA'));
        cityInferMap.put('santa monica', new CityLocation('US', 'CA'));
        cityInferMap.put('torrance', new CityLocation('US', 'CA'));
        cityInferMap.put('carlsbad', new CityLocation('US', 'CA'));
        cityInferMap.put('capitola', new CityLocation('US', 'CA'));
        cityInferMap.put('santa cruz', new CityLocation('US', 'CA'));
        cityInferMap.put('chicago', new CityLocation('US', 'IL'));
        cityInferMap.put('park ridge', new CityLocation('US', 'IL'));
        cityInferMap.put('houston', new CityLocation('US', 'TX'));
        cityInferMap.put('dallas', new CityLocation('US', 'TX'));
        cityInferMap.put('austin', new CityLocation('US', 'TX'));
        cityInferMap.put('san antonio', new CityLocation('US', 'TX'));
        cityInferMap.put('fort worth', new CityLocation('US', 'TX'));
        cityInferMap.put('irving', new CityLocation('US', 'TX'));
        cityInferMap.put('phoenix', new CityLocation('US', 'AZ'));
        cityInferMap.put('tucson', new CityLocation('US', 'AZ'));
        cityInferMap.put('philadelphia', new CityLocation('US', 'PA'));
        cityInferMap.put('ambler', new CityLocation('US', 'PA'));
        cityInferMap.put('doylestown', new CityLocation('US', 'PA'));
        cityInferMap.put('seattle', new CityLocation('US', 'WA'));
        cityInferMap.put('denver', new CityLocation('US', 'CO'));
        cityInferMap.put('arvada', new CityLocation('US', 'CO'));
        cityInferMap.put('boulder', new CityLocation('US', 'CO'));
        cityInferMap.put('miami', new CityLocation('US', 'FL'));
        cityInferMap.put('orlando', new CityLocation('US', 'FL'));
        cityInferMap.put('tampa', new CityLocation('US', 'FL'));
        cityInferMap.put('jacksonville', new CityLocation('US', 'FL'));
        cityInferMap.put('atlanta', new CityLocation('US', 'GA'));
        cityInferMap.put('boston', new CityLocation('US', 'MA'));
        cityInferMap.put('detroit', new CityLocation('US', 'MI'));
        cityInferMap.put('minneapolis', new CityLocation('US', 'MN'));
        cityInferMap.put('nashville', new CityLocation('US', 'TN'));
        cityInferMap.put('kingsport', new CityLocation('US', 'TN'));
        cityInferMap.put('johnson city', new CityLocation('US', 'TN'));
        cityInferMap.put('charlotte', new CityLocation('US', 'NC'));
        cityInferMap.put('raleigh', new CityLocation('US', 'NC'));
        cityInferMap.put('las vegas', new CityLocation('US', 'NV'));
        cityInferMap.put('salt lake city', new CityLocation('US', 'UT'));
        cityInferMap.put('louisville', new CityLocation('US', 'KY'));
        cityInferMap.put('portland', new CityLocation('US', 'OR'));
        cityInferMap.put('bend', new CityLocation('US', 'OR'));
        cityInferMap.put('bentonville', new CityLocation('US', 'AR'));
        cityInferMap.put('springdale', new CityLocation('US', 'AR'));
        cityInferMap.put('appleton', new CityLocation('US', 'WI'));
        cityInferMap.put('milwaukee', new CityLocation('US', 'WI'));
        cityInferMap.put('piscataway', new CityLocation('US', 'NJ'));
        cityInferMap.put('washington', new CityLocation('US', 'DC'));
        cityInferMap.put('washington dc', new CityLocation('US', 'DC'));
        cityInferMap.put('pittsburgh', new CityLocation('US', 'PA'));
        cityInferMap.put('baltimore', new CityLocation('US', 'MD'));
        cityInferMap.put('indianapolis', new CityLocation('US', 'IN'));
        cityInferMap.put('columbus', new CityLocation('US', 'OH'));
        cityInferMap.put('cleveland', new CityLocation('US', 'OH'));
        cityInferMap.put('cincinnati', new CityLocation('US', 'OH'));
        cityInferMap.put('st. louis', new CityLocation('US', 'MO'));
        cityInferMap.put('kansas city', new CityLocation('US', 'MO'));
        cityInferMap.put('new orleans', new CityLocation('US', 'LA'));
        cityInferMap.put('honolulu', new CityLocation('US', 'HI'));
        cityInferMap.put('san juan', new CityLocation('US', 'PR'));

        // ── Canada ──
        cityInferMap.put('toronto', new CityLocation('CA', null));
        cityInferMap.put('montreal', new CityLocation('CA', null));
        cityInferMap.put('vancouver', new CityLocation('CA', null));
        cityInferMap.put('ottawa', new CityLocation('CA', null));
        cityInferMap.put('calgary', new CityLocation('CA', null));
        cityInferMap.put('edmonton', new CityLocation('CA', null));
        cityInferMap.put('laval', new CityLocation('CA', null));

        // ── UK ──
        cityInferMap.put('london', new CityLocation('GB', null));
        cityInferMap.put('manchester', new CityLocation('GB', null));
        cityInferMap.put('birmingham', new CityLocation('GB', null));
        cityInferMap.put('edinburgh', new CityLocation('GB', null));
        cityInferMap.put('glasgow', new CityLocation('GB', null));
        cityInferMap.put('liverpool', new CityLocation('GB', null));
        cityInferMap.put('bristol', new CityLocation('GB', null));
        cityInferMap.put('leeds', new CityLocation('GB', null));

        // ── Australia ──
        cityInferMap.put('sydney', new CityLocation('AU', null));
        cityInferMap.put('melbourne', new CityLocation('AU', null));
        cityInferMap.put('brisbane', new CityLocation('AU', null));
        cityInferMap.put('perth', new CityLocation('AU', null));
        cityInferMap.put('adelaide', new CityLocation('AU', null));
        cityInferMap.put('south wharf', new CityLocation('AU', null));

        // ── Europe ──
        cityInferMap.put('paris', new CityLocation('FR', null));
        cityInferMap.put('lyon', new CityLocation('FR', null));
        cityInferMap.put('marseille', new CityLocation('FR', null));
        cityInferMap.put('berlin', new CityLocation('DE', null));
        cityInferMap.put('munich', new CityLocation('DE', null));
        cityInferMap.put('frankfurt', new CityLocation('DE', null));
        cityInferMap.put('hamburg', new CityLocation('DE', null));
        cityInferMap.put('amsterdam', new CityLocation('NL', null));
        cityInferMap.put('rotterdam', new CityLocation('NL', null));
        cityInferMap.put('madrid', new CityLocation('ES', null));
        cityInferMap.put('barcelona', new CityLocation('ES', null));
        cityInferMap.put('rome', new CityLocation('IT', null));
        cityInferMap.put('milan', new CityLocation('IT', null));
        cityInferMap.put('lisbon', new CityLocation('PT', null));
        cityInferMap.put('dublin', new CityLocation('IE', null));
        cityInferMap.put('stockholm', new CityLocation('SE', null));
        cityInferMap.put('copenhagen', new CityLocation('DK', null));
        cityInferMap.put('oslo', new CityLocation('NO', null));
        cityInferMap.put('helsinki', new CityLocation('FI', null));
        cityInferMap.put('lohja', new CityLocation('FI', null));
        cityInferMap.put('zurich', new CityLocation('CH', null));
        cityInferMap.put('geneva', new CityLocation('CH', null));
        cityInferMap.put('vienna', new CityLocation('AT', null));
        cityInferMap.put('brussels', new CityLocation('BE', null));
        cityInferMap.put('prague', new CityLocation('CZ', null));
        cityInferMap.put('warsaw', new CityLocation('PL', null));
        cityInferMap.put('budapest', new CityLocation('HU', null));
        cityInferMap.put('bucharest', new CityLocation('RO', null));
        cityInferMap.put('athens', new CityLocation('GR', null));
        cityInferMap.put('istanbul', new CityLocation('TR', null));

        // ── Asia ──
        cityInferMap.put('tokyo', new CityLocation('JP', null));
        cityInferMap.put('osaka', new CityLocation('JP', null));
        cityInferMap.put('beijing', new CityLocation('CN', null));
        cityInferMap.put('shanghai', new CityLocation('CN', null));
        cityInferMap.put('shenzhen', new CityLocation('CN', null));
        cityInferMap.put('hong kong', new CityLocation('HK', null));
        cityInferMap.put('seoul', new CityLocation('KR', null));
        cityInferMap.put('singapore', new CityLocation('SG', null));
        cityInferMap.put('bangkok', new CityLocation('TH', null));
        cityInferMap.put('mumbai', new CityLocation('IN', null));
        cityInferMap.put('bangalore', new CityLocation('IN', null));
        cityInferMap.put('delhi', new CityLocation('IN', null));
        cityInferMap.put('hyderabad', new CityLocation('IN', null));
        cityInferMap.put('jakarta', new CityLocation('ID', null));
        cityInferMap.put('manila', new CityLocation('PH', null));
        cityInferMap.put('taipei', new CityLocation('TW', null));
        cityInferMap.put('kuala lumpur', new CityLocation('MY', null));
        cityInferMap.put('dubai', new CityLocation('AE', null));
        cityInferMap.put('abu dhabi', new CityLocation('AE', null));
        cityInferMap.put('tel aviv', new CityLocation('IL', null));

        // ── Latin America ──
        cityInferMap.put('mexico city', new CityLocation('MX', null));
        cityInferMap.put('são paulo', new CityLocation('BR', null));
        cityInferMap.put('sao paulo', new CityLocation('BR', null));
        cityInferMap.put('rio de janeiro', new CityLocation('BR', null));
        cityInferMap.put('bogotá', new CityLocation('CO', null));
        cityInferMap.put('bogota', new CityLocation('CO', null));
        cityInferMap.put('buenos aires', new CityLocation('AR', null));
        cityInferMap.put('lima', new CityLocation('PE', null));
        cityInferMap.put('santiago', new CityLocation('CL', null));

        // ── Africa ──
        cityInferMap.put('cape town', new CityLocation('ZA', null));
        cityInferMap.put('johannesburg', new CityLocation('ZA', null));
        cityInferMap.put('nairobi', new CityLocation('KE', null));
        cityInferMap.put('lagos', new CityLocation('NG', null));
        cityInferMap.put('cairo', new CityLocation('EG', null));

        // ── New Zealand ──
        cityInferMap.put('auckland', new CityLocation('NZ', null));
        cityInferMap.put('wellington', new CityLocation('NZ', null));
        cityInferMap.put('warkworth', new CityLocation('NZ', null));

        return cityInferMap;
    }

    // ═══════════════════════════════════════════════════════════════════
    //  PUBLIC LOOKUP METHODS
    // ═══════════════════════════════════════════════════════════════════

    public static String getCountryCode(String raw) {
        if (String.isBlank(raw)) return null;
        Map<String, String> m = getCountryCodeMap();
        return m.get(raw.trim().toLowerCase());
    }

    public static Boolean isKnownCountry(String value) {
        return getCountryCode(value) != null;
    }

    public static String getUSStateCode(String raw) {
        if (String.isBlank(raw)) return null;
        Map<String, String> m = getUSStateCodeMap();
        return m.get(raw.trim().toLowerCase());
    }

    public static Boolean isUSState(String value) {
        return getUSStateCode(value) != null;
    }

    public static Boolean isKnownState(String value) {
        if (String.isBlank(value)) return false;
        return getStateToCountryCodeMap().containsKey(value.trim().toLowerCase());
    }

    public static String getCountryCodeForState(String state) {
        if (String.isBlank(state)) return null;
        Map<String, String> m = getStateToCountryCodeMap();
        return m.get(state.trim().toLowerCase());
    }

    /** Look up inferred location from a cleaned city name. Returns null if unknown. */
    public static CityLocation inferFromCity(String cleanedCity) {
        if (String.isBlank(cleanedCity)) return null;
        Map<String, CityLocation> m = getCityInferMap();
        return m.get(cleanedCity.trim().toLowerCase());
    }

    // ═══════════════════════════════════════════════════════════════════
    //  INNER CLASS
    // ═══════════════════════════════════════════════════════════════════
    public class CityLocation {
        public String countryCode;
        public String stateCode;
        public CityLocation(String countryCode, String stateCode) {
            this.countryCode = countryCode;
            this.stateCode = stateCode;
        }
    }
}