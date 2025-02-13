public class MapTesting {
    public static void getContactName(Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap){
        Map<Id, List<String>>  accountContactsMap = new Map<Id, List<String>>();
        System.debug(conNewMap.values());
        for(Contact conRec: conNewMap.values()){
            List<String> conRecords = accountContactsMap.get(conRec.AccountId);
            if(conRecords == NULL){
                conRecords = new List<String>();
            } 
            string contactName = conRec.FirstName != NULL ? conRec.FirstName + ' ' : '';
            contactName +=  conRec.LastName;
            conRecords.add(contactName);
            accountContactsMap.put(conRec.AccountId, conRecords);
        }
        List<Account> modifiedAccountRecords = new List<Account>();
        for(Account accRec: [SELECT Id, Contact_Name__c , Name FROM Account WHERE Id IN: accountContactsMap.keySet()]){
           accRec.Contact_Name__c += ',' + accountContactsMap.get(accRec.Id).toString().substringAfter('(').substringBeforeLast(')');
           modifiedAccountRecords.add(accRec);
        }
        //System.debug
        if(modifiedAccountRecords.size() > 0){
            UPDATE modifiedAccountRecords;
        }
    }
}