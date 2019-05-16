@isTest
private class ApexHomeworkTests {
    
    @TestSetup
    static void makeData() {
        Date testCloseDate = Date.newInstance(2011, 1, 1);
        
        
        Account smallAccount = new Account(name = 'Small Company', NumberOfEmployees = 100);
        Account mediumAccount = new Account(name = 'Medium Company', NumberOfEmployees = 3000);
        Account largeAccount = new Account(name = 'Large Company', NumberOfEmployees = 100001);
        List<Account> accounts = new List<Account>{smallAccount, mediumAccount, largeAccount};
        insert accounts;
        
        Lead CALead = new Lead(lastname = 'Cal', state = 'CA', status = 'Open - Not Contacted', company = 'SOCAL');
        Lead GALead = new Lead(lastname = 'George', state = 'GA', description = 'Welcome to Atlanta', status = 'Working - Contacted', company = 'ATL');
        List<Lead> leads = new List<Lead>{CALead, GALead};
        insert leads;
        
        Opportunity newOpp = new Opportunity(closedate = system.today() + 7, name = 'New Opportunity', stagename = 'Prospecting', 
                                             AccountId = [Select Id From Account where name = 'Small Company'].Id);
        Opportunity oldOpp = new Opportunity(closedate = testCloseDate, name = 'Old Opportunity', stagename = 'Prospecting',
                                            AccountId= [Select Id From Account where name = 'Medium Company'].Id);
        Opportunity wonOpp = new Opportunity(closedate = testCloseDate, name = 'Won Opportunity', stagename = 'Closed Won',
                                            AccountId= [Select Id From Account where name = 'Large Company'].Id);
        List<Opportunity> opportunities = new List<Opportunity>{newOpp, oldOpp, wonOpp};
        insert opportunities;
    }
    
    @isTest
    public static void FibonacciTests(){
        //nFibonacci
        Integer fibResult = ApexHomework.nFibonacci(0);
        system.assertEquals(0, fibResult);
        
        fibResult = ApexHomework.nFibonacci(1);
        system.assertEquals(1, 1);
        
        fibResult = ApexHomework.nFibonacci(2);
        system.assertEquals(1, fibResult);
        
        fibResult = ApexHomework.nFibonacci(10);
        system.assertEquals(55, fibResult);
    }
    
    @isTest
    public static void sortTests(){
        //sortArray
        List<Integer> testData = new List<Integer>{2,4,5,1,3,1};            
        List<Integer> expectedResult = new List<Integer>{1,1,2,3,4,5}; 
        List<Integer> sortedList = ApexHomework.sortArray(testData);

        system.assertEquals(expectedResult, sortedList);
        
        testData = new Integer[]{5,4,3,2,1};
        expectedResult = new List<Integer>{1,2,3,4,5}; 
        sortedList = ApexHomework.sortArray(testData);

        system.assertEquals(expectedResult, sortedList);
    }
    
    @isTest
    public static void FactorialTests(){
        //nFactorial
        Integer facResult = ApexHomework.nFactorial(0);
        system.assertEquals(1, facResult);
        
        facResult = ApexHomework.nFactorial(1);
        system.assertEquals(1, facResult);
        
        facResult = ApexHomework.nFactorial(3);
        system.assertEquals(6, facResult);
		
        facResult = ApexHomework.nFactorial(5);
        system.assertEquals(120, facResult);
    }
    
    @isTest
    public static void rotateTests(){
        //rotateLeftNTimes
        List<Integer> testData = new List<Integer>{1,2,3,4,5};
        List<Integer> expectedResult = new List<Integer>{2,3,4,5,1}; 
        List<Integer> rotatedList = ApexHomework.rotateLeftNTimes(testData, 1);
        system.assertEquals(expectedResult, rotatedList);
        
        testData = new List<Integer>{1,2,3,4,5};
        expectedResult = new List<Integer>{2,3,4,5,1}; 
        rotatedList = ApexHomework.rotateLeftNTimes(testData, 6);
        system.assertEquals(expectedResult, rotatedList);
        
        testData = new List<Integer>{1,2,3,4,5};
        expectedResult = new List<Integer>{4,5,1,2,3}; 
        rotatedList = ApexHomework.rotateLeftNTimes(testData, 3);
        system.assertEquals(expectedResult, rotatedList);
    }
    
    @isTest
    public static void bracketTests(){
        //bracketsAreBalanced
        String bracketOne = '()';
        String bracketTwo = '()()';
        String bracketThree = '(()';
        String bracketFour = '( { [ ] } )';
        String bracketFive = '( [ ) ]';
        String bracketSix = '([])';
        
        system.assertEquals(true, ApexHomework.bracketsAreBalanced( bracketOne ));
        system.assertEquals(true, ApexHomework.bracketsAreBalanced( bracketTwo ));
        system.assertEquals(false, ApexHomework.bracketsAreBalanced( bracketThree ));
        system.assertEquals(true, ApexHomework.bracketsAreBalanced( bracketFour ));
        system.assertEquals(false, ApexHomework.bracketsAreBalanced( bracketFive ));
        system.assertEquals(true, ApexHomework.bracketsAreBalanced( bracketSix ));
    }
    
    @isTest
    public static void updateAccountTest(){
        ApexHomework.updateAccountSize();
        
        Account smallCom = [SELECT Id, size__c FROM Account WHERE name = 'Small Company' LIMIT 1];
        Account mediumCom = [SELECT name, size__c FROM Account WHERE name = 'Medium Company' LIMIT 1];
        
        system.assertEquals('small', smallCom.Size__c);
    }
    
    @isTest
    public static void updateCALeadsTest(){
        ApexHomework.updateCALeads();
        
        Lead Cali = [SELECT name, status, description FROM Lead WHERE state = 'CA' LIMIT 1];
        Lead Geo = [SELECT name, status, description FROM Lead WHERE state = 'GA' LIMIT 1];
        
        system.assertEquals('Closed - Not Converted', Cali.Status);
        system.assertNotEquals('Closed - Not Converted', Geo.Status);
    }
    
    @isTest
    public static void closePastDueOpportunitiesTest(){
        ApexHomework.closePastDueOpportunities();
        
        Opportunity newOpp = [SELECT name, stagename FROM Opportunity WHERE name = 'New Opportunity' LIMIT 1];
        Opportunity oldOpp = [SELECT name, stagename FROM Opportunity WHERE name = 'Old Opportunity' LIMIT 1];
        Opportunity wonOpp = [SELECT name, stagename FROM Opportunity WHERE name = 'Won Opportunity' LIMIT 1];
        
        system.assertNotEquals('Closed Lost', newOpp.StageName);
        system.assertEquals('Closed Lost', oldOpp.StageName);
        //Test Negative
        system.assertNotEquals('Closed Lost', wonOpp.StageName);
    }
    
}