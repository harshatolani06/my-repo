/*
	Name:AccountTrigger
	Author name: Harsha Tolani
	Date: 14/9/2022
	Description :This is a account Trigger
*/

trigger AccountTrigger on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    //Added by Harsha Tolani : 14/10/2022 : We are Calling Before Insert Method
    if(trigger.isInsert && trigger.isBefore){
   
    AccountTriggerHandler.beforeInsert(trigger.new);  
        System.debug('Testing');
    }
    if(trigger.isInsert && trigger.isAfter){
    // AccountTriggerHandler.afterInsert(trigger.new,trigger.newMap);   
    }
    if(trigger.isUpdate && trigger.isBefore){
    //AccountTriggerHandler.beforeUpdate(trigger.new, trigger.newMap,trigger.oldMap);   
    }
    if(trigger.isUpdate && trigger.isAfter){
    //Account.triggerHandler.afterUpdate(trigger.new, trigger.newMap, trigger.oldMap);   
    }
}