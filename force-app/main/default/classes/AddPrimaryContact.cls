public class AddPrimaryContact implements Queueable {
    Private Contact c;
    Private String s;
    public AddPrimaryContact(Contact con, String state){
        this.c = con;
        this.s = state;
    }
    public void execute(QueueableContext context) {
        List<Account> accList = [SELECT ID, Name ,(Select id,FirstName,LastName from contacts )
                                 FROM ACCOUNT WHERE BillingState = :s LIMIT 200 ];
        List<Contact> conList=new List<Contact>();
        for(Account a: accList){
            Contact cont = c.clone(false,false,false,false);
            cont.AccountId = a.Id;
            conList.add(cont);
        }
          if(conList.size() >0 )
         {
             insert conList;
         }
    }
}