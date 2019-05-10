public class ApexHomework {
	/*
     * 1. Return the nth Fibonacci number
	 * Test Cases:
 	 * Input: 0     Output: 0
 	 * Input: 1    Output: 1
 	 * Input: 2     Output: 1
 	 * Input: 10    Output: 55
	 */

	public static Integer nFibonacci( Integer n ){
        if (n == 0){
            return 0;
        }             
        else if (n == 1){
        	return 1;
        } 
        else{ 
            return nFibonacci(n-1) + nFibonacci(n-2);
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
        Integer listSize = intList.size();
		Integer[] sortList = intList;
        
        Integer[] sortedList = new Integer[]{};
        
        //Get the location of the smallest element
        Integer smallestPos = 0;
        
        for(Integer i = 0; i < listSize; i++) {
            for(Integer j = 0; j < sortList.size(); j++){
                if(sortList[j] < sortList[smallestPos]){
                	smallestPos = j;
            	}
            }
			sortedList.add(sortList[smallestPos]);
            sortList.remove(smallestPos);
            smallestPos = 0;
        }
        
        return sortedList;
    }
    
	/*
 	 * 3. Return the factorial of n.
 	 * Test Cases:
 	 * Input: 0    Output: 1
 	 * Input: 1    Output: 1
 	 * Input: 3    Output: 6
	 */
	public static Integer nFactorial(Integer n) {
		if(n == 0)
            return 1;
        
        return n * nFactorial(n - 1);
	}

	/*
 	 * 4. Rotate left
 	 * Given an array, array, and an integer, n, rotate the values in array left n times and return array
 	 * Test Cases:
 	 * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
 	 * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
 	 * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
	 */
	public static Integer[] rotateLeftNTimes( Integer[] intList, Integer n) {
        //Set up the list
        Integer listSize = intList.size();
        Integer[] rotatedList = intList;
        
        //Loop for the rotation
        for(Integer i = 0; i < n; i++){
            //Take the first element out
            Integer moved = rotatedList.remove(0);
            //Put the element in the back
            rotatedList.add(moved);
        }
        
        return rotatedList;
	}

	/*
 	 * 5. Balanced Brackets
 	 * A bracket is any one of the following: (, ), {, }, [, or ]
 	 * 
 	 * The following are balanced brackets:
 	 *    ( )
 	 *    ( ) ( )
 	 *    ( ( ) )
 	 *    ( { [ ] } )
 	 *
 	 * The following are NOT balanced brackets:
 	 *   (
 	 *   )
 	 *   ( ( )
 	 *   ( [ ) ]
 	 *
 	 * Return true if balanced
 	 * Return false if not balanced
	 */
	public static Boolean bracketsAreBalanced( String s ) {
        s = s.normalizeSpace();
        //Set up array to hold left bracket chars
        Integer[] bracketList = new Integer[]{}; 
        
        for(Integer i = 0; i < s.length(); i++)
        {
            Integer current = s.charAt(i);
            //system.debug('Value: ' + current);
            //system.debug('Char: ' + String.fromCharArray(current));
            switch on current{
                //'(''[''{'
                when 40, 91, 123{
                    //Add char to bracketList
                    if(bracketList.isEmpty())
                        bracketList.add(current);
                    else
                    	bracketList.add(0, current);
                    //system.debug('Current brackets: ' + bracketList);
                }
                //')'
                when 41{
                    //Check that bracketList isn't empty
                    if(bracketList.isEmpty())
                        return false;
                    //Get char at the front of bracketList
                    Integer leftBracket = bracketList.remove(0);
                    //check if the value is correct
                    if(String.valueOf(leftBracket) != '40')
                        return false;
                }
                //']'
                when 93{
                    //Check that bracketList isn't empty
                    if(bracketList.isEmpty())
                        return false;
                    //Get char at the front of bracketList
                    Integer leftBracket = bracketList.remove(0);
                    //check if the value is correct
                    if(String.valueOf(leftBracket) != '91')
                        return false;
                }
                //'}'
                when 125{
                    //Check that bracketList isn't empty
                    if(bracketList.isEmpty())
                        return false;
                    //Get char at the front of bracketList
                    Integer leftBracket = bracketList.remove(0);
                    //check if the value is correct
                    if(String.valueOf(leftBracket) != '123')
                        return false;
                }
                when 32{
                    
                }
                when else{
                    //Wrong input, not balanced
                    return false;
                }
            }
            //system.debug('Current brackets: ' + bracketList);
        }
        //Make sure bracketList is now empty
        if(!bracketList.isEmpty())
        	return false;
        
        return true;
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
        List<Account> accounts = [SELECT NumberOfEmployees FROM Account];
        for(Account acct: accounts){
            if(acct.NumberOfEmployees <= 1000 || acct.NumberOfEmployees == null)
                acct.Size__c = 'small';
            else if(acct.NumberOfEmployees >= 1001 && acct.NumberOfEmployees <= 10000)
                acct.Size__c = 'medium';
            else if(acct.NumberOfEmployees >= 10001)
                acct.Size__c = 'large';
        }
        update accounts;
	}
    
	/* 
 	 * 7. Create a method that will find all leads that contain 'ca' in their fields. 
 	 *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 	 * Converted' and their description should display the message, "We are no longer doing 
 	 * business in California."
 	 */
	public static void updateCALeads( ) {
		List<Lead> caLeads = [SELECT Status, Description FROM Lead WHERE State = 'CA'];
        for(Lead updateLead: caLeads){
            updateLead.Status = 'Closed - Not Converted';
            updateLead.Description = 'We are no longer doing business in California';
        }
        update caLeads;
	}

	/*
 	 * 8. Create a method that will find all Opportunities which have already passed their Close Date 
 	 * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
 	 * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 	 */
	public static void closePastDueOpportunities( ) {
		List<Opportunity> pastDue = [Select StageName FROM Opportunity WHERE CloseDate < TODAY];
        for(Opportunity opp: pastDue){
            if(opp.StageName != 'Closed Won')
                opp.StageName = 'Closed Lost';
        }
        update pastDue;
	}
    
    
    
}