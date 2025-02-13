/*
	Name: ContactTriggerHandler
	Author name: Harsha Tolani
	Date: 20/8/2022
	Description :In this we make Custom controller to pass the methods which is written in helper.
*/

public class ContactTriggerHandler {
  // Added by Harsha Tolani 20-March-2022 : this method calling for after insert helper methods.
    public static void afterInsert(List<Contact> contactRecords, Map<Id, Contact> conNewMap, List<Contact> oldRec){
    // ContactTriggerHelper.countContacts(contactRecords, oldRec);
	//ContactNameTriggerHelper.AccountContactName(contactRecords,conNewMap); 
	//ContactTriggerHelper.accountContactsCount(conNewMap,Null);
		//MapTesting.getContactName(conNewMap,Null);
	//ContactCountryHelper.CityRecords(contactRecords,conNewMap,Null);
	 	
    }
    
    // Added by Harsha Tolani 20-Aug-2022 : this method calling for after update helper methods.
    public static void afterUpdate(List<Contact> contactRecords, Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap, List<Contact> oldRec){
      //  ContactTriggerHelper.countContacts(contactRecords, oldRec);  
      //	MapTesting.getContactName(conNewMap,conOldMap);
       // ContactTriggerHelper.accountContactsCount(conNewMap, conOldMap);
        ContactCountryHelper.CityRecords(contactRecords,conNewMap,conOldMap);
    }
    // Added by Harsha Tolani 21-Aug-2022 : this method calling for after delete helper methods.
    public static void afterDelete(List<Contact> contactRecords, Map<Id, Contact> conOldMap, List<Contact> oldRec){
       // ContactTriggerHelper.countContacts(contactRecords, oldRec);  
          ContactTriggerHelper.accountContactsCount(conOldMap, conOldMap);
    }
     // Added by Harsha Tolani 21-Aug-2022 : this method calling for after Undelete helper methods.
    public static void afterUnDelete(List<Contact> contactRecords, Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap, List<Contact> oldRec){
      //  ContactTriggerHelper.countContacts(contactRecords, oldRec);
        ContactTriggerHelper.accountContactsCount(conNewMap, conOldMap);  
    }
}