@isTest
public class ApexHomeworkTestClass {
    
    @isTest
    public static void nFibonacciTest(){
        
        system.assertEquals(1, ApexHomework.nFibonacci(1));
        system.assertEquals(null, ApexHomework.nFibonacci(-1));
    }
    
    @isTest
    public static void sortArrayTest() {
        List<integer> testArray = new List<integer>{2,4,5,1,3,1};
            List<integer> testExpectedArray = new List<integer>{1,1,2,3,4,5};
                
                List<integer> testArraySingle = new List<integer>{2};
                    List<integer> testExpectedArraySingle = new List<integer>{2};
                        system.assertEquals(testExpectedArray, ApexHomework.sortArray(testArray)); 
        system.assertEquals(testExpectedArraySingle, ApexHomework.sortArray(testArraySingle));
        
    }
    
    @isTest
    public static void nFactorialTest() {
        system.assertEquals(6, ApexHomework.nFactorial(3));
        system.assertEquals(null, ApexHomework.nFactorial(-3)); 
        system.assertEquals(null, ApexHomework.nFactorial(null));
    }
    
    @isTest
    public static void rotateLeftNTimesTest(){
        List<Integer> inputList = new List<Integer>{1,2,3,4,5};
            List<Integer> outputList = new List<Integer>{2,3,4,5,1};
                List<Integer> outputList2 = new List<Integer>{4,5,1,2,3};
                    system.assertEquals(outputList, ApexHomework.rotateLeftNTimes(inputList, 1), 'First');
        inputList = new List<Integer>{1,2,3,4,5};
            system.assertEquals(outputList, ApexHomework.rotateLeftNTimes(inputList, 6), 'Second');
        inputList = new List<Integer>{1,2,3,4,5};
            system.assertEquals(outputList2, ApexHomework.rotateLeftNTimes(inputList, 3), 'Third');
    }
    
    /*
* 5. Balanced Brackets
* A bracket is any one of the following: (, ), {, }, [, or ]
* 
* The following are balanced brackets:
*    ( )
*    ( ) ( )
*    ( ( ) )
*    ( { [ ] } )
*
* The following are NOT balanced brackets:
*   (
*   )
*   ( ( )
*   ( [ ) ]
*
* Return true if balanced
* Return false if not balanced

@isTest
public static void bracketsAreBalancedTest() {
system.assertEquals(true, ApexHomework.bracketsAreBalanced('( { [ ] } )'));
system.assertEquals(false, ApexHomework.bracketsAreBalanced('( [ ) ]'));
system.assertEquals(true, ApexHomework.bracketsAreBalanced(''));
system.assertEquals(false, ApexHomework.bracketsAreBalanced('('));
}
*/
    
    @TestSetup
    public static void dataSetup(){
        Account accountSmallPositive = new Account(NumberOfEmployees = 1000, Name = 'Caleb');
        Account accountMediumPositive = new Account(NumberOfEmployees = 2000, Name = 'Caleb');
        Account accountLargePositive = new Account(NumberOfEmployees = 10001, Name = 'Caleb');
        Lead caLead = new Lead(state = 'CA', lastname = 'Rhodenbaugh', company = 'Microsoft');       
        Lead californiaLead = new Lead(state = 'CA', lastname = 'Rhodenbaugh', company = 'Microsoft');
        //Opportunity changeToClosedLost = new Opportunity(Name = 'Test Opportunity', StageName = 'Prospecting', CloseDate = 2011-01-01t01:01:01z);
        //changeToClosedLost.CloseDate = changeToClosedLost.CloseDate - 1;
        
        insert accountSmallPositive; 
        insert accountMediumPositive; 
        insert accountLargePositive;
        
        insert caLead;
        insert californiaLead;
        
        //insert changeToClosedLost;
    }
    
    @isTest
    public static void updateAccountSizeMethodTest() {
        
        ApexHomework.updateAccountSizeMethod();
        
        List<Account> smallTest = [SELECT Size__c FROM Account WHERE NumberOfEmployees=1000];
        List<Account> mediumTest = [SELECT Size__c FROM Account WHERE NumberOfEmployees=2000];
        List<Account> largeTest = [SELECT Size__c FROM Account WHERE NumberOfEmployees=10001];
        
        system.assertEquals('Small', smallTest[0].Size__c);      
        system.assertEquals('Medium', mediumTest[0].Size__c);
        system.assertEquals('Large', largeTest[0].Size__c);
    }
    
    @isTest
    public static void updateCALeadsTest() {
        
        ApexHomework.updateCALeads();
        
        List<Lead> californiaLeads = [SELECT State, Status, Description FROM Lead WHERE State = 'CA' OR State = 'California'];
        
        system.assertEquals('Closed - Not Converted', californiaLeads[0].Status);      
        system.assertEquals('We are no longer doing business in California.', californiaLeads[0].Description);        
    }
    
    /*
* 8. Create a method that will find all Opportunities which have already passed their Close Date 
* and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
* they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
*/
    
    @isTest
    public static void closePastDueOpportunitiesTest() {
        ApexHomework.closePastDueOpportunities();
        
        List<Opportunity> changeToClosedLost = [SELECT StageName FROM Opportunity WHERE CloseDate < TODAY ];
        
        system.assertEquals('Closed Lost', changeToClosedLost[0].StageName);      
        system.assertEquals('Closed Lost', changeToClosedLost[0].StageName);
    }  
}