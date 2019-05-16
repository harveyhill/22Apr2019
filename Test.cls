public with sharing class Test {
    public static void makeAccounts (Integer amount){
        List<Account> mAccounts = new List<Account>();
        for (Integer i = 1; i <= amount; i++) {
            Account currentAccount = new Account();
            currentAccount.Name = 'Test ' + i;
            currentAccount.NumberOfEmployees = 3;
            mAccounts.add(currentAccount);
        }
        
        insert mAccounts;

    }
        public static void makeLeads (Integer amount){
        List<Lead> mLeads = new List<Lead>();
        for (Integer i = 1; i <= amount; i++) {
            Lead currentLead = new Lead();
            currentLead.State = 'CA';
            currentLead.Description = 'Looking Good Billy Ray!';
            currentLead.Status = 'New';
            currentLead.LastName = 'Test ' + i;
            currentLead.Company = 'Test ' + i;
            mLeads.add(currentLead);
        }
        
        insert mLeads;

    }

        public static void makeOpportunities (Integer amount){
        List<Opportunity> mOpportunity = new List<Opportunity>();
        Date testCloseDate = Date.newInstance(2018, 10, 29);
        for (Integer i = 1; i <= amount; i++) {
            Opportunity currentOpportunity = new Opportunity();
            currentOpportunity.Name = 'Test ' + i;
            currentOpportunity.CloseDate = testCloseDate;
            currentOpportunity.StageName = 'New';
            mOpportunity.add(currentOpportunity);
        }
        
        insert mOpportunity;

    }
}
