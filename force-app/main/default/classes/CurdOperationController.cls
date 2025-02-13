public class CurdOperationController {
    @AuraEnabled(cacheable=true)
    public static List<Account> fetchAccountData(){
        return [SELECT Name, Id,  BillingCity, BillingState, BillingPostalCode,  Phone FROM Account];
    }
    @AuraEnabled(cacheable=true)
    public static void deleteAccountData(Id recordId){
        List<Account> acc = [SELECT Name, Id,  BillingCity, BillingState, BillingPostalCode,  Phone FROM Account Where Id =: recordId];
        delete acc;
    }

}