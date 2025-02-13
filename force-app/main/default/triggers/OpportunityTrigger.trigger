trigger OpportunityTrigger on Opportunity (before insert, before update, after update, after insert) {
    // Added by Harsha Tolani 19-Aug-22: we are calling before insert handler method.
    if(trigger.isInsert && trigger.isBefore){
     OpportunityTriggerHandler.beforeInsert(trigger.new);
    }
    if(trigger.isInsert && trigger.isAfter){
     OpportunityTriggerHandler.afterInsert(trigger.new,trigger.newMap);
    }
    
    // Added by Harsha Tolani 19-Aug-22 : we are calling before update handler method.
    if(trigger.isUpdate && trigger.isBefore){
      OpportunityTriggerHandler.beforeUpdate(trigger.new, trigger.oldMap);
    }
   if(trigger.isUpdate && trigger.isAfter){
    OpportunityTriggerHandler.afterUpdate(trigger.new,trigger.newMap,trigger.oldMap);
    }
     

}