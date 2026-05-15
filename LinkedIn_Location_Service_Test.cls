/**
 * LinkedInLocationServiceTest
 *
 * Coverage: LinkedInLocationService, LinkedInLocationData, LinkedInLocationTrigger
 */
@isTest
private class LinkedInLocationServiceTest {

    // ═══════════════════════════════════════════════════════════════════
    //  DATA — Country codes
    // ═══════════════════════════════════════════════════════════════════

    // Notes by Eloy
    // 
    // Explanation for the following code:
    // 
    // System.assertEquals('US', LinkedInLocationData.getCountryCode('United States'));
    // 
    // The value on the left side 'US' is what is expected to receive back from the class
    // LinkedInLocationData.getCountryCode() when the text 'United States' is received
    // as input (the text on the right side within the parentheses).
    // 
    // End notes by Eloy
    
    
    @isTest
    static void testData_CountryCodes() {
        System.assertEquals('US', LinkedInLocationData.getCountryCode('United States'));
        System.assertEquals('US', LinkedInLocationData.getCountryCode('USA'));
        System.assertEquals('SE', LinkedInLocationData.getCountryCode('Sverige'));
        System.assertEquals('DE', LinkedInLocationData.getCountryCode('Deutschland'));
        System.assertEquals('GB', LinkedInLocationData.getCountryCode('England'));
        System.assertEquals('BR', LinkedInLocationData.getCountryCode('Brasil'));
        System.assertEquals('CH', LinkedInLocationData.getCountryCode('Schweiz'));
        System.assertEquals(null, LinkedInLocationData.getCountryCode('Wakanda'));
        // New test code entered by Eloy.
        System.assertEquals(null, LinkedInLocationData.getCountryCode('US of America'));
        System.assertEquals('AG', LinkedInLocationData.getCountryCode('antigua and barbuda'));
        System.assertEquals('AG', LinkedInLocationData.getCountryCode('ag'));
        System.assertEquals('AR', LinkedInLocationData.getCountryCode('Argentina'));
        System.assertEquals('CM', LinkedInLocationData.getCountryCode('CAMEROON'));
        System.assertEquals('YE', LinkedInLocationData.getCountryCode('ye'));
    }

    // ═══════════════════════════════════════════════════════════════════
    //  DATA — US state codes
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testData_USStateCodes() {
        System.assertEquals('CA', LinkedInLocationData.getUSStateCode('California'));
        System.assertEquals('TX', LinkedInLocationData.getUSStateCode('texas'));
        System.assertEquals('NY', LinkedInLocationData.getUSStateCode('New York'));
        System.assertEquals(null, LinkedInLocationData.getUSStateCode('Ontario'));
        // New test code entered by Eloy.
        System.assertEquals('TX', LinkedInLocationData.getUSStateCode('Texas'));
        System.assertEquals('TX', LinkedInLocationData.getUSStateCode('tx'));
        System.assertEquals(null, LinkedInLocationData.getUSStateCode('Commonwealth of Virginia'));
        System.assertEquals('VA', LinkedInLocationData.getUSStateCode('Virginia'));
        System.assertEquals('VA', LinkedInLocationData.getUSStateCode('VA'));
        System.assertEquals('VI', LinkedInLocationData.getUSStateCode('u.s. virgin islands'));
        System.assertEquals('SD', LinkedInLocationData.getUSStateCode('south dakota'));
        System.assertEquals('DC', LinkedInLocationData.getUSStateCode('district of columbia'));
        System.assertEquals(null, LinkedInLocationData.getUSStateCode('columbia'));
    }

    // ═══════════════════════════════════════════════════════════════════
    //  DATA — State → Country extrapolation
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testData_StateToCountry() {
        System.assertEquals('US', LinkedInLocationData.getCountryCodeForState('California'));
        System.assertEquals('CA', LinkedInLocationData.getCountryCodeForState('Ontario'));
        System.assertEquals('AU', LinkedInLocationData.getCountryCodeForState('Victoria'));
        System.assertEquals('GB', LinkedInLocationData.getCountryCodeForState('England'));
        System.assertEquals('SE', LinkedInLocationData.getCountryCodeForState('Stockholms län'));
        System.assertEquals(null, LinkedInLocationData.getCountryCodeForState('Narnia'));
        // New test code entered by Eloy.
        System.assertEquals('CA', LinkedInLocationData.getCountryCodeForState('British Columbia'));
        System.assertEquals('CA', LinkedInLocationData.getCountryCodeForState('BC'));
        System.assertEquals('AU', LinkedInLocationData.getCountryCodeForState('NSW'));
        System.assertEquals('AU', LinkedInLocationData.getCountryCodeForState('New South Wales'));
        System.assertEquals('MX', LinkedInLocationData.getCountryCodeForState('Sinaloa'));
        System.assertEquals('MX', LinkedInLocationData.getCountryCodeForState('PUE'));
        System.assertEquals('FR', LinkedInLocationData.getCountryCodeForState('Ile-de-France'));
        System.assertEquals('FR', LinkedInLocationData.getCountryCodeForState('île-de-france'));
        System.assertEquals('FR', LinkedInLocationData.getCountryCodeForState('Basse-Normandie'));
        System.assertEquals('FR', LinkedInLocationData.getCountryCodeForState('IDF'));
        System.assertEquals('IE', LinkedInLocationData.getCountryCodeForState('Cork'));
        System.assertEquals('IE', LinkedInLocationData.getCountryCodeForState('Dublin'));
    }

    // ═══════════════════════════════════════════════════════════════════
    //  DATA — City inference
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testData_CityInference_US() {
        LinkedInLocationData.CityLocation cl = LinkedInLocationData.inferFromCity('Austin');
        System.assertEquals('US', cl.countryCode);
        System.assertEquals('TX', cl.stateCode);

        cl = LinkedInLocationData.inferFromCity('Brooklyn');
        System.assertEquals('US', cl.countryCode);
        System.assertEquals('NY', cl.stateCode);

        cl = LinkedInLocationData.inferFromCity('Denver');
        System.assertEquals('US', cl.countryCode);
        System.assertEquals('CO', cl.stateCode);
        
        // New test code entered by Eloy.
        cl = LinkedInLocationData.inferFromCity('fort worth');
        System.assertEquals('US', cl.countryCode);
        System.assertEquals('TX', cl.stateCode);
        
        cl = LinkedInLocationData.inferFromCity('kingsport');
        System.assertEquals('US', cl.countryCode);
        System.assertEquals('TN', cl.stateCode);
    }

    @isTest
    static void testData_CityInference_International() {
        LinkedInLocationData.CityLocation cl = LinkedInLocationData.inferFromCity('London');
        System.assertEquals('GB', cl.countryCode);
        System.assertEquals(null, cl.stateCode);

        cl = LinkedInLocationData.inferFromCity('Sydney');
        System.assertEquals('AU', cl.countryCode);

        cl = LinkedInLocationData.inferFromCity('Tokyo');
        System.assertEquals('JP', cl.countryCode);

        cl = LinkedInLocationData.inferFromCity('Stockholm');
        System.assertEquals('SE', cl.countryCode);
        
        // New test code entered by Eloy.
        cl = LinkedInLocationData.inferFromCity('frankfurt');
        System.assertEquals('DE', cl.countryCode);

        cl = LinkedInLocationData.inferFromCity('hyderabad');
        System.assertEquals('IN', cl.countryCode);
    }

    @isTest
    static void testData_CityInference_Unknown() {
        System.assertEquals(null, LinkedInLocationData.inferFromCity('Smallville'));
        System.assertEquals(null, LinkedInLocationData.inferFromCity(null));
    }

    // ═══════════════════════════════════════════════════════════════════
    //  SERVICE — Parser
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testParse_ThreePart() {
        LinkedInLocationService.LocationParts lp =
            LinkedInLocationService.parseLocation('Austin, Texas, United States');
        System.assertEquals('Austin',        lp.city);
        System.assertEquals('Texas',         lp.rawState);
        System.assertEquals('United States', lp.rawCountry);
    }

    @isTest
    static void testParse_TwoPart_Duplicate() {
        LinkedInLocationService.LocationParts lp =
            LinkedInLocationService.parseLocation('United States, United States');
        System.assertEquals(null,            lp.city);
        System.assertEquals('United States', lp.rawCountry);
    }

    @isTest
    static void testParse_OnePart_CityOnly() {
        LinkedInLocationService.LocationParts lp =
            LinkedInLocationService.parseLocation('Brooklyn');
        System.assertEquals('Brooklyn', lp.city);
        System.assertEquals(null,       lp.rawCountry);
        System.assertEquals(null,       lp.rawState);
    }

    @isTest
    static void testParse_ThreePart_DuplicateCountry() {
        LinkedInLocationService.LocationParts lp =
            LinkedInLocationService.parseLocation('London Area, United Kingdom, United Kingdom');
        System.assertEquals('London Area',    lp.city);
        System.assertEquals(null,             lp.rawState);
        System.assertEquals('United Kingdom', lp.rawCountry);
    }

    @isTest
    static void testParse_BlankAndNull() {
        System.assertEquals(null, LinkedInLocationService.parseLocation('').city);
        System.assertEquals(null, LinkedInLocationService.parseLocation(null).city);
    }

    // ═══════════════════════════════════════════════════════════════════
    //  SERVICE — Enrichment with city inference
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testEnrich_CityOnly_InfersUSLocation() {
        LinkedInLocationService.LocationParts lp = new LinkedInLocationService.LocationParts();
        lp.city = 'Denver';

        LinkedInLocationService.enrichParsedLocation(lp);

        System.assertEquals('US', lp.countryCode);
        System.assertEquals('CO', lp.stateCode);
    }

    @isTest
    static void testEnrich_CityOnly_InfersInternational() {
        LinkedInLocationService.LocationParts lp = new LinkedInLocationService.LocationParts();
        lp.city = 'London';

        LinkedInLocationService.enrichParsedLocation(lp);

        System.assertEquals('GB', lp.countryCode);
        System.assertEquals(null, lp.stateCode);
    }

    @isTest
    static void testEnrich_MetroArea_InfersAfterCleaning() {
        // "Los Angeles Metropolitan Area" → cleaned to "Los Angeles" → inferred to US/CA
        LinkedInLocationService.LocationParts lp = new LinkedInLocationService.LocationParts();
        lp.city = 'Los Angeles Metropolitan Area';

        LinkedInLocationService.enrichParsedLocation(lp);

        System.assertEquals('US', lp.countryCode);
        System.assertEquals('CA', lp.stateCode);
    }

    @isTest
    static void testEnrich_USCountryKnown_StateInferredFromCity() {
        // Country is US but no state parsed — infer state from city
        LinkedInLocationService.LocationParts lp = new LinkedInLocationService.LocationParts();
        lp.city = 'Nashville';
        lp.rawCountry = 'United States';

        LinkedInLocationService.enrichParsedLocation(lp);

        System.assertEquals('US', lp.countryCode);
        System.assertEquals('TN', lp.stateCode);
    }

    @isTest
    static void testEnrich_UnknownCity_NoInference() {
        LinkedInLocationService.LocationParts lp = new LinkedInLocationService.LocationParts();
        lp.city = 'Smallville';

        LinkedInLocationService.enrichParsedLocation(lp);

        System.assertEquals(null, lp.countryCode);
        System.assertEquals(null, lp.stateCode);
    }

    // ═══════════════════════════════════════════════════════════════════
    //  SERVICE — City cleaning
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testCleanCity() {
        System.assertEquals('Los Angeles',
            LinkedInLocationService.cleanCityName('Los Angeles Metropolitan Area'));
        System.assertEquals('Chicago',
            LinkedInLocationService.cleanCityName('Greater Chicago Area'));
        System.assertEquals('Philadelphia',
            LinkedInLocationService.cleanCityName('Greater Philadelphia'));
        System.assertEquals('San Francisco',
            LinkedInLocationService.cleanCityName('San Francisco Bay Area'));
        System.assertEquals('Dallas-Fort Worth',
            LinkedInLocationService.cleanCityName('Dallas-Fort Worth Metroplex'));
        System.assertEquals('Austin',
            LinkedInLocationService.cleanCityName('Austin'));
    }

    @isTest
    static void testCleanCity_CatchAllArea() {
        // Trailing " Area" on non-standard patterns
        String result = LinkedInLocationService.cleanCityName(
            'Greensboro--Winston-Salem--High Point Area');
        System.assert(result.endsWith('High Point'), 'Should strip trailing Area');
    }

    // ═══════════════════════════════════════════════════════════════════
    //  INTEGRATION — Trigger tests
    // ═══════════════════════════════════════════════════════════════════

    @isTest
    static void testTrigger_Insert_US_Full() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'User', AccountId = a.Id,
            LinkedIn_Location__c = 'Austin, Texas, United States'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingStateCode, MailingCountryCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Austin', r.MailingCity);
        System.assertEquals('TX',     r.MailingStateCode);
        System.assertEquals('US',     r.MailingCountryCode);
    }

    @isTest
    static void testTrigger_Insert_Sweden() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'Swedish', AccountId = a.Id,
            LinkedIn_Location__c = 'Stockholm, Stockholms län, Sverige'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingCountryCode, MailingStateCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Stockholm', r.MailingCity);
        System.assertEquals('SE',        r.MailingCountryCode);
        System.assertEquals(null,        r.MailingStateCode);
    }

    @isTest
    static void testTrigger_Insert_CityOnly_Inferred() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'CityOnly', AccountId = a.Id,
            LinkedIn_Location__c = 'Brooklyn'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingStateCode, MailingCountryCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Brooklyn', r.MailingCity);
        System.assertEquals('NY',       r.MailingStateCode);
        System.assertEquals('US',       r.MailingCountryCode);
    }

    @isTest
    static void testTrigger_Insert_MetroArea_Inferred() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'Metro', AccountId = a.Id,
            LinkedIn_Location__c = 'Los Angeles Metropolitan Area'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingStateCode, MailingCountryCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Los Angeles', r.MailingCity);
        System.assertEquals('CA',          r.MailingStateCode);
        System.assertEquals('US',          r.MailingCountryCode);
    }

    @isTest
    static void testTrigger_ClearsStreetAndZip() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'Mover', AccountId = a.Id,
            MailingStreet = '123 Old Street',
            MailingPostalCode = '80202',
            MailingCity = 'Denver',
            MailingStateCode = 'CO',
            MailingCountryCode = 'US'
        );
        insert c;

        // Person moves — LinkedIn updates
        c.LinkedIn_Location__c = 'Austin, Texas, United States';

        Test.startTest();
        update c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingStateCode, MailingCountryCode,
                            MailingStreet, MailingPostalCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Austin', r.MailingCity);
        System.assertEquals('TX',     r.MailingStateCode);
        System.assertEquals('US',     r.MailingCountryCode);
        System.assertEquals(null,     r.MailingStreet);
        System.assertEquals(null,     r.MailingPostalCode);
    }

    @isTest
    static void testTrigger_NoChange_DoesNotClearStreet() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'Static', AccountId = a.Id,
            MailingStreet = '456 Current Ave',
            MailingPostalCode = '78701',
            MailingCity = 'Austin',
            MailingStateCode = 'TX',
            MailingCountryCode = 'US',
            LinkedIn_Location__c = null
        );
        insert c;

        Contact r = [SELECT MailingStreet, MailingPostalCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('456 Current Ave', r.MailingStreet);
        System.assertEquals('78701',           r.MailingPostalCode);
    }

    @isTest
    static void testTrigger_CountryOnly_DoesNotOverwrite() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'Existing', AccountId = a.Id,
            MailingCity = 'Denver', MailingStateCode = 'CO',
            MailingCountryCode = 'US'
        );
        insert c;

        c.LinkedIn_Location__c = 'United States, United States';

        Test.startTest();
        update c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingStateCode, MailingCountryCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Denver', r.MailingCity);
        System.assertEquals('CO',     r.MailingStateCode);
        System.assertEquals('US',     r.MailingCountryCode);
    }

    @isTest
    static void testTrigger_BulkInsert() {
        Account a = new Account(Name = 'Bulk Account');
        insert a;

        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 200; i++) {
            contacts.add(new Contact(
                FirstName = 'Bulk', LastName = 'User' + i, AccountId = a.Id,
                LinkedIn_Location__c = 'Chicago, Illinois, United States'
            ));
        }

        Test.startTest();
        insert contacts;
        Test.stopTest();

        List<Contact> results = [SELECT MailingCity, MailingStateCode, MailingCountryCode
                                 FROM Contact WHERE AccountId = :a.Id];
        System.assertEquals(200, results.size());
        for (Contact r : results) {
            System.assertEquals('Chicago', r.MailingCity);
            System.assertEquals('IL',      r.MailingStateCode);
            System.assertEquals('US',      r.MailingCountryCode);
        }
    }

    @isTest
    static void testTrigger_NZ() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'Kiwi', AccountId = a.Id,
            LinkedIn_Location__c = 'Warkworth, Auckland, New Zealand'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingCountryCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Warkworth', r.MailingCity);
        System.assertEquals('NZ',        r.MailingCountryCode);
    }

    @isTest
    static void testTrigger_DominicanRepublic() {
        Account a = new Account(Name = 'Test Account');
        insert a;

        Contact c = new Contact(
            FirstName = 'Test', LastName = 'DR', AccountId = a.Id,
            LinkedIn_Location__c = 'Distrito Nacional, Dominican Republic'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Contact r = [SELECT MailingCity, MailingCountryCode
                     FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Distrito Nacional', r.MailingCity);
        System.assertEquals('DO',                r.MailingCountryCode);
    }
}