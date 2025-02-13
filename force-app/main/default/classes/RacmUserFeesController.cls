public class RacmUserFeesController {
    @AuraEnabled
    public static List<RACM_User_Fees__c> fetchData(String recordId){
        return [SELECT Id, RACM_User_Fee_Type__c, RACM_Remittance_Amount__c, RACM_Other_Method__c, RACM_Remittance_Method__c,RACM_Related_Case__c , RACM_Audit_Period_Start_Date__c, RACM_Audit_Period_End_Date__c, Name FROM RACM_User_Fees__c WHERE RACM_Related_Case__c  =: recordId];
    }
    
    @AuraEnabled
    public static void deleteRecord(Id selectedRecordId){
        RACM_User_Fees__c racmUserFeesRecord = [SELECT Id  FROM RACM_User_Fees__c WHERE Id =: selectedRecordId];
        DELETE racmUserFeesRecord;
    }
}