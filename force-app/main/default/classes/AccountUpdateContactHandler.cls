public class AccountUpdateContactHandler {
	 // Added by Harsha Tolani 14-10-2022 : this method calling for before insert helper methods.
    public static void beforeInsert(List<Contact> contactRecords){
     //AccountUpdateForContact.updateAccountField(contactRecords);
    }
    // Added by Harsha Tolani 14-10-2022 : this method calling for after insert helper methods.
    public static void afterInsert(List<Contact> contactRecords){
       // AccountUpdateForContact.updateAccountField(contactRecords);
    }
    // Added by Harsha Tolani 14-10-2022 : this method calling for before update helper methods.
    public static void beforeUpdate(List<Contact> contactRecords, Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap){
       // AccountUpdateForContact.updateAccountField(contactRecords,conNewMap,conOldMap);
    }
    // Added by Harsha Tolani 14-10-2022: this method calling for after update helper methods.
    public static void afterUpdate(List<Contact> contactRecords){
     //  AccountUpdateForContact.updateAccountField(contactRecords);
     AccountUpdateContactController.updateAccount(contactRecords);
       
    }
    // Added by Harsha Tolani 14-10-2022 : this method calling for after delete helper methods.
    public static void afterDelete(List<Contact> contactRecords,  Map<Id, Contact> conOldMap){
    //  AccountUpdateForContact.updateAccountField(contactRecords,conOldMap, null);
    }
    
    // Added by Harsha Tolani 14-10-2022 : this method calling for after delete helper methods.
    public static void afterUndelete(List<Contact> contactRecords, Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap){
       // AccountUpdateForContact.accountContactsCount(contactRecords, null, null);
    }

}