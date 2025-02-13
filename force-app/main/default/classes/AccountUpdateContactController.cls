public class AccountUpdateContactController {
     public static void updateAccount(List<Contact> contactRecords){
         List<Account> AcclistToUpdate = new List<Account>();
    	 Map<Id,Contact> MapOfContact = new Map<Id,Contact>();
    	 For(contact Con : contactRecords){
        If(Con.AccountId != Null){
            MapOfContact.Put(Con.AccountId,Con);
        }
    }
    List<Account> AccList = [Select id, Name,Phone From Account where Id =:MapOfContact.keyset()];
    For(Account Acc:AccList){
        Account Acc1 = New Account();
        If(MapOfContact.containsKey(Acc.Id)){
            Acc1.Id =Acc.id;
            Acc1.phone=MapOfContact.get(Acc.id).phone;
            AcclistToUpdate.Add(Acc1);
        }
        If(!AcclistToUpdate.Isempty()){
            Update AcclistToUpdate;
        }
    }
     }
}