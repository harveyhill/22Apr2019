public Class Apex_Assignment{
/*
 * 1. Return the nth Fibonacci number
 * Test Cases:
 * Input: 0     Output: 0
 * Input: 1    Output: 1
 * Input: 2     Output: 1
 * Input: 10    Output: 55
*/
public static Integer nFibonacci(Integer n){
if(n == 0) return 0; // Quick assign Fibonacci of 0
if(n == 1) return 1; // Quick assign FIbonacci of 1
    
    integer first = 1; // first position 
    integer second = 2; // Second position
    integer third = 2; // Placeholder for 3rd position
    
    //Loop to spawn the fibonacci up until index n
    for(integer i = 3; i < n; i++){
        third = first + second;
        first = second;
        second = third;
    }
    return third;
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
integer temp; // Temporarily hold the greater value to the left
    //outer loop to determine how many iterations the inner loop gets
    for(integer i = 0; i < intList.size() -1; i++){
        //Loop to determine how many times the swap functionality runs
        for(integer j = 0; j < intList.size() -1 - i; j++){
            //Checking to see if list at index j is great than list at index j + 1
            if(intList[j] > intList[j + 1]){
                temp = intList[j];
                intList[j] = intList[j + 1];
                intList[j + 1] = temp;
            }
        }
    }
    
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
        
        if(n == 0) return 1; // quick assign factorial of 0
        if(n == 1) return 1; // quick assign factorial of 0
        // loop to decrement i which takes the value of n at each iteration
    for(integer i = n - 1; i > 0; i--){
            n = n * i;
        }
        
    	return n;

}

/*
 * 4. Rotate left
 * Given an array, array, and an integer, n, rotate the values in array left n times and return array
 * Test Cases:
 * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
*/
public static Integer[] rotateLeftNTimes( Integer[] intArray, Integer n) {
		integer temp;// hold temporal values for computing
    
    //Outer Loop to make inner loop run n times
        for(integer j = 0; j < n; j ++){
            
            for(integer i = 0; i <= intArray.size(); i++){
               //If intArray at first index, assign to temp
                if(i == 0){
                    temp = intArray[i];
                }
                //if int Array is at the last index, assign temp
                // value to intArray at last index
                if(i == intArray.size() - 1){
                    intArray[i] = temp;
                }
                else{
                    //if i is not at last or first index,
                    //keep shifting i
                   intArray[i] = intArray[i + 1]; 
                }
            }
            
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
public static Boolean bracketsAreBalanced( String s ) {
 	Boolean test = true; // boolean to be returned; 
        
        List<String> bracket = s.split(''); // converts the strings of brackets to character array
    
    //Loop through Brackets in the list
        for(integer i = 0; i < bracket.size(); i++){
           
            //Switch to pair opening and closing brackets and return boolean
            switch on bracket[i]{
               //check if bracket at index i is a match with bracket
               //at index i + 1 then returns a boolean
                when '('{
                    if(bracket[i + 1] == ')'){
                         test = true;
                    	}
                     else{
                    test = false; 
                    }
                    }
                
                when '{'{
                    
                    if(bracket[i + 1] == '}'){
                      test = true;
                    	}      
                    else{
                        test = false;
                    }
                    }
                
                 when '['{
                    
                    if(bracket[i - 1] == ']'){
                      test = true;
                    	}
                else{
                   test = false; 
                }
                
            }
 
        }
        
    }
        return test;

}
 
/* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */
 
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
public static void updateAccountSize( ) {
    
List<Account> accountRecord = new List<Account>(); // Holds updated records to be pushed
    //Select query to select based on criteria
List<Account> accountList = [SELECT numberofemployees, size__c, name FROM account WHERE Numberofemployees != null];
      //For Each loop to update on each account returned from query
    for(Account ac: accountList){
        //if else blocks to update based on criteria
        if(ac.NumberOfEmployees <= 1000 ){
            ac.size__c = 'small';
        } 
        else if((ac.NumberOfEmployees >= 1001) && (ac.NumberOfEmployees <= 10000)){
            ac.size__c = 'medium';
        }
       else if(ac.NumberOfEmployees > 10000){
            ac.size__c = 'medium';
        }
        accountRecord.add(ac); // Add updated account to accountRecord List 
    }
    update accountRecord; // command to push updates
}
 
/* 
 * 7. Create a method that will find all leads that contain 'ca' in their fields. 
 *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 */
public static void updateCALeads( ) {
    //Holds updated records to be pushed
  List<Lead> leadUpdate = new List<Lead>();
    //Soql Statement to select based on criteria
 List<Lead> leadList = [SELECT status, description FROM Lead WHERE State = 'CA'];
    //Loop through each lead and apply changes at each iteration
    for(Lead ld: leadList){
        ld.status = 'Closed - Not Converted.';
        ld.description = 'We are no longer doing business in California.';
        leadUpdate.add(ld); //add updated lead to leadUpdate List
    }
    update leadUpdate; //Push updated List
}
 
/*
 * 8. Create a method that will find all Opportunities which have already passed their Close Date 
 * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
 * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 */
public static void closePastDueOpportunities( ) {
    //Holds records to be pushed
 	List<Opportunity> oppUpdate = new List<Opportunity>();
    //Soql statement to select based on criteria
     List<Opportunity> opp = [SELECT CloseDate, StageName FROM opportunity WHERE CloseDate < TODAY AND StageName != 'Closed Won'];
    //Looping through each opportunity List and udating StageName at     
    for(Opportunity op: opp){
            op.StageName = 'Closed Lost';
            oppUpdate.add(op);
        }
    
        update oppUpdate; // Push Opportunity Update
	}
    
}