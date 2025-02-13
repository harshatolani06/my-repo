public class AccountContactTriggerHelper {
	public static void insertAccountRecord(List<Account> AccountRecords, Map<Id, Account> AccNewMap){
         
        List<Account> accRec = new List<Account>([SELECT Id FROM Account]); 
        Set<Id> AcctIds = new Set<Id>();  
        for(Account acc: AccountRecords){
            
            
        }
    }
}