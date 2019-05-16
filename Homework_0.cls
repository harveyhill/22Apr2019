public with sharing class Homework_0 {

    public static void runAll(){
        // Test Resources
        List<integer> testList = new List<integer>{5, 2, 9, 1, 3};
        List<String> positiveTestStringList = new List<String>{
            '( )',
            '( ) ( )',
            '( ( ) )',
            '( { [ ] } )'
        };
        List<String> negativeTestStringList = new List<String>{
            '( ',
            ')',
            '( ( )',
            '( [ ) ]'
        };

        // Part 1
        System.Debug('::    Fibonacci   ::');
        System.Debug(nFibonacci(10));
        // Part 2
        System.Debug('::    SortArray   ::');
        System.Debug(sortArray(testList));
        // Part 3
        System.Debug('::    Factorial   ::');
        System.Debug(nFactorial(3));
        // Part 4
        System.Debug('::    Rotator     ::');
        System.Debug(rotateLeftNTimes(testList, 2));
        // Part 5
        System.Debug('::    Bracket Balancer : Positives    ::');
        for(String s: positiveTestStringList){
            System.Debug(bracketsAreBalanced(s));
        }
        System.Debug('::    Bracket Balancer : Negatives    ::');
        for(String s: negativeTestStringList){
            System.Debug(bracket.bracketsAreBalanced(s));
        }
        // Part 6
        System.debug('::    Update Account Sizes    ::');
        updateAccountSize();
        // Part 7
        System.debug('::    Update CA Leads    ::');
        updateCALeads();
        // Part 8
        System.debug('::    Update Past Due Opportunities    ::');
        closePastDueOpportunities(); 
        }

/*
 * 1. Return the nth Fibonacci number
 * Test Cases:
 * Input: 0     Output: 0
 * Input: 1    Output: 1
 * Input: 2     Output: 1
 * Input: 10    Output: 55
*/

    public static Integer nFibonacci( Integer n ){
        if (n<0) return null;
        // Base case 0
        if (n==0) return 0;
        // Base case 1
        if (n==1) return 1;
        // If not base case, 'simplify/reduce' the input until matches base case
        return nFibonacci(n-1) + nFibonacci(n-2);
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
            Boolean swapped = true;
            Integer temp;

            // Loop until we don't have any more swaps
            while(swapped){
                swapped = false;
                // Loop over all elements, checking for out of order items
                for(Integer i=0; i<intList.Size() - 1; i++){
                    // If out of order items found, swap
                    if(intList[i] > intList[i+1]){
                        swapped = true;
                        temp = intList[i];
                        intList[i] = intList[i+1];
                        intList[i+1] = temp;
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
        //------------------------------//
        //  One-liner recursion Method  //
        //------------------------------//
        // Ternary operator; Where the true condition is the base case, and the false condition is the simplified call
        if(n<0) return null;
        return (n==0) ? 1 : n*nFactorial(n-1);

        //------------------------------//
        //  Simple Recursion Method     //
        //------------------------------//
        // // Base case
        // if(n == 0) return 1;
        // // Simplification
        // return (n * nFactorial(n-1));

 
        //------------------------------//
        //  Loop-based Method           //
        //------------------------------//
        // integer result = 1;
		// // Multiply each element by the next
        // for(Integer i = 1; i <= n; i++){
        //     result *= i;
        // }
        // return result;
    }

/*
 * 4. Rotate left
 * Given an array, array, and an integer, n, rotate the values in array left n times and return array
 * Test Cases:
 * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
 * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
*/

    public static Integer[] rotateLeftNTimes( Integer[] array1, Integer n) {
            
            for(Integer i=0; i<n; i++){
                // Adding first element to end
                array1.add(array1[0]);
                // Removing first element
                array1.remove(0);
            }
            return array1;
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

    private static Set<String> bOpen = new Set<String>{'(', '{', '['};
    private static Set<String> bClose = new Set<String>{')', '}', ']'};
    private static List<bType> bStack = new List<bType>();
    public enum bType{paren, curly, square}
    
    public static Boolean bracketsAreBalanced( String s ) {
        integer errCode = 0;
        bStack.clear();
        for(integer i=0; i<s.length(); i++){
            String c = s.substring(i, i+1);
            // Push opening brackets onto stack
            if(bOpen.contains(c)) bStackPush(c);
            // Check closing brackets for match
            else if(bClose.contains(c)) errCode = bStackCheck(c);
            // Stop if error
            if(errCode == -1) break;
        }
        // Check for errors && make sure stack is empty
        if(errCode != 0){
            System.debug('Error: Mismach Found!');
            return false;
        }
        else if(bStack.size() != 0){
            System.debug('Error: Missing closing bracket');
            return false;
        }
        // Otherwise, all brackets match up!
        return true;
    }
    
    Private Static Void bStackPush(String s){
        // Push corresponding bracket bType onto stack
        if(s=='(') bStack.add(bType.paren);
        else if(s=='[') bStack.add(bType.square);
        else if(s=='{') bStack.add(bType.curly);
    }
    
    Private Static Integer bStackCheck(String s){
        integer lastIndex = bStack.size() - 1;
        
        // Mismatch; Closing brace with nothing in the stack
        if(lastIndex < 0) return -1;
        
        bType bStackEnd = bStack.get(lastIndex);
        
        // Removes matching bracket bType from end of stack; If there is one
        if(s==')' && bStackEnd == bType.paren) bStack.remove(lastIndex);
        else if(s==']' && bStackEnd == bType.square) bStack.remove(lastIndex);
        else if(s=='}' && bStackEnd == bType.curly) bStack.remove(lastIndex);
        // Mismatch; If there isn't a matching bracket at the end of the stack.
        else return -1;
        // No errors
        return 0;
    }

/* You should NOT be submitting answers that you find online. You will be expected to be able to defend any of these solutions without notice. */

/*
 * 6. Create a method that retrieves a list of all accounts and updates those accounts.
 *      Create a custom field on the Account standard object called Size__c that will be a 
 * 	picklist containing small/medium/large.
 *     Create a method that retrieves a list of all accounts. 
 *         - If an account has between 1-1000 employees then it is classified as small.
 *         - If an account has between 1001-10000 employees it is classified as medium.
*         - If an account has more than 10000 employees it is classified as large.
 *     Update the Size__c field on each account to reflect the amount of employees in the Account.
*/

    public static void updateAccountSize( ) {
        List<Account> allAccounts = [SELECT Name, Id, NumberOfEmployees, Size__c FROM Account];

        for(Account acct: allAccounts){
            if(acct.NumberOfEmployees >=1 && acct.NumberOfEmployees <= 1000){
                // System.debug('Marking Small');
                acct.Size__c = 'small';
            }
            else if(acct.NumberOfEmployees <= 10000){
                // System.debug('Marking Medium');
                acct.Size__c = 'medium';
            }
            else if(acct.NumberOfEmployees > 10000){
                // System.debug('Marking Large');
                acct.Size__c = 'large';
            }
        }
        update allAccounts;
    }

/* 
 * 7. Create a method that will find all leads that contain 'ca' in their fields. 
 *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 */

    public static void updateCALeads( ) {
        List<Lead> allLeads = [SELECT Address, Status, Description FROM Lead WHERE State = 'CA'];

        for(Lead l: allLeads){
                l.status = 'Closed - Not Converted';
                l.Description = 'We are no longer doing business in California.';
                // System.debug(l);
        }
        update allLeads;
    }

/*
 * 8. Create a method that will find all Opportunities which have already passed their Close Date 
 * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
 * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
 */

    public static void closePastDueOpportunities( ) {
        List<Opportunity> allOpportunities = [SELECT stageName FROM Opportunity WHERE CloseDate < TODAY and StageName != 'Closed Won'];
        for(Opportunity oppo: allOpportunities){
            oppo.stageName = 'Closed Lost';
            // System.debug(oppo);
        }
    }
}
