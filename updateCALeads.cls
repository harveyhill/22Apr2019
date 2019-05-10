/* 
 * 7. Create a method that will find all leads that contain 'ca' in their fields. 
 *     If a lead is located in California(CA), change their Lead Status field to 'Closed - Not 
 * Converted' and their description should display the message, "We are no longer doing 
 * business in California."
 * updateCALeads.cls 
*/


public with sharing class updateCALeads {

	public static void updateCALeads( ) {

        	List<Lead> leadList = [SELECT  State, Status, Description FROM Lead WHERE State = 'ca'];

        	for (Lead lfields: leadList) {
                lfields.Status = 'closed not converted';
		lfields.Description = 'We are no longer doing business in California.';
                }

        update leadList;
    }
}
