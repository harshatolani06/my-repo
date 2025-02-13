public with sharing class ConRecordsController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {
        return [SELECT Id, FirstName, LastName, Email, Title, Phone FROM Contact];
    }
}