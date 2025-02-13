public with sharing class ContactController1 {
   @AuraEnabled
    public static List<Contact> createContact(List<Contact> contactRecords){
       if(contactRecords.size()>0){
        Insert contactRecords;
       } 
       return contactRecords;
    }
   
}