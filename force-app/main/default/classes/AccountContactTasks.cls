/*
	Author name: Harsha Tolani
	Date: 14/10/2022
	Description :In this we make Custom Controller for Account Contact Task.
*/

public class AccountContactTasks {
    //Added by Harsha Tolani :Date:14/10/2022 In this method we fetch data from Account
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id,Name FROM Account];
    }
    //Added by Harsha Tolani :Date:14/10/2022 In this method we fetch data from Contact
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String selId) {
        return [SELECT Id,Name FROM Contact WHERE AccountId =: selId];
    }


}