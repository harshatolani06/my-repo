public class AccountContactTriggerHandler {
    // Added by Harsha Tolani 20-Aug-2022 : this method calling for before insert helper methods.
    public static void beforeInsert(List<Account> AccountRecords){
        
    }
    // Added by Harsha Tolani 20-March-2022 : this method calling for after insert helper methods.
    public static void afterInsert(List<Account> AccountRecords, Map<Id, Account> accNewMap){
        AccountContactTriggerHelper.insertAccountRecord(AccountRecords, accNewMap);  
    }
    // Added by Harsha Tolani 20-Aug-2022 : this method calling for before update helper methods.
    public static void beforeUpdate(List<Account> AccountRecords, Map<Id, Account> accNewMap, Map<Id, Account> accOldMap){
        
    }
    // Added by Harsha Tolani 20-Aug-2022 : this method calling for after update helper methods.
    public static void afterUpdate(List<Account> AccountRecords, Map<Id, Account> AccNewMap, Map<Id, Account> accOldMap){
        
    }

}