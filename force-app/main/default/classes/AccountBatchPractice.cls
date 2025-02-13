/*
	Name: AccountBatchPractice 
	Author name: Harsha Tolani
	Date:31/8/2022
	Description :In this we make Batch for Sending mail to recordType
*/

public class AccountBatchPractice implements Database.Batchable<sObject>{
     //Added by Harsha Tolani :Date:31/8/2022 In this method we fetch data from record type
    Public Database.QueryLocator start(Database.BatchableContext info){
      Id devRecordTypeId = Schema.sObjectType.Account.getRecordTypeInfosByName().get('Batch Records').getRecordTypeId();
        return Database.getQueryLocator('SELECT Id,Email FROM Contact WHERE Account.RecordTypeId =: devRecordTypeId');
        
    }
    //Added by Harsha Tolani :Date:31/8/2022 In this method we for sending the mail of recordType contacts
    Public void execute(Database.BatchableContext info, List<Contact> conRec){
        System.debug(conRec);
        List<Messaging.SingleEmailMessage> em = new List<Messaging.SingleEmailMessage>();
     	//  Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        for(Contact con : conRec){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSubject('Thank you for reaching out.');
            mail.setHtmlBody('Hello,\n We appreciate your patience, and will be happy to solve this issue for you.\n Thank You');
       		mail.setTargetObjectId(con.Id); 
            em.add(mail);
            System.debug(mail);
        }
         Messaging.SendEmail(em);
        
    }
    Public void finish(Database.BatchableContext info){
        
    }
}