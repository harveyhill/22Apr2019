public class AssessmentMay10 {
//system.debug(AssessmentMay10.rotateLeftNTimes(new List<Integer>{1,2,3,4,5}, 6));
//system.debug(AssessmentMay10.nFibonacci(10));
//system.debug(AssessmentMay10.nFactorial(5));
//system.debug(AssessmentMay10.sortArray(new List<Integer>{6,4,5,3,4,2,8,1,7,4,3,7,1,0}));
//system.debug('the answer is: ' + AssessmentMay10.bracketsAreBalanced(')))'));
//AssessmentMay10.updateAccountSize();
//AssessmentMay10.updateCALeads();
//AssessmentMay10.closePastDueOpportunities();
    
	/*
     * 1. Return the nth Fibonacci number
     * Test Cases:
     * Input: 0     Output: 0
     * Input: 1    Output: 1
     * Input: 2     Output: 1
     * Input: 10    Output: 55
    */
    public static Integer nFibonacci(Integer n) {
        Integer prev = 0, num, curr = 1;
        // first 2 items are not computable
        // prec    curr/num    ->
        // 0       1            1       2       3       5       ...
        // store 2 previous numbers and move every iteraion
        if(n < 0) return -1;
        if(n == 0) return 0;
        if(n == 1) return 1;
        for (Integer i = 1; i<n; i++) {
            num = prev + curr;
            prev = curr;
            curr = num;
        }
    	return num;
    }
    
    /*
     * 2. Sort an array of integers.
     * Test Cases:
     * Input: [2,4,5,1,3,1]     Output: [1,1,2,3,4,5]
     * Input: [5,4,3,2,1]     	Output: [1,2,3,4,5]
     *
     * Don't use the sort() method... that would be lame.
    */
    public static List<Integer> sortArray(List<Integer> arr) {
        // simplest bubble sort
        for (Integer i = 0; i < arr.size()-1; i++) {
            for (Integer j = i+1; j < arr.size(); j++) {
                if (arr[i] > arr[j]) {
                    Integer tmp = arr[i];
                    arr[i] = arr[j];
                    arr[j] = tmp;
                }
            }
        }

    	return arr;
    }
    
    /*
     * 3. Return the factorial of n.
     * Test Cases:
     * Input: 0    Output: 1
     * Input: 1    Output: 1
     * Input: 3    Output: 6
    */
    public static Integer nFactorial(Integer n) {
        // move n by 1 and multiply input by return
        return n == 0? 1: n * nFactorial(Math.abs(n)-1);
    }
    
    /*
     * 4. Rotate left
     * Given an array, array, and an integer, n, rotate the values in array left n times and return array
     * Test Cases:
     * Input: [1,2,3,4,5], 1    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 6    Output: [2,3,4,5,1]
     * Input: [1,2,3,4,5], 3    Output: [4,5,1,2,3]
    */
    //system.debug(AssessmentMay10.rotateLeftNTimes(new List<Integer>{1,2,3,4,5}, 1));
    public static List<Integer> rotateLeftNTimes(List<Integer> arr, Integer n) {
        List<Integer> res = new List<Integer>();
        
        Integer len = arr.size();
        if (len <= 0) return res;
        // use modulus to find how much the actual shift is. (if n > arr.size)
        Integer shift = Math.mod(n, len);
        // if n is negative
        if (shift < 0) shift += len;

        // go through every character and place them into correct position
        for (Integer i = 0; i < len; i++) {
            // shift i by shift amount
            // if it's bigger than array length substruct shift by array length
            // so it stays within 
            Integer pos = i+shift > len-1? (i+shift)-len: i+shift;
            res.add(arr[pos]);
        }
    	return res;
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
    public static Boolean bracketsAreBalanced(String s) {
        String open = '([{', close = ')]}';
        // if string is less than 2 caracters long
        // or if it starts from close braces return false
        if (s.length() == 0) return True;
        if (s.length() < 2) return False;
        if (close.contains(s.substring(0, 1))) return False;

        // sid means String ID. It's used as temporary id's
        Integer sid;
        // stores order in which you need to 
        List<String> order = new List<String>();
        for (Integer i = 0; i < s.length(); i++) {
            // current character
            String curr = s.substring(i, i+1);
            if (open.contains(curr)) {
                // if curr is open braces add same type of closing braces to the order
                sid = open.indexOf(curr);
                String newel = close.substring(sid, sid+1);
                order.add(newel);
            } else {
                if (!close.contains(curr)) continue; // not braces - move on
                // if it's vorrect closng braces - remove it from order
                // else string is not balanced
                Integer lastId = order.size()-1;
                String lastOrder = order[lastId];
                if (curr.equals(lastOrder)) {
                    order.remove(lastId);
                } else {
                    return False;
                }
            }
        }

        // if order is not empty then not all braces were closed
        // if all braces are close string is balanced
        if (order.size() == 0) {
            return True;
        } else {
            return False;
        }
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
    public static void updateAccountSize() {
    	List<Account> accs = [SELECT name, NumberOfEmployees, size__c FROM Account];
        for (Account acc: accs) {
            if (acc.NumberOfEmployees == null) continue;
            else if (acc.NumberOfEmployees <= 1000) acc.size__c = 'Small';
            else if (acc.NumberOfEmployees > 10000) acc.size__c = 'Large';
            else acc.size__c = 'Medium';
        }

        update accs;
    }
     
    /* 
     * 7. Create a method that will find all leads that contain 'ca' in their fields. 
     *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
     * Converted' and their description should display the message, "We are no longer doing 
     * business in California."
     */
    public static void updateCALeads() {
    	List<Lead> leads = [SELECT state, status, description 
                            FROM Lead 
                            WHERE state = 'ca'];
        for (Lead lead : leads) {
            lead.status = 'Closed - Not Converted';
            lead.description = 'We are no longer doing business in California.';
        }

        update leads;
    }
     
    /*
     * 8. Create a method that will find all Opportunities which have already passed their Close Date 
     * and have a Stage field that is not 'Closed Won'. Since they have passed their Close Date and 
     * they are not marked as 'Closed Won', they should be marked as 'Closed Lost'.
     */
    public static void closePastDueOpportunities() {
    	List<Opportunity> ops = [SELECT StageName, CloseDate 
                                 FROM Opportunity 
                                 WHERE StageName != 'Closed Won'];
        
        for (Opportunity op: ops) {
            if (op.CloseDate < System.today()) op.StageName = 'Closed Lost';
        }

        update ops;
    }
}