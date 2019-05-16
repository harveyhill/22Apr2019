public with sharing class UtilityDataFactory {
    /*
     * Creates accounts with different size
     new Account(Name = 'Generic Name' + i
    */
    public static void makeAccountsStepEmployees(Integer numberOfAcc, Integer sizeStep) {
        List<Account> accs = new List<Account>();
        
        for (Integer i = 0; i < numberOfAcc - 2; i++) {
            accs.add(new Account(Name = 'Generic Name' + i, NumberOfEmployees = sizeStep * (i+1)));
        }
        // empty status field
        accs.add(new Account(Name = 'Generic Name' + (numberOfAcc-1)));
        // empty employee field
        accs.add(new Account(Name = 'Generic Name' + numberOfAcc, NumberOfEmployees = -100));
        insert accs;
    }

    public static void makeCALeads(Integer amount) {
        List<Lead> leads = new List<Lead>();

        for (Integer i = 0; i < amount-1; i++) {
            Lead curr = new Lead();
            curr.LastName = 'Generic ' + i;
            curr.State = 'CA';
            curr.Status = 'Rain check';
            curr.Company = 'ArunTech';
            leads.add(curr);
        }
        // empty status field
        Lead curr = new Lead();
        curr.LastName = 'Generic ' + amount;
        curr.Status = 'Rain check';
        curr.Company = 'ArunTech';
        leads.add(curr);

        insert leads;
    }

    public static void makeOpportunities(Date startop, Date endop) {
        List<Opportunity> opps = new List<Opportunity>();

        for (Integer i = 0; i < endop.daysBetween(startop)/2; i++) {
            Opportunity op = new Opportunity();
            op.Name = 'Generic ' + i;
            op.StageName = '11th';
            op.CloseDate = startop.addDays(i*2);
            opps.add(op);
        }

        insert opps;
    }
}
