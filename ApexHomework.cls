public with sharing class ApexHomework {
// 1. Return the nth Fibonacci number
	public static Integer nFibonacci( Integer n ){
	 	if (n <= 1) 
       	return n; 
    return nFibonacci(n-1) + nFibonacci(n-2); 
	}
// 2.Sort an array of integers.	
	public static Integer[] sortArray( Integer[] intList ) {
    	Integer temp;
    	for (Integer i=1;i< intList.size();i++){
    		for(Integer j=i;j>0;j--){
                if (intList[j]< intList[j-1]){
                temp=intList[j];
    			intList[j]=intList[j-1];
    			intList[j-1]=temp;
                }	
             }
    	}
    	return intList;
    }
       
//  * 3. Return the factorial of n.
	public static Integer nFactorial( Integer n) {
		if (n<0) {
			return -1;
		}else if (n==0){
			return 1;
		}else {
			return (n*nFactorial(n-1));
		}
 	}
//* 4. Rotate left   
	public static Integer[] rotateLeftNTimes( Integer[] intList, Integer n) {
		Integer[] nlist=new Integer [intList.size()];	   
	    Integer times= math.mod(n,intList.size());
	 	for(Integer i=0;i<intList.size();i++){
	 		nlist[i]= intList [ math.mod ( (i+times), intList.size())];
	 	}
	 	return nlist;
}
//*5.Balanced Brackets A bracket is any one of the following: (, ), {, }, [, or ]
   public static Boolean bracketsAreBalanced( String s ) {
        // a1='{'  123
        //  a2='}' 125
        //  b1[  91
        //  b2]  93
        //  c1（  40
        //  c2)  41
      Integer a1=0; 
      Integer a2=0;
      Integer b1=0; 
      Integer b2=0;
      Integer c1=0; 
      Integer c2=0;
      for(Integer i=0;i< s.length();i++){
          switch on s.charAt(i){
              when 123{ a1=a1+1; }   
              when 125{a2=a2+1; }
              when 91 {b1=b1+1;}
              when 93 {b2=b2+1; }
              when 40 {c1=c1+1;}
              when 41 {c2=c2+1;}
          }
      }
     
       if(a1==a2 && b1==b2 && c1==c2){
             return true;
       }else{
              return false;
       }
	}
//6 Create a method that retrieves a list of all accounts and updates those accounts.
	public static void updateAccountSize( ) {
		List<Account> accountL = [SELECT name, numberofemployees，Size__c  FROM Account];
          for (Account a: accountL) {
              if(a.numberofemployees >= 1 && a.numberofemployees <= 1000 ) {
                  a.Size__c  = 'small';
              } else if (a.numberofemployees >= 1 && a.numberofemployees <= 1000 ) {
                  a.Size__c  = 'medium';
              } else {
                  a.Size__c  = 'large';
              }
          }
         update accountL;
          
	  }
 
 
//7. Create a method that will find all leads that contain 'ca' in their fields. 
 public static void updateCALeads( ) {
 List<Lead> leadList = [SELECT name,statue, description, state FROM Lead WHERE state = 'ca'];
        for (Lead e: leadList) {
            e.status = 'Closed - Not Converted';
            e.description = 'We are no longer doing business in California.';
        }
        update leadList;
 }	
//8	
public static void closePastDueOpportunities( ) {
		List<Opportunity> opportunityL = 
		[SELECT StageName, CloseDate  FROM Opportunity WHERE StageName = 'Close won']; 
 		for (Opportunity o : opportunityL){
			if( o.CloseDate > Today )
			StageName='Close Lost';
		}
		update opportunityL;
  }
}
 
