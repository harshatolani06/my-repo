public class AccountUpdateForContact {
    public static void updateAccountField(List<Contact> contactRecords){
        Set<Id> setId = new Set<Id>();
        for(Contact con:contactRecords){
            setId.add(con.AccountId);
        }
        system.debug('setId ' + setId);
        
        List<Account> accItemList = [Select Id, Name, Phone, (Select Id, FirstName, LastName, Phone, AccountId From Contacts) From Account Where Id IN:setId];            
        for(Account a1:accItemList){
            for(Contact c1:a1.Contacts){
                if(c1.Phone !=null){
                     a1.Phone = c1.Phone;
                     update accItemList;                    
                }
            }
        }
        
        
    }
    
}