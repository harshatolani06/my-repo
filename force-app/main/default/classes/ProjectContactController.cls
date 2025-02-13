public with sharing class ProjectContactController {
   	@AuraEnabled 
    public static List<Contact> searchContacts(){
        return[Select Id, Name, Phone from Contact Limit 30];
    }
     @AuraEnabled 
    public static List<Contact> searchbyquery(string Searchquery){
        String name ='%'+searchquery+'%';
        return[Select Id, Name, Phone from Contact Where name LIKE:name LIMIT 30];
    }

}