@isTest
private class TitleStandardizerTest {

    private static void assertTitle(String input, String expected) {
        String actual = TitleStandardizer.standardize(input);
        System.assertEquals(
            expected, actual,
            'Input: "' + input + '"  |  Expected: "' + expected + '"  |  Got: "' + actual + '"'
        );
    }

    @isTest static void test_01_seniorManagerAtEnd() {
        assertTitle('Consumer Insights Manager Senior', 'Sr. Mgr. Consumer Insights');
    }
    @isTest static void test_02_seniorManagerMiddle() {
        assertTitle('Human Insights Senior Manager Europe', 'Sr. Mgr. Human Insights Europe');
    }
    @isTest static void test_03_associateDirector() {
        assertTitle('Associate Director of Insights', 'Assoc. Dir. of Insights');
    }
    @isTest static void test_04_seniorDirector() {
        assertTitle('Senior Director of Insights', 'Sr. Dir. of Insights');
    }
    @isTest static void test_05_execDirBuComma() {
        assertTitle('Executive Director, US Primary Market Research',
                    'Exec. Dir. US Primary Market Research');
    }
    @isTest static void test_06_vpBuComma() {
        assertTitle('Consumer Insights Vice President, Marketing Analytics',
                    'VP Consumer Insights - Marketing Analytics');
    }
    @isTest static void test_07_mdBuComma() {
        assertTitle('Managing Director, EMEA', 'MD - EMEA');
    }
    @isTest static void test_08_mgrBuComma() {
        assertTitle('Insights manager, EMEA', 'Mgr. Insights - EMEA');
    }
    @isTest static void test_09_leadBuComma() {
        assertTitle('Consumer & Shopper Insights Lead, NA Grooming & Beauty',
                    'Lead Consumer & Shopper Insights - NA Grooming & Beauty');
    }
    @isTest static void test_10_mgrBuDashWithTrailingComma() {
        assertTitle('Insights Manager - New Categories, Europe',
                    'Mgr. Insights - New Categories, Europe');
    }
    @isTest static void test_11_allLowercaseWithDash() {
        assertTitle('insights - sweet treats senior manager',
                    'Sr. Mgr. Insights - Sweet Treats');
    }
    @isTest static void test_12_alreadyFormattedLowercaseBu() {
        assertTitle('Sr. Mgr. CMI - axe global', 'Sr. Mgr. CMI - Axe Global');
    }
    @isTest static void test_13_alreadyFormatted() {
        assertTitle('Sr. Mgr. Customer Segmentation & Lifecycle Marketing',
                    'Sr. Mgr. Customer Segmentation & Lifecycle Marketing');
    }
    @isTest static void test_14_dirAlreadyAbbrev() {
        assertTitle('Dir. Consumer & Market Insights', 'Dir. Consumer & Market Insights');
    }
    @isTest static void test_15_vpColon() {
        assertTitle('VP Insight: Personal Care', 'VP Insight: Personal Care');
    }
    @isTest static void test_16_ceo() {
        assertTitle('Chief Executive Officer', 'CEO');
    }
    @isTest static void test_17_cmo() {
        assertTitle('Chief Marketing Officer', 'CMO');
    }
    @isTest static void test_18_cooWithBu() {
        assertTitle('Chief Operating Officer, North America', 'COO - North America');
    }
    @isTest static void test_19_headOf() {
        assertTitle('Head of Consumer Futures and Portfolio Insight',
                    'Head Consumer Futures and Portfolio Insight');
    }
    @isTest static void test_20_headOfWithPrincipalBu() {
        assertTitle('Head of Insights, Amazon Fresh Grocery (Principal)',
                    'Head Principal Insights - Amazon Fresh Grocery');
    }
    @isTest static void test_21_leadAtEnd() {
        assertTitle('CMI Lead', 'Lead CMI');
    }
    @isTest static void test_22_leadAtStart() {
        assertTitle('Lead CMI Home & Hygiene', 'Lead CMI Home & Hygiene');
    }
    @isTest static void test_23_trailingComma() {
        assertTitle('Consumer & Product Insights, Senior Manager',
                    'Sr. Mgr. Consumer & Product Insights');
    }
    @isTest static void test_24_drToDir() {
        assertTitle('Dr Marketing', 'Dir. Marketing');
    }
    @isTest static void test_25_svpExpand() {
        assertTitle('Global SVP Consumer Insights', 'Sr. VP Global Consumer Insights');
    }
    @isTest static void test_26_analyst() {
        assertTitle('Human Insights Analyst', 'Analyst Human Insights');
    }
    @isTest static void test_27_srAnalyst() {
        assertTitle('Senior Analyst Consumer Insights', 'Sr. Analyst Consumer Insights');
    }
    @isTest static void test_28_coordinator() {
        assertTitle('Consumer Insights Coordinator', 'Coordinator Consumer Insights');
    }
    @isTest static void test_29_principalBu() {
        assertTitle('Principal, Consumer Research', 'Principal - Consumer Research');
    }
    @isTest static void test_30_junior() {
        assertTitle('Junior Category Insights Manager', 'Jr. Mgr. Category Insights');
    }
    @isTest static void test_blank() {
        System.assertEquals(null,  TitleStandardizer.standardize(null));
        System.assertEquals('',    TitleStandardizer.standardize(''));
        System.assertEquals('   ', TitleStandardizer.standardize('   '));
    }
    @isTest static void test_ceoLowercase() {
        assertTitle('ceo', 'CEO');
    }
    @isTest static void test_noDotDash() {
        assertTitle('Senior Manager - EMEA', 'Sr. Mgr. EMEA');
    }

    @isTest static void test_trigger() {
        Contact c = new Contact(
            LastName = 'TestContact',
            Title = 'Senior Manager Consumer Insights'
        );
        insert c;
        Contact result = [SELECT Title FROM Contact WHERE Id = :c.Id];
        System.assertEquals('Sr. Mgr. Consumer Insights', result.Title);
    }
}