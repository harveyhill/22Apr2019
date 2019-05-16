@isTest
public class ApexHomeworkTest {
  
     @TestSetup

    static void makeDate(){

        Date testCloseDate = Date.NewInstance(2012,1,2);

        Account newAccount1 = new Account(name = 'small',numberOfEmployees = 3);

        Account newAccount2 = new Account(name = 'medium',numberOfEmployees = 100);

        Account newAccount3 = new Account(name = 'large',numberOfEmployees = 200);

        List <Account> aC = new List<Account> {newAccount1,newAccount2,newAccount3};

        insert aC;
    }
    @isTest
     public static void testFibonacci(){
        Integer fibResult1 = ApexHomework.nFibonacci(0);
        Integer fibResult2 = ApexHomework.nFibonacci(1);
        Integer fibResult3 = ApexHomework.nFibonacci(2);
        Integer fibResult4 = ApexHomework.nFibonacci(10);
        system.assertEquals(0, fibResult1);
        system.assertEquals(1, fibResult2);
        system.assertEquals(1, fibResult3);
        system.assertEquals(55, fibResult4);
    }
   @isTest
    public static void testSortArray(){
        List<Integer> array1 =new List<Integer>{2,4,5,1,3,1};
        List<Integer> array2 =new List<Integer>{5,4,3,2,1};
       
        List<Integer> expected1=new List<Integer>{1,1,2,3,4,5};
        List<Integer> expected2=new List<Integer>{1,2,3,4,5};
    	
        List<Integer> result1 =ApexHomework.sortArray(array1);
       	List<Integer> result2 =ApexHomework.sortArray(array2);
		
        system.assertEquals( expected1,result1);
        system.assertEquals(expected2,result2);
        
    }
    @isTest
    public static void testnFactorial(){
        Integer nResult1=ApexHomework.nFactorial(0) ;
        Integer nResult2= ApexHomework.nFactorial(1) ;
        Integer nResult3=ApexHomework.nFactorial(3) ;
        
        system.assertEquals(1, nResult1);
        system.assertEquals(1, nResult2);
        system.assertEquals(6, nResult3);
    }
    @isTest
    public static void testRotateLeftNTimes(){
        //case1
        List<Integer>result1 = new List<Integer>{1,2,3,4,5};
            Integer n1=1;
        List<Integer> test1=new List<Integer>{2,3,4,5,1};
        
        //case2    
        List<Integer>result2 = new List<Integer>{1,2,3,4,5};
            Integer n2=6;
        List<Integer> test2=new List<Integer>{2,3,4,5,1};
		
        //case3
        List<Integer>result3 = new List<Integer>{1,2,3,4,5};
            Integer n3=3;
        List<Integer> test3=new List<Integer>{4,5,1,2,3};
    	//test1
        List<Integer> expected1=ApexHomework.rotateLeftNTimes(result1,n1);
        system.assertEquals(test1, expected1); 
    	//test2
    	List<Integer> expected2=ApexHomework.rotateLeftNTimes(result2,n2);
        system.assertEquals(test2, expected2);
    	//test3
    	List<Integer> expected3=ApexHomework.rotateLeftNTimes(result3,n3);
        system.assertEquals(test3, expected3);
    }
    @isTest
    public static void testBracketsAreBalanced(){
			system.assertEquals( true ,ApexHomework.bracketsAreBalanced('( )') );
			system.assertEquals( true ,ApexHomework.bracketsAreBalanced('( ) ( )') );
            system.assertEquals( true ,ApexHomework.bracketsAreBalanced('( ( ) )') );
            system.assertEquals( true ,ApexHomework.bracketsAreBalanced('( { [ ] } )') );
    }
   
    @isTest 
	 public static void testAccountSize(){

       

       ApexHomework.updateAccountSize();

        

      Account empName = [SELECT Id, Size__c From Account Where numberOfEmployees = 3];

       

        system.assertEquals('small', empName.Size__c);
	}
	@isTest
    public static void testUpdateCALeads(){

        ApexHomework.updateCALeads();

       

        Lead n1 = [SELECT State, Description, Status FROM LEAD WHERE State = 'CA'];

        Lead n2 = [SELECT State, Description, Status FROM LEAD WHERE State = 'TN'];

       

        system.assertEquals('Closed - Not Converted' , n1.Status);

        system.assertEquals('Open - Not Contacted' , n2.Status);
    }
    @isTest
    public static void testclosePastDueOpportunities(){

        ApexHomework.closePastDueOpportunities();

       

        Opportunity n1 = [SELECT CloseDate, StageName FROM Opportunity WHERE CloseDate < TODAY and StageName != 'Qualification'];

        Opportunity n2 = [SELECT CloseDate, StageName FROM Opportunity WHERE CloseDate < TODAY and StageName != 'Prospecting'];

       

        system.assertEquals('Closed Won', n1.StageName);

        system.assertEquals('Closed Lost', n2.StageName);

    }
    
}