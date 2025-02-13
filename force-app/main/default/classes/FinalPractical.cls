/*
	Author name: Harsha Tolani
	Date: 14/10/2022
	Description :In this we make Custom Controller for Account Contact Task.
*/
public class FinalPractical {
    //Added by Harsha Tolani :Date:14/10/2022 In this method we fetch data from Account
    @AuraEnabled
    public static List<Account> getAccounts(){
      return[Select id,name from Account];
    }
     //Added by Harsha Tolani :Date:14/10/2022 In this method we fetch data from Contact related to that account
    @AuraEnabled
    public static List<Contact> getContact(String AccountName){
       return[Select id,firstName,LastName,Name from Contact where Account.Name=:AccountName];
    }
    //Added by Harsha Tolani :Date:14/10/2022 In this method we fetch  Contact related task.
    @AuraEnabled
    public static List<Task> getTask(String contactName){
      return[select id,Who.Name,subject from Task where who.name=:contactName];
      
    }
}