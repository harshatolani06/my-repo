trigger AccountAddressTrigger on Account (before insert,before update) {
    if(trigger.isInsert && trigger.isBefore){
     AccountHandler.beforeInsert(trigger.new);   
    }
    if(trigger.isUpdate && trigger.isBefore){
      AccountHandler.beforeUpdate(trigger.new,trigger.oldMap, trigger.newMap);   
    }

}