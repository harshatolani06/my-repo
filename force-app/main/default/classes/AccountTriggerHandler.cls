public class  AccountTriggerHandler{
    // Added by Harsha Tolani : this method calling for before insert helper methods.
    public static void beforeInsert(List<Account> accountRecords){
        AccountTriggerHelper.fetchAccountRecords(accountRecords);
    }
}