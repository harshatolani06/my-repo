public class ContactNameTriggerHelper {
    public static void AccountContactName(List<Contact> contactRecords,  Map<Id, Contact> conNewMap) {
  	Set<id> AccIdList = new Set<id>();
       List<String> contactNames = new List<String>();
            	for(Contact con : contactRecords){
            		AccIdList.add(con.accountid);
       			 }
         Map<Id, Account> modifiedAccountRecords = new Map<Id, Account>();
         Map<Id, Account> accRecordsMap = new Map<Id, Account>([Select id, Contact_Name__c, (Select Name From Contacts) From Account Where Id In : AccIdList]);
             for(Account acc : accRecordsMap.values()){
                for(Contact con : acc.contacts){
                    contactNames.add(con.Name);
            }
            acc.Contact_Name__c = String.join(contactNames, ', ');
             
           modifiedAccountRecords.put(acc.Id,acc);
           contactNames.clear();
         }          
      if(modifiedAccountRecords.size()>0)
            UPDATE modifiedAccountRecords.values();
    
     }
}