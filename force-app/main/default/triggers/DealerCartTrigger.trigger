/*
	Name: DealerCartTrigger
	Author name: Harsha Tolani
	Date: 6/9/2022
	Description :This is a  DealerCartTrigger on Dealer_Cart__c object.
*/

trigger DealerCartTrigger on Dealer_Cart__c (before insert, after insert, before Update, after Update) {
    if(trigger.isInsert && trigger.isBefore){
    //DealerCartHandler.beforeInsert(trigger.new);
    DealerCartHandler.beforeInsert(trigger.new);   
    }
    if(trigger.isInsert && trigger.isAfter){
	//DealerCartHandler.afterInsert(trigger.new, trigger.newMap);  
	 DealerCartHandler.afterInsert(trigger.new,trigger.newMap);     
    }
    if(trigger.isUpdate && trigger.isBefore){
    //DealerCartHandler.beforeUpdate(trigger.new,trigger.newMap, trigger.oldMap);
     DealerCartHandler.beforeUpdate(trigger.new,trigger.newMap, trigger.oldMap);
    }
    if(trigger.isUpdate && trigger.isAfter){
  // DealerCartHandler.afterUpdate(trigger.new,trigger.newMap, trigger.oldMap);
  	DealerCartHandler.afterUpdate(trigger.new,trigger.newMap, trigger.oldMap);    
        
    }
    
    

}