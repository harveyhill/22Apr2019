public with sharing class updateAccountSize {

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
        for (Account emacc1 : accountList) {
            if (emacc1.NumberOfEmployees < 1000){
                emacc1.size__c = 'small';
            }else if (emacc1.NumberOfEmployees > 10000){
                    emacc1.size__c = 'large';
            }else if ( emacc1.NumberOfEmployees !=NULL){
                emacc1.size__c = 'medium';
                } 
            
        }

        update accountList;
    }
}
