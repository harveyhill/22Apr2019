@isTest
public class HomeworkTest {
    
    @TestSetup
    static void makeData() {
        Test.makeAccounts(8);
    }

    @isTest
    public static void testFibonacci() {
        Integer fibResult = Homework.nFibonacci(10);
        
        system.assertEquals(55, fibResult);
    }
    
    @isTest
    public static void testSortArray() {
        Integer[] arrayOfNumbers = new integer[]{2,4,5,1,3,1};
        Integer[] sortResult = Homework.sortArray(arrayofNumbers);
        arrayOfNumbers = new integer[]{1,1,2,3,4,5};
            
        system.assertEquals(arrayOfNumbers, sortResult);
    }
    
    @isTest
    public static void testnFactorial(){
        Integer factResult = Homework.nFactorial(10);
        system.assertEquals(3628800, factResult);
    }
    
    @isTest
    public static void testRotateLeft(){
        Integer[] arrayOfNumbers;
        arrayOfNumbers = new Integer[]{1,2,3,4,5};
        Integer[] rotatedNumbers = new Integer[]{2, 3, 4, 5, 1};
        system.assertEquals(rotatedNumbers, Homework.rotateLeftNTimes(arrayOfNumbers, 1));
    }
    
    @isTest
    public static void testBalancedBrackets(){
        system.assertEquals(true, Homework.bracketsAreBalanced('( )'));
        system.assertEquals(true, Homework.bracketsAreBalanced('( ) ( )'));
        system.assertEquals(true, Homework.bracketsAreBalanced('[ ( ) ]'));
        system.assertEquals(true, Homework.bracketsAreBalanced('{[()]}'));
        system.assertEquals(false, Homework.bracketsAreBalanced('(}'));
        system.assertEquals(false, Homework.bracketsAreBalanced('('));
        system.assertEquals(false, Homework.bracketsAreBalanced('(('));
        system.assertEquals(true, Homework.bracketsAreBalanced('asdhasgdhgas'));
        system.assertEquals(false, Homework.bracketsAreBalanced('([)]'));        
    }
    
    @isTest
    public static void testUpdateAccountSize(){
        Test.makeAccounts(10);
        Homework.updateAccountSize();
        Account aAccount = [Select size__c from account where name = 'Test 1' and numberofemployees = 3 limit 1];
        system.assertEquals('small', aAccount.size__c);       
    }
    
    @isTest
    public static void testUpdateCALeads(){
        Test.makeLeads(5);
        Homework.updateCALeads();
        Lead aLead = [Select status from lead where company = 'Test 1' and state = 'CA' limit 1];
        system.assertEquals('Closed - Not Converted', aLead.Status);       
    }    
    
    @isTest
    public static void testClosePastDueOpportunities(){
        Test.makeOpportunities(4);
        Homework.closePastDueOpportunities();
        Opportunity aOpp = [Select stagename from opportunity where name = 'Test 1' limit 1];
        system.assertEquals('Closed Lost', aOpp.Stagename);       
    }  
}