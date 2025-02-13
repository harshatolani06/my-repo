public class wireDemo {
	@AuraEnabled(cacheable=true)
    public static List<Contact> getContactsList(){
        List<Contact> contactDetails = [SELECT Id,Name FROM Contact];
        return contactDetails;
    }
}