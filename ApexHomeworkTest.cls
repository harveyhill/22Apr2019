@isTest
private with sharing class ApexHomeworkTest {
    
    @TestSetup
    static void makeData() {
        UtilityDataFactory.makeAccountsStepEmployees(25, 500);
        UtilityDataFactory.makeCALeads(5);
        Date today = System.today();
        UtilityDataFactory.makeOpportunities(today.addDays(-10), today.addDays(10));
    }

    @isTest
    public static void testnFibonacci() {
        // test positive
        System.assertEquals(55, AssessmentMay10.nFibonacci(10));
        System.assertEquals(3, AssessmentMay10.nFibonacci(4));
        System.assertEquals(34, AssessmentMay10.nFibonacci(9));
        // test negative
        System.assertEquals(-1, AssessmentMay10.nFibonacci(-5));
    }

    @isTest
    public static void testsortArray() {
        // test positive
        List<Integer> input = new List<Integer>{2,4,5,1,3,1};
        List<Integer> expected = new List<Integer>{1,1,2,3,4,5};
        System.assertEquals(expected, AssessmentMay10.sortArray(input));
        
        input = new List<Integer>{5,4,3,2,1};
        expected = new List<Integer>{1,2,3,4,5};
        System.assertEquals(expected, AssessmentMay10.sortArray(input));

        // test negative
        // test for empty array
        List<Integer> empty = new List<Integer>();
        System.assertEquals(empty, AssessmentMay10.sortArray(empty));
    }

    @isTest
    public static void testnFactorial() {
        // test positive
        System.assertEquals(120, AssessmentMay10.nFactorial(5));
        System.assertEquals(5040, AssessmentMay10.nFactorial(7));
        // test negative
        System.assertEquals(-120, AssessmentMay10.nFactorial(-5));
        System.assertEquals(-24, AssessmentMay10.nFactorial(-4));
    }

    @isTest
    public static void testrotateLeftNTimes() {
        // test positive
        List<Integer> input = new List<Integer>{1, 2, 3, 4, 5, 6, 7};
        List<Integer> expected = new List<Integer>{2, 3, 4, 5, 6, 7, 1};
        System.assertEquals(expected, AssessmentMay10.rotateLeftNTimes(input, 1));
        // test negative
        input = new List<Integer>{1, 2, 3, 4, 5, 6, 7};
        expected = new List<Integer>{7, 1, 2, 3, 4, 5, 6};
        System.assertEquals(expected, AssessmentMay10.rotateLeftNTimes(input, -1));
    }

    @isTest
    public static void testbracketsAreBalanced() {
        // test positive
        List<String> good = new List<String>{
            // test positive
            '( )',
            '( ) ( )',
            '( ( ) )',
            '( { [ ] } )',
            // test negative
            '',
            'testing string!@#$%^&*'
        };
        List<String> bad = new List<String>{
            // test positive
            '(',
            ')',
            '( ( )',
            '( [ ) ]'
        };

        for (String input : good) {
            System.assertEquals(true, AssessmentMay10.bracketsAreBalanced(input));
        }
        for (String input : bad) {
            System.assertEquals(false, AssessmentMay10.bracketsAreBalanced(input));
        }

        // test negative
        String empty = '';
        System.assertEquals(true, AssessmentMay10.bracketsAreBalanced(empty));
    }

    @isTest
    public static void testupdateAccountSize() {
        AssessmentMay10.updateAccountSize();
        // test data also includes both empty and negative values for NumberOfEmployees field
        Account acc = [SELECT size__c FROM Account WHERE NumberOfEmployees < 1000 LIMIT 1];
        System.assertEquals('Small', acc.size__c);
    }

    @isTest
    public static void testupdateCALeads() {
        AssessmentMay10.updateCALeads();
        // test data also includes empty values for state field
        System.assertEquals('Closed - Not Converted', [SELECT status, state FROM Lead WHERE state = 'CA' LIMIT 1].status);
    }
    
    @isTest
    public static void testclosePastDueOpportunities() {
        AssessmentMay10.closePastDueOpportunities();
        List<Opportunity> opps = [SELECT CloseDate, StageName FROM Opportunity 
                                WHERE CloseDate < TODAY AND StageName != 'Closed Lost' AND StageName != 'Closed Won'];

        System.assertEquals(true, opps.Size() == 0? true: false);
    }
}
