/*
Name: DealerCartTriggerHelper
Author name: Harsha Tolani
Date:6/9/2022
Description :In this we make DealerCartTriggerHelper for DealerCartTrigger
*/
//Added by Harsha Tolani : 6/9/2022 This is a Helper of Dealer xart trigger
public class DealerCartTriggerHelper {
    //Added by Harsha Tolani : 6/09/2022 This is a method in which we get id of contact and account realted to dealer cart 
    Public static void DealerCardRecord(List<Dealer_Cart__c> dealerRecords, Map<Id, Dealer_Cart__c> dealerNewMap, Map<Id, Dealer_Cart__c> dealerOldMap){
        //Set<String> emails = new Set<String>();
        Map<String, Dealer_Cart__c> dealRecordsMap = new Map<String, Dealer_Cart__c>();
        for(Dealer_Cart__c dealerRecord : dealerRecords){
            dealRecordsMap.put(dealerRecord.Email__c,dealerRecord);  
        }
        //getting contact records
        List<Contact> getRecords = new List <Contact>([SELECT Name, Email, AccountId FROM Contact WHERE Email != NULL AND Email IN : dealRecordsMap.keySet()]);
        Map<String, Contact> ConRecordsMap = new Map<String, Contact>();
        // System.debug('Hello Records' +getRecords.size());
        for(Contact conRec: getRecords){
            ConRecordsMap.put(conRec.Email,conRec); 
            System.debug('conrecords' + ConRecordsMap);
        }
         //Added by Harsha Tolani : 8/09/2022  
        Map <String, Account> accRecordsMap = new Map<String, Account>();
        Map <String, Contact> conRecMap = new Map<String, Contact>();
        for(Dealer_Cart__c dealerRecord : dealerRecords){
            if(ConRecordsMap.containsKey(dealerRecord.Email__c)){
                dealerRecord.contact__c = ConRecordsMap.get(dealerRecord.Email__c).Id;
                dealerRecord.Account__c = ConRecordsMap.get(dealerRecord.Email__c).AccountId;
                if(ConRecordsMap.get(dealerRecord.Email__c).AccountId == NULL){
                	String accountName = dealerRecord.First_Name__c + ' ' + dealerRecord.Last_Name__c; 
                    Account accRec = new Account();
                    accRec.Name = accountName;
                    accRecordsMap.put(dealerRecord.Email__c, accRec); 
                    conRecMap.put(dealerRecord.Email__c, ConRecordsMap.get(dealerRecord.Email__c));
                }
                
            }else{
                String accountName = dealerRecord.First_Name__c + ' ' + dealerRecord.Last_Name__c; 
                Account accRec = new Account();
                accRec.Name = accountName;
                accRecordsMap.put(dealerRecord.Email__c, accRec);
                Contact conRec = new Contact();
                conRec.FirstName = dealerRecord.First_Name__c;
                conRec.LastName = dealerRecord.Last_Name__c;
                conRec.Email = dealerRecord.Email__c;
                conRecMap.put(dealerRecord.Email__c, conRec);
            }
        }
        INSERT accRecordsMap.values();
           //Added by Harsha Tolani : 12/09/2022  
        for(Contact conRec: conRecMap.values()){
            if(accRecordsMap.containsKey(conRec.Email)){
                conRec.AccountId = accRecordsMap.get(conRec.Email).Id;
            }
        }
        system.debug(conRecMap);
        UPSERT conRecMap.values();
		 for(Dealer_Cart__c dealerRecord : dealerRecords){
            if(conRecMap.containsKey(dealerRecord.Email__c)){
                dealerRecord.contact__c = conRecMap.get(dealerRecord.Email__c).Id;
                dealerRecord.Account__c =  conRecMap.get(dealerRecord.Email__c).AccountId;
            }
         }
    }
    
}