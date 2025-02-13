public class AccountHandler {
    public static void beforeInsert(List<Account> accRecords){
     AccountHelper.matchBilingAddress(accRecords,NULL,NULL);   
    }
    public static void beforeUpdate(List<Account> accRecords, Map<Id, Account> accOldMap, Map<Id, Account> accNewOld){
      AccountHelper.matchBilingAddress(accRecords, accOldMap, accNewOld);     
    }
}