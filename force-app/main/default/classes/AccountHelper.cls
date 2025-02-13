public class AccountHelper {
    public static void matchBilingAddress(List<Account> accRecords,  Map<Id, Account> accOldMap, Map<Id, Account> accNewOld){
 	for(Account acc :  accRecords){
        if(acc.Match_Billing_Address__c == true){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
   }

}