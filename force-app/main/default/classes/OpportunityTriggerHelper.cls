public class OpportunityTriggerHelper {
   //Added by Harsha Tolani 19-Aug-2022 :This method is used for insert record. 
    public static void insertActionStageValue(List<Opportunity> oppRecords){
       for(Opportunity oppRec : OppRecords){
          if(oppRec.StageName == 'Closed Won' || oppRec.Action__c == 'Closed Won'){
               	 	oppRec.Action__c = 'Closed Won';
                	oppRec.StageName = 'Closed Won';
           }
       }
    }
    //Added by Harsha Tolani 19-Aug-22: This is method for update stagename and action if stage is closed won then action is also
   // close won and after that there is no changes happen.
    public static void updateAction(List<Opportunity> oppRecords,Map<Id, Opportunity> oppOldMap){
       for(Opportunity oppRec : OppRecords){
          if((oppOldMap.get(oppRec.Id).StageName != oppRec.StageName && oppRec.StageName == 'Closed Won') || (oppOldMap.get(oppRec.Id).Action__c != oppRec.Action__c && oppRec.Action__c == 'Closed Won')){
               	 	oppRec.Action__c = 'Closed Won';
                	oppRec.StageName = 'Closed Won';
           }
       }
    }
    
    
    
    public static void oppCount(List<Opportunity> oppRecords, Map<Id, Opportunity> oppNewMap,Map<Id, Opportunity> oppOldMap){
        List<Account> acctToUpdate = new List<Account>();
        Map<Id,List<Opportunity>> accountToOppMap = new   Map<Id,List<Opportunity>>(); 
        for(Opportunity opp: oppRecords){
            if(opp.StageName == 'Closed Won' && opp.AccountId != NULL){
                if(accountToOppMap.containsKey(opp.AccountId)){
                    accountToOppMap.get(opp.AccountId).add(opp);
                }
                accountToOppMap.put(opp.AccountId,new List<Opportunity>{opp});
                
            }
        } 
        
        for(Account acc: [SELECT Id,closed_Opportunity_Count__c, (Select Id,StageName From Opportunities Where StageName = 'Closed Won' )FROM Account WHERE Id IN : accountToOppMap.keyset()]){
            acctToUpdate.add(new Account(Id = acc.Id, closed_Opportunity_Count__c = acc.Opportunities.size()));  
            
        } 
        if(acctToUpdate.size()>0){
            UPDATE acctToUpdate;
        }
    }
}