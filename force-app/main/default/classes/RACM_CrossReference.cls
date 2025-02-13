public class RACM_CrossReference {
    @AuraEnabled
    public static List<RACM_Cross_Reference__c> fetchData(String recordId){
       List<RACM_Cross_Reference__c> racmRecords = new List<RACM_Cross_Reference__c>();
       racmRecords = [SELECT Id, Name, RACM_Cross_References__c,RACM_Parent_Case__c,RACM_Related_Case__c, RACM_Parent_Case__r.Name__c,
        createdBy.Name, CreatedDate from RACM_Cross_Reference__c Where RACM_Related_Case__c =: recordId OR RACM_Related_Case__c =: recordId];
       return racmRecords;
    }

}