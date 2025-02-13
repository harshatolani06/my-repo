public class AccountBatch implements Database.Batchable<sObject>{
    
    public Database.QueryLocator start(Database.BatchableContext info){
        Id devRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Batch Records').getRecordTypeId();
       	String query='SELECT Id,email FROM Contact WHERE Account.RecordTypeId =: devRecordTypeId';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext info, List<Contact> conRecords){
        String my;
        String body='';
        List<Messaging.SingleEmailMessage> lstEmail = new List<Messaging.SingleEmailMessage>();
        
        for(Contact con : conRecords){
            Messaging.SingleEmailMessage mail1=new Messaging.SingleEmailMessage();
            String[] toadd=new String[]{con.Email};
            string b =  'Hello Harsha, Thankyou for Contact us.' ; 
            body += b ;
            mail1.setToAddresses(toadd);
            mail1.setSubject('Test mail');
            mail1.setPlainTextBody('this is a test mail');
            mail1.setHtmlBody(body);
            lstEmail.add(mail1);
        }
        Messaging.SendEmail(lstEmail);
         if(lstEmail.size() > 0){
            Messaging.SendEmailResult[] res = Messaging.sendEmail(lstEmail);
           if(res[0].success){
                System.debug('The mail was successfully send by batch apex job');
            }else{
                System.debug('The mail was a Failure');
            } 
        }
    }  
    Public void finish(Database.BatchableContext info){
        
    }
}