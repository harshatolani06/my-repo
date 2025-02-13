public class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds){
        List<Account> accountsToUpdate = new List<Account>();
        
        List<Account> accounts = [SELECT Id, Name,(SELECT Id from Contacts) from Account WHERE Id in: accountIds];
        for(Account acc: accounts){
            List<Contact> contactList = acc.Contacts;
            acc.Number_Of_Contacts__c = contactList.size();
            accountsToUpdate.add(acc);
        }
        
        Update accountsToUpdate;
       }
}