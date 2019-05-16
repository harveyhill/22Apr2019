public class ApexHomework {
    /*
* 1. Return the nth Fibonacci number
* Test Cases:
* Input: 0     Output: 0
* Input: 1    Output: 1
* Input: 2     Output: 1
* Input: 10    Output: 55
*/
    
    public static integer nFibonacci( Integer n ){
        
        // Returns 0 for 0 input.
        if (n == 0) {
            return n;
        }
        
        // Returns 0 for 0 input.
        if (n < 0) {
            return null;
        }
        
        // Returns all other integers.
        else {
            List<integer> fibonacciList = new List<integer>{1, 1};
                
                // Iterates through the for loop until i is not less than n.
                // Each iteration adds 2 numbers from the list and assigns the value to the nextNumber variable.
                // Then value of next number is added to the list.  
                for(integer i = 2; i < n; i++){
                    integer nextNumber = fibonacciList[i - 1] + fibonacciList[i - 2];
                    fibonacciList.add(nextNumber);
                }
            
            // Return the fibinacciList index value.
            return fibonacciList[fibonacciList.size() - 1];
        }
    } 
    
    /*
* 2. Sort an array of integers.
* Test Cases:
* Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
* Input: [5,4,3,2,1]     Output: [1,2,3,4,5]
*
* Don't use the sort() method... that would be lame.
*/  
    
    public static Integer[] sortArray( Integer[] intList ) {
        
        // iterate through intList until i is not less that intList size.
        for(Integer i = 0 ; i < intList.size() ; i ++) {
            
            // interate through intList until j is not less or equal to that intList size - 1.
            for(integer j = i + 1; j <= intList.size() -1; j++ ){
                integer x = 0 ;
                
                // set x equal to the greater index value of both lists.
                // set inList index at i equal to the value of intList index at j. 
                // Set intList j to the value of x
                // repeat until the conditional statement is no longer met. 
                if(intList[i] >  intList[j]){
                    x = intList[i];
                    intList[i] = intList[j];
                    intList[j]  = x;
                }
            }
        }
        
        // Print on the debug console.
        return intList;
    }
    
    /*
* 3. Return the factorial of n.
* Test Cases:
* Input: 0    Output: 1
* Input: 1    Output: 1
* Input: 3    Output: 6
*/
    
    public static Integer nFactorial( Integer n) {
        
        if (n < 0 || n == null)
        {
            return null;
        }
        
        // When n equals 0 or 1 return 1.
        if (n == 0 || n == 1){
            n = 1;
            return n;
        }
        
        // Return the rest of the values. 
        else {
            for(integer i = n - 1; i > 0; i--){
                n = n * i;                
            }
            return n;
        }
    }
    
    /*
* 4. Rotate left
* Given an array, array, and an integer, n, rotate the values in array left n times and return array
* Test Cases:
* Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
* Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
* Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
*/
    
    public static Integer[] rotateLeftNTimes(Integer[] intArray, Integer n){
        
        // iterate until j is not less than n.
        for(integer i = 0; i < n; i++){
            intArray.add(intArray[0]);
            intArray.remove(0);
        }
        return intArray;
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
*/
    
    /*
* 6. Create a method that retrieves a list of all accounts and updates those accounts.
*      Create a custom field on the Account standard object called Size__c that will be a 
* picklist containing small/medium/large.
*     Create a method that retrieves a list of all accounts. 
*         - If an account has between 1-1000 employees then it is classified as small.
*         - If an account has between 1001-10000 employees it is classified as medium.
*         - If an account has more than 10000 employees it is classified as large.
*     Update the Size__c field on each account to reflect the amount of employees in the Account.
*/
    
    public static void updateAccountSizeMethod() {
        
        List<Account> accountList = [SELECT  Size__c, NumberOfEmployees FROM Account];
        for (Account a : accountList) {
            if (a.NumberOfEmployees <= 1000){
                a.size__c = 'Small';
                
            }else if ( a.NumberOfEmployees > 1000 && a.NumberOfEmployees <= 10000){
                a.size__c = 'Medium';
                
            }else if (a.NumberOfEmployees > 10000){
                a.size__c = 'Large';
            }
            update accountList;
        }
    }
    
    /* 
* 7. Create a method that will find all leads that contain 'ca' in their fields. 
*     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
* Converted' and their description should display the message, "We are no longer doing 
* business in California."
*/
    
    public static void updateCALeads() {
        List<Lead> leadList = [SELECT  State, Status, Description FROM Lead WHERE State = 'CA' OR State = 'California'];
        for (Lead l: leadList) {
            l.Status = 'Closed - Not Converted';
            l.Description = 'We are no longer doing business in California.';
        }
        update leadList;
    }
    
    /*
* 8. Create a method that will find all Opportunities which have already passed their Close Date 
* and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
* they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
*/
    
    public static void closePastDueOpportunities() {
        
        List<Opportunity> pastDueOpportunities = [SELECT StageName FROM Opportunity WHERE CloseDate < TODAY ];
        for (Opportunity o: pastDueOpportunities) {
            if(o.StageName != 'Closed Won') {
                o.StageName = 'Closed Lost';
            }            
        }
        update pastDueOpportunities;
    }    
}