public class Homework {

    public static Integer nFibonacci( Integer num ){
        integer a = 0;
        integer b = 1;
        integer c = 0;
        if (num == 0){
            return a; 
        }
        for (integer i = 2; i <= num; i++){
            c = a + b; 
            a = b; 
            b = c; 
        }
        return b;
    }
    
  
    public static Integer[] sortArray(Integer[] intList ){
      Integer arrList;

        for(Integer i = 0; i < intList.size(); i++){
            for(Integer j =i; j < intList.size(); j++){
                if(intList[j] < intList[j+1]){
                    arrList = intList[j];
                    intList[j] = intList[j-1];
                    intList[j-1]= arrList;
                }
            }
           
        }
        
        return intList;   
    }
    
    public static Integer nFactorial(Integer n){
        integer num = 1;
        integer i;
        for (i = 2; i < n; i++){
            num = num * i;
        }
        return num;
    }
    
      public static Integer[] rotateLeftNTimes( Integer[] arrayy, Integer n){
      
            Integer[] rotArray = arrayy;
            
            for(Integer i = 0; i < n; i++){
                Integer rotated = rotArray.remove(0);
                rotArray.add(rotated);
            }
            
            return rotArray;
          
       }  
          
    
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
   
      public static void updateAccountSize( ) {
        List<Account> accountList = [SELECT name, numberofemployees, size__c FROM Account];
          List<Account> updateList = new List<Account>();
          for (Account a: accountList) {
              if(a.numberofemployees >= 1 && a.numberofemployees <= 1000 ) {
                  a.size__c = 'small';
                  updateList.add(a);
              } else if (a.numberofemployees >= 1 && a.numberofemployees <= 1000 ) {
                  a.size__c = 'medium';
                  updateList.add(a);
              } else {
                  a.size__c = 'large';
                  updateList.add(a);
              }
          }
          database.update(updateList);
    }

    public static void updateCALeads( ) {
      List<Lead> leadList = [SELECT name, company, state 
                                          FROM Lead
                                          WHERE state = 'ca'];
        for (Lead l: leadList) {
            l.status = 'Closed - Not Converted';
            l.description = 'We are no longer doing business in California.';
        }
        
    }   

   
  public static void closePastDueOpportunities( ) {
      List<Opportunity> opportunityList = [SELECT name, description, closeDate 
                                            FROM Opportunity
                                            WHERE stageName != 'Close Won'];
        List<Opportunity> newList = new List<Opportunity>();
        for (Opportunity o: opportunityList) {
            if (o.closeDate < System.today()){
               o.StageName = 'Closed Lost';
               newList.add(o);
            }
        }
        database.update(newList);
  }

}