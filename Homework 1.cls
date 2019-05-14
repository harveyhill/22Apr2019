public class Homework {
    public static Integer nFibonacci( Integer n ){
        Integer tempnumber = 0;
        Integer currentnumber = 0;
        Integer pastnumber = 0;
        If (n > 0) pastnumber = 1;
        do {
            tempnumber = currentnumber;
            currentnumber += pastnumber;
            pastnumber = tempnumber;
            n--;
            } while (n > 0);
            return currentnumber;
    }
    
    public static Integer[] sortArray( Integer[] intList ) {
        Integer tempInd;
        for (Integer i = 0; i < intList.size() - 1; i++) {
            for (Integer j = i + 1; j < intList.size(); j++) {
                if (intList[i] > intList[j]) {
                    tempInd = intList[i];
                    intList[i] = intList[j];
                    intList[j] = tempInd;
                }
            }
        }
        return intList;
    }
    public static Integer nFactorial( Integer n) {
        Integer factorial = 0;
        if (n == 0) factorial = 1;
        do {
            factorial *= n;
            n--;
        } while (n >= 0);
        return factorial;
    }
    public static Integer[] rotateLeftNTimes( Integer[] numberArray, Integer n) {
        Integer firstInd;
        for (Integer i = 0; i < n; i++) {
            for (Integer j = 0; j < numberArray.size(); j++) {
                if (j == 0) {
                    firstInd = numberArray[j];
                    numberArray[j] = numberArray[j + 1];
                } else if (j == numberArray.size() - 1) {
                    numberArray[j] = firstInd;
                } else {
                    numberArray[j] = numberArray[j + 1];
                }
            }
        }
        return numberArray;
    }
    
    public static Boolean bracketsAreBalanced( String s ) {
        String [] brackets = s.split('');
        
        if (Math.mod(brackets.size(), 2) != 0) return false;
        for (Integer i = 0; i < brackets.size(); i++) {
            for (Integer j = 0; j < brackets.size(); j++) {
                switch on brackets[j] {
                    when ')' {
                        if (brackets[j-1] == '(') {
                            brackets.remove(j);
                            brackets.remove(j-1);
                        } else {
                            return false;
                        }
                    } when '}' {
                        if (brackets[j - 1] == '{') {
                            brackets.remove(j);
                            brackets.remove(j-1);
                        } else {
                            return false;
                        }
                    } when ']' {
                        if (brackets[j - 1] == '[') {
                            brackets.remove(j);
                            brackets.remove(j-1);
                        } else {
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }
    
    public static void updateAccountSize( ) {
        List <Account> accountList = [select size__c, numberofemployees
                                      from account
                                      where numberofemployees != null];
        List <Account> accountToUpdate = new List <Account>();
        for (Account a : accountList) {
            if (a.numberofemployees < 1001) a.size__c = 'small';
            else if (a.numberofemployees > 1000 && a.numberofemployees < 10001) a.size__c = 'medium';
            else a.size__c = 'large';
            accountToUpdate.add(a);
        }
        update accountToUpdate;
    }
    public static void updateCALeads( ) {
        List <Lead> leadList = [select status, description 
                                from Lead 
                                where state = 'CA'];
        List <Lead> leadToUpdate = new List <Lead>();
        for (Lead l : leadList) {
            l.status = 'Closed - Not Converted';
            l.description = 'We are no longer doing business in California.';
            leadToUpdate.add(l);
        }
        update leadToUpdate;
    }
    
    public static void closePastDueOpportunities( ) {
        List<Opportunity> opportunityList = [select stagename 
                                            from opportunity 
                                            where closedate < Today 
                                            and stagename != 'Closed Won'];
        List<Opportunity> opportunityToUpdate = new List<Opportunity>();
        
        for (Opportunity o : opportunityList) {
            o.stagename = 'Closed Lost';
            opportunityToUpdate.add(o);
        }
        update opportunityToUpdate;
    }
}
