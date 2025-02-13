trigger ContactTrigger on Contact (before insert, after insert,  after update, before delete, after delete, after undelete) {
    // Added by Harsha Tolani : we are calling after insert handler method.
    if(trigger.isInsert && trigger.isAfter){
   // AccountUpdateContactHandler.afterInsert(trigger.new,trigger.newMap);
    }
    // Added by Harsha Tolani : we are calling after update handler method.
    if(trigger.isUpdate && trigger.isAfter){
    AccountUpdateContactHandler.afterUpdate(trigger.new);
    }
    // Added by Harsha Tolani : we are calling after delete handler method.
    if(trigger.isDelete && trigger.isAfter){
   //AccountUpdateContactHandler.afterDelete(trigger.new, trigger.oldMap);   
    }
    // Added by Harsha Tolani : we are calling after undelete handler method.
    if(trigger.isUndelete && trigger.isAfter){
    //AccountUpdateContactHandler.afterUndelete(trigger.new, trigger.newMap,trigger.oldMap);   
    }
    
}