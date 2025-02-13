/*
Name: OpportunityTriggerPracticeHelper
Author name: Harsha Tolani
Date:``14/9/2022
Description :In this we make  OpportunityTriggerPracticeHelper for  OpportunityTrigger
*/
public class OpportunityTriggerPracticeHelper {
    //Added by Harsha Tolani : 15/9/2022 This is method for change stage= Closed won and Action = Closed won
    public static void closewonInActionAndStage(List<Opportunity> oppRecords){
        for(Opportunity oppRec : oppRecords){
            if(oppRec.StageName == 'Closed Won' || oppRec.Action__c == 'Closed Won'){
                 oppRec.Action__c  = 'Closed Won';
                 oppRec.StageName  = 'Closed Won';
                
            } 
        }
    }
    //Added by Harsha Tolani : 15/9/2022 This is method for Update the stage and action.
    public static void updateActionAndStage(List<Opportunity> oppRecords, Map<Id, Opportunity> oppOldMap){
        for(Opportunity oppRec : oppRecords){
            if(oppOldMap.get(oppRec.Id).StageName !=  oppRec.StageName && oppRec.StageName == 'Closed Won' || oppOldMap.get(oppRec.Id).Action__c != oppRec.Action__c && oppRec.Action__c == 'Closed Won'){
                oppRec.Action__c  = 'Closed Won';
                 oppRec.StageName  = 'Closed Won';
            }
            
        }
    }

}