public class ApexHwOne {

    //Question 1
    public static Integer nFibonacci( Integer n ){
        Integer p1 = 0;
        Integer p2 = 1;
        Integer x = 0;
        
        for(Integer i = 1; i < n; i++){
            if(n == 0){
                x = p1;
            }
            else if(n == 1 || n == 2){
                x = p2;
            }
            else{
                x = p1 + p2;
                p1 = p2;
                p2 = x;      
            }
        }
        
        system.debug('This is the value of ' + x);

        return x;
    }
    
    
    //Question 2
    public static Integer[] sortArray( Integer[] intList ) {
        
		Integer myList;

 
        for(Integer i = 0; i < intList.size(); i++){
            for(Integer j =i; j < intList.size(); j++){
                if(intList[j] < intList[j+1]){
                    myList = intList[j];
                    intList[j] = intList[j-1];
                    intList[j-1]= myList;
                }
            }
           
        }
        
        return intList;
    }
    
    //Question 3 
    public static Integer nFactorial( Integer n) {
        n = 8;
        system.debug('hello');
        Integer x;
        
        for(Integer i = n-1; i > 0; i--){
            x = n * i;
        }
        
        system.debug('The value of x: ' + x);
        return x;
    }
    
    //Question 4
    public static Integer[] rotateLeftNTimes( Integer[] shift, Integer n) {
        
        Integer[] moveList = shift;
        
        for(Integer i = 0; i < shift.size();i++){
            Integer move = moveList.remove(0);
            moveList.add(move);
        }
        
        return shift;
    }
    
    //Question 5
    public static Boolean bracketsAreBalanced( String s ) {
        Boolean x = false;
        Integer y = 0;
        
        for(Integer i = 0; i < s.length(); i++){
             if(s.substring(i) == '('){
                   y++;
                }
                else if(s.substring(i) == '{'){
                    y++;
                }
                else if(s.substring(i) == '['){
                    y++;
                }
            for(Integer j = i; j < s.length(); j++){
                if(s.substring(j) == ')'){
                   y--;
                }
                else if(s.substring(j) == '}'){
                    y--;
                }
                else if(s.substring(j) == ']'){
                    y--;
                }
            }
        }
        
        if(y == 0){
            x= true;
        }
        
        return x;
    }
    
    //Question 6
    public static void updateAccountSize( ) {
    	  List<Account> accountList = [SELECT name, numberofemployees, size__c FROM Account];
        
          for (Account a: accountList) {
              if(a.numberofemployees >= 1 && a.numberofemployees <= 1000 ) {
                  a.size__c = 'small';
              } else if (a.numberofemployees >= 1 && a.numberofemployees <= 1000 ) {
                  a.size__c = 'medium';
              } else {
                  a.size__c = 'large';
              }
          }
        
        update accountList;
	  }

    //Question 7
    public static void updateCALeads( ) {
    	List<Lead> leadList = [SELECT name, company, state 
                                          FROM Lead
                                          WHERE state = 'ca'];
        
        for (Lead x: leadList) {
            x.status = 'Closed - Not Converted';
            x.description = 'We are no longer doing business in California.';
        }
        
        update leadList;
    }
    
    //Question 8
    public static void closePastDueOpportunities( ) {
    	List<Opportunity> opportunityList = [SELECT name, description, amount 
                                            FROM Opportunity
                                            WHERE stageName != 'Close Lost'];   
        
        for(Opportunity x: opportunityList){
            if(x.StageName != 'Closed Won')
                x.StageName = 'Closed Lost';
        }
        
        update opportunityList;
	}

    
}