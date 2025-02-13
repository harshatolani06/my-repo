public class ImperativeDemo {
    
    @AuraEnabled
    public static List<Contact> getContactRecords(){
        List<Contact> contactListforLWC = [SELECT Id,Name FROM Contact];
        return contactListforLWC;
    }

}