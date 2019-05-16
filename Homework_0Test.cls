@isTest
public with sharing class Homework_0Test {
    @TestSetup
     static void makeDate(){

        Account Acct1 = new Account(Name = 'small', NumberOfEmployees = 10);
        Account Acct2 = new Account(Name = 'medium', NumberOfEmployees = 5000);
        Account Acct3 = new Account(Name = 'large', NumberOfEmployees = 50000);
        List <Account> accts = new List<Account> {Acct1,Acct2,Acct3};
        insert accts;
        System.debug(accts);

        Lead Lead1 = new Lead(State = 'CA', Description = 'This is a Lead', Status = 'Closed Lost', lastname = 'lead1', company = 'Marketing Teams');
        Lead Lead2 = new Lead(State = 'TN', Description = 'This is another lead' , Status = 'Old', lastname = 'lead2', company = 'Sales Teams');
        List<Lead> leads = new List<Lead>{Lead1,Lead2};
        insert leads;

        Date testCloseDate = Date.NewInstance(1991,6,20);
        Opportunity Opp1 = new Opportunity(name = 'opp1', CloseDate=testClosedate, stageName = 'Qualification');
        Opportunity Opp2 = new Opportunity(name = 'opp2', CloseDate=testClosedate, stageName = 'Prospecting');
        List<Opportunity> opps = new List<Opportunity>{Opp1,Opp2};
        insert opps;
    }

    @isTest
    static void testFibonacci(){
        List<Integer> input = new List<Integer>{0,1,2,10};
        List<Integer> expected = new List<Integer>{0,1,1,55};
        Integer badInput = -1;

        for(Integer i = 0 ; i < input.size() ; i++){
            System.assertEquals(expected[i], Homework_0.nFibonacci(input[i]));
        }
        System.assertEquals(null, Homework_0.nFibonacci(badInput));
    }

    @isTest
    static void testSortArray(){
        List<Integer> input1 = new List<Integer>{2,4,5,1,3,1};
        List<Integer> output1 = new List<Integer>{1,1,2,3,4,5};
        List<Integer> input2 = new List<Integer>{5,4,3,2,1};
        List<Integer> output2 = new List<Integer>{1,2,3,4,5};

        System.assertEquals(output1, Homework_0.sortArray(input1));
        System.assertEquals(output2, Homework_0.sortArray(input2));
    }


    @isTest
    static void testnFactorial(){
        List<Integer> input = new List<Integer>{0,1,3};
        List<Integer> expected = new List<Integer>{1,1,6};
        for(Integer i = 0 ; i < input.size() ; i++){
            System.assertEquals(expected[i], Homework_0.nFactorial(input[i]));
        }

    }

    class rotations{
        Integer rot;
        List<Integer> input;
        List<Integer> output;
        public rotations(Integer i, List<Integer> iList, List<Integer> oList){
            rot = i;
            output = oList;
            input = iList;
        }
    }

    @isTest
    static void testRotate(){
        // List<Integer> inputList = new List<Integer>{1,2,3,4,5};
        rotations test1 = new rotations(1, new List<Integer>{1,2,3,4,5}, new List<Integer>{2,3,4,5,1});
        rotations test2 = new rotations(6, new List<Integer>{1,2,3,4,5}, new List<Integer>{2,3,4,5,1});
        rotations test3 = new rotations(3, new List<Integer>{1,2,3,4,5}, new List<Integer>{4,5,1,2,3});
        
        System.assertEquals(test1.output, Homework_0.rotateLeftNTimes(test1.input, test1.rot));
        System.assertEquals(test2.output, Homework_0.rotateLeftNTimes(test2.input, test2.rot));
        System.assertEquals(test3.output, Homework_0.rotateLeftNTimes(test3.input, test3.rot));
    }

    @isTest
    static void testBalancedBrackets(){
        String pos1 = '( ) ( )';
        String pos2 = '( ( ) )';
        String pos3 = '( { [ ] } )';
        system.assertEquals(True, Homework_0.bracketsAreBalanced(pos1));
        system.assertEquals(True, Homework_0.bracketsAreBalanced(pos2));
        system.assertEquals(True, Homework_0.bracketsAreBalanced(pos3));

        String neg1 = '(';
        String neg2 = '( ( )';
        String neg3 = '( [ ) ]';
        system.assertEquals(False, Homework_0.bracketsAreBalanced(neg1));
        system.assertEquals(False, Homework_0.bracketsAreBalanced(neg2));
        system.assertEquals(False, Homework_0.bracketsAreBalanced(neg3));
    }

    @isTest
    static void testUpdateAccountSize(){
        Homework_0.updateAccountSize();
        List<Account> outputSmall = [SELECT Size__c FROM Account WHERE NumberOfEmployees=10];
        List<Account> outputMedium = [SELECT Size__c FROM Account WHERE NumberOfEmployees=5000];
        List<Account> outputLarge = [SELECT Size__c FROM Account WHERE NumberOfEmployees=50000];
        System.debug([SELECT Size__c FROM Account]);
        System.assertEquals('small', outputSmall[0].size__c);
        System.assertEquals('medium', outputMedium[0].size__c);
        System.assertEquals('large', outputLarge[0].size__c);
    }

    @isTest
    static void testUpdateCALeads(){
        Homework_0.updateCALeads();
        List<Lead> outputPos = [SELECT Description, Status FROM Lead WHERE State='CA'];
        List<Lead> outputNeg = [SELECT Description, Status FROM Lead WHERE State='TN'];
        System.assertEquals('Closed - Not Converted', outputPos[0].Status);
        System.assertEquals('We are no longer doing business in California.', outputPos[0].Description);
        System.assertNotEquals('We are no longer doing business in California.', outputNeg[0].Description);
    }

    @isTest
    static void testClosePastDueOpportunities(){
        Homework_0.closePastDueOpportunities();
        List<Opportunity> outputPos = [SELECT stageName FROM Opportunity WHERE CloseDate < TODAY];
        System.assertEquals('Closed Lost', outputPos[0].StageName);
        System.assertEquals('Closed Lost', outputPos[1].StageName);
    }

}

        // Opportunity Opp1 = new Opportunity(name = 'opp1', CloseDate=testClosedate, stageName = 'Qualification');
        // Opportunity Opp2 = new Opportunity(name = 'opp2', CloseDate=testClosedate, stageName = 'Prospecting');
        // List<Opportunity> opps = new List<Opportunity>{Opp1,Opp2};
        // insert opps;