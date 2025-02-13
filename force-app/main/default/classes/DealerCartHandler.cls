public class DealerCartHandler {
    public static void beforeInsert(List<Dealer_Cart__c> dealerRecords){
    // DealerCartTriggerHelper.DealerCardRecord(dealerRecords,NULL,NULL); 
    DealerCartTriggerPracticeHelper.DealerCart(dealerRecords,NULL,NULL);
    }
    public static void afterInsert(List<Dealer_Cart__c> dealerRecords, Map<Id, Dealer_Cart__c> dealerNewMap){
     //DealerCartTriggerHelper.DealerCardRecord(dealerRecords,dealerNewMap,NULL);    
    }
    public static void beforeUpdate(List<Dealer_Cart__c> dealerRecords, Map<Id, Dealer_Cart__c> dealerNewMap, Map<Id, Dealer_Cart__c> dealerOldMap){
     // DealerCartTriggerHelper.DealerCardRecord(dealerRecords,dealerNewMap,dealerOldMap);  
      DealerCartTriggerPracticeHelper.DealerCart(dealerRecords,dealerNewMap,dealerOldMap); 
    }
    public static void afterUpdate(List<Dealer_Cart__c> dealerRecords, Map<Id, Dealer_Cart__c> dealerNewMap, Map<Id, Dealer_Cart__c> dealerOldMap){
    // DealerCartTriggerHelper.DealerCardRecord(dealerRecords,dealerNewMap,dealerOldMap);    
    }

}