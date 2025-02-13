/*
	Name: ContactTriggerHelper
	Author name: Harsha Tolani
	Date: 20/8/2022
	Description :In this we make Custom Controller for contact trigger
*/

public class ContactTriggerHelper {
    //Added by Harsha Tolani : 20-Aug-2022 This method is used for count the contact count update the contact count, delete, undelete
   /* public static void countContacts(List<Contact> contactRecords,  List<Contact> oldRec){
      Set<Id> AcctIds = new Set<Id>(); 
        //System.debug('hello'); 
        if(contactRecords!=Null){
            //Iterate over the contact new records
        	for(Contact con: contactRecords){
            	if(con.accountId != null){
           			AcctIds.add(con.accountId); // add account ids in set.
            	}
       		}
        }
        if(oldRec != null){
            //Iterate over the contact old records
        	for(Contact con: oldRec){
             	if(con.accountId != null){
           			AcctIds.add(con.accountId);
                }
            }
        }
        //get the record from contact and account and total field count is used for update purpose.
        List<Account> accounts= [Select Id,Total_Field_Count__c,(Select Id from Contacts) from Account where Id in :AcctIds];
        if(!accounts.isEmpty()){
            for(Account acc: accounts) {
                acc.Total_Field_Count__c=acc.contacts.size(); //here size() used for count the contact records. 
            }
        }
       if(accounts.size()>0){
       update accounts;
        }
    }*/
    
    
    //Added by Harsha Tolani : 21-Aug-2022 This method is used for count the contact count update the contact count, delete, undelete
    public static Map<Id, Id> getAccountIds(Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap){
        //Set<Id> accountIds = new Set<Id>();
        Map<Id, Id> accountIdsMap = new Map<Id, Id>();
        for(Contact conRec : conNewMap.values()){
            if(conRec.AccountId != NULL){
                   //accountIds.add(conRec.AccountId);
                   accountIdsMap.put(conRec.AccountId, conRec.AccountId);    
            }
            if(conOldMap != NULL && conOldMap.containsKey(conRec.Id)){
                Contact contactRec = conOldMap.get(conRec.Id);
                accountIdsMap.put(contactRec.AccountId, contactRec.AccountId);
              //accountIds.add(conOldMap.get(conRec.Id).AccountId);   
            }
        }
        return accountIdsMap;
    }
    // Added by Harsha Tolani 22-Aug-2022 Calling common methods for getting account ids and update accounts.
    public static void accountContactsCount(Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap){
        Map<Id, Id> accountIdsMap = new Map<Id, Id>();
        // Added by Harsha Tolani Using this method for getting AccountIds;
        accountIdsMap = getAccountIds(conNewMap, conOldMap);
        // Added by Harsha Tolani using this method for updating the account contact count on account.
        //changeAccountContactsCount(accountIdsMap);
        
        // Added by Harsha Tolani using this method for updating the account contact Name on account.
        assignContactsName(accountIdsMap); 
    }
    
    // Added by Harsha Tolani 23-Aug-2022 In this method we are updating the Account Contact Count on account.
 /*   public static void changeAccountContactsCount(Map<Id, Id> accountIdsMap){
        //List<Account> accRecords = new List<Account>();
        Map<Id, Account> accRecordsMap = new Map<Id, Account>([SELECT Id, Total_Field_Count__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accountIdsMap.keySet()]);
        //accRecords = [SELECT Id, Total_Field_Count__c, (SELECT Id FROM Contacts) FROM Account WHERE Id IN : accountIdsMap.keySet()];
        Map<Id, Account> modifiedAccountRecords = new Map<Id, Account>();
        for(Account accRec: accRecordsMap.values()){
            accRec.Total_Field_Count__c =  accRec.Contacts.size();
            modifiedAccountRecords.put(accRec.Id, accRec);
            //modifiedAccountRecords.add(accRec);
        }
        if(modifiedAccountRecords != NULL && modifiedAccountRecords.size() > 0){
            UPDATE modifiedAccountRecords.values();
        }
    }*/
    // Added by Harsha Tolani 23-Aug-2022 In this method we are Asssigning the Account Contact Name on account.
    public static void assignContactsName(Map<Id,Id> accountIdsMap){
        Map<Id,Contact> conRecordsMap = new Map<Id,Contact>([SELECT Id,Name,AccountId FROM Contact WHERE AccountId IN :accountIdsMap.keySet()]);
        Map<Id,List<String>> accountContactsNameMap = new Map<Id, List<String>>();
        for(Contact conRec : conRecordsMap.values()){
            List<String> conNames = accountContactsNameMap.get(conRec.AccountId);
            if(conNames == NULL){
                conNames = new List<String>();
            } 
            //string contactName = conRec.FirstName != NULL ? conRec.FirstName + ' ' : '';
           // contactName +=  conRec.LastName;
            conNames.add(conRec.Name);
            accountContactsNameMap.put(conRec.AccountId, conNames);
        }
        //Added by Harsha Tolani : Here we are updating the value of Account Contact Name on Account
        Map<Id, Account> modifiedAccountRecords = new Map<Id, Account>();
        for(Id accountId: accountIdsMap.keySet()){
            Account accRec = new Account();
            accRec.Id =accountId;
            System.debug( accountContactsNameMap);
            System.debug(accountContactsNameMap.size());
            if(accountContactsNameMap != NULL && accountContactsNameMap.containsKey(accountId)){
        	 	accRec.Total_Field_Count__c = accountContactsNameMap.get(accountId).size();
            	 accRec.Contact_Name__c =accountContactsNameMap.get(accountId).toString().substringAfter('(').substringBeforeLast(')');   
            }
            else{
                accRec.Contact_Name__c=' ';
                accRec.Total_Field_Count__c=0;
                
            }
			modifiedAccountRecords.put(accRec.Id, accRec);
        }
        if(modifiedAccountRecords != NULL && modifiedAccountRecords.size() >0){
            UPDATE modifiedAccountRecords.values();
        }
    }
}