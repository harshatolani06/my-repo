/*
	Author name: Harsha Tolani
	Date: 22-12-2022
	Description :In this we send email to contact email address
	class Name : EmailBatchTesting
*/
public class EmailBatchTesting implements Database.Batchable<sObject>{

   public Database.QueryLocator start(Database.BatchableContext BC){
      return Database.getQueryLocator([Select id, Assigned_to__c from case]);
   }

   public void execute(Database.BatchableContext BC, List<sObject> scope){
   }

   public void finish(Database.BatchableContext BC){
   }
}