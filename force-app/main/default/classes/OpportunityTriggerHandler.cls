public class OpportunityTriggerHandler {
    // Added by Harsha Tolani 19-Aug-2022 : this method calling for before insert helper methods.
    public static void beforeInsert(List<Opportunity> oppRecords) {
        // OpportunityTriggerHelper.insertActionStageValue(oppRecords);
         OpportunityTriggerPracticeHelper.closewonInActionAndStage(oppRecords);
    }
     // Added by Harsha Tolani 19-Aug-2022 : this method calling for before update helper methods.
    public static void beforeUpdate(List<Opportunity> oppRecords, Map<Id, Opportunity> oppOldMap){
          // OpportunityTriggerHelper.updateAction(oppRecords , oppOldMap);
           OpportunityTriggerPracticeHelper.updateActionAndStage(oppRecords,oppOldMap);
    }
     public static void afterUpdate(List<Opportunity> oppRecords, Map<Id, Opportunity> oppNewMap, Map<Id, Opportunity> oppOldMap){
      OpportunityTriggerHelper.oppCount(oppRecords,oppNewMap,oppOldMap);
    }
      public static void afterInsert(List<Opportunity> oppRecords, Map<Id, Opportunity> oppNewMap){
       OpportunityTriggerHelper.oppCount(oppRecords,oppNewMap,NULL);
	 	
    }
}