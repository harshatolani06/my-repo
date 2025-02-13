/*
Name: DealerCartTriggerHelper
Author name: Harsha Tolani
Date:14/9/2022
Description :In this we make DealerCartTriggerHelper for DealerCartTrigger
*/

public class DealerCartTriggerPracticeHelper{
    public static void DealerCart(List<Dealer_Cart__c> dealerRecords, Map<Id,Dealer_Cart__c> dealerNewMap, Map<Id,Dealer_Cart__c> dealerOldMap){
        Map<String, Dealer_Cart__c> dealerRecordMap = new Map<String, Dealer_Cart__c>();
        for(Dealer_Cart__c dealerRec : dealerRecords) {
            dealerRecordMap.put(dealerRec.Email__c, dealerRec);   
        }
        List<Contact> getconRecords = new List<Contact>([SELECT Name,Email,AccountId FROM Contact WHERE Email != NULL AND Email IN :  dealerRecordMap.keySet()]);
        Map<String,Contact> conRecordMap = new Map<String,Contact>();
        for(Contact conRec : getconRecords){
            conRecordMap.put(conRec.Email, conRec);   
        }
        Map<String, Account> accRecordMap = new Map<String, Account>();
        Map<String, Contact> conRecMap = new Map<String,Contact>();
        for(Dealer_Cart__c dealerRec : dealerRecords) {
            if(conRecordMap.containsKey(dealerRec.Email__c))
            {
                dealerRec.Contact__c = conRecordMap.get(dealerRec.Email__c).Id;
                dealerRec.Account__c = conRecordMap.get(dealerRec.Email__c).AccountId; 
                if(conRecordMap.get(dealerRec.Email__c).AccountId == NULL){
                    String accountName = dealerRec.First_Name__c + ' ' + dealerRec.Last_Name__c;
                    Account acc = new Account();
                    acc.Name =accountName; 
                    accRecordMap.put(dealerRec.Email__c, acc);
                    conRecordMap.put(dealerRec.Email__c, conRecordMap.get(dealerRec.Email__c));
                }
                else{
                       dealerRec.Account__c = conRecordMap.get( dealerRec.Email__c).AccountId; 
                }
            }
              else{
                    String accountName = dealerRec.First_Name__c + ' ' + dealerRec.Last_Name__c;
                    Account acc = new Account();
                    acc.Name =accountName; 
                    accRecordMap.put(dealerRec.Email__c, acc);
                 	Contact con = new Contact();
                    con.FirstName = dealerRec.First_Name__c;
                    con.LastName = dealerRec.Last_Name__c;
                    con.Email = dealerRec.Email__c;
                    conRecMap.put(dealerRec.Email__c, con);
                    System.debug('Hello' +conRecMap);
                    }
           }
        if(accRecordMap != NULL && accRecordMap.size()>0){
            INSERT accRecordMap.values();
        }
            for(Contact conRec:  conRecMap.values()){
                if(accRecordMap.containsKey(conRec.Email)){
                 conRec.AccountId = accRecordMap.get(conRec.Email).Id;   
                    
                }
            }
        if(conRecMap != NULL &&  conRecMap.size()>0){
            UPSERT conRecMap.values();
        }
        if( conRecMap != NULL &&  conRecMap.size()>0){
            for(Dealer_Cart__c dealRec : dealerRecords){
                if(conRecMap.containsKey(dealRec.Email__c))
           		 {
                dealRec.Contact__c = conRecMap.get(dealRec.Email__c).Id;
                dealRec.Account__c = conRecMap.get(dealRec.Email__c).AccountId; 
                 }
            }
        }
            
        }
        
        
    }