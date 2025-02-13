/*
	Name: AccountBatchAssign2
	Author name: Harsha Tolani
	Date:1/9/2022
	Description :In this we make Batch for Sending mail to Contacts
*/
//Added by Harsha Tolani : 2/9/2022 In this we implement Batch which is connected by Database.Batchable & Database.Stateful
public class AccountBatchAssign2 implements Database.Batchable<sObject>, Database.Stateful {
    public List<Contact> conRecords {get;set;}
    Public List<String> contactMails {get;set;} 
    //Added by Harsha Tolani : 2/9/2022 this is constructor for batch class
    public AccountBatchAssign2(){
     contactMails = new List<String>();
     conRecords = new List<Contact>();
    }
   	//Added by Harsha Tolani : 2/9/2022 This is a Start method In this we fetch data according to alphabetmethod and filter that data 
    Public database.QueryLocator start(Database.BatchableContext info){
        return database.getQueryLocator('SELECT Id, Email, Name, Alphabet__c FROM Contact WHERE Email != NULL AND Account.RecordType.Name != NULL ORDER BY Name');
    }
    //Added by Harsha Tolani: 5/9/2022 This is a excute method in which we check the contact with alphabetically and if any alphabet is not present then it will be skip.
    Public void execute(Database.BatchableContext info , List<Contact> contactRecords){
        System.debug('conRecords ==> ' + contactRecords);
        AccountBatchHelper accBatchHelper = new AccountBatchHelper();
        String startAlphabet = 'A';
        
        for(Contact conRec : contactRecords){
            System.debug(conRec);
            //string alphabet = conRec.Alphabet__c != NULL ? conRec.Alphabet__c : 'A';
            if(conRec.Alphabet__c != NULL){
         	startAlphabet = conRec.Alphabet__c;
            }
          }
        string currentAlphabet = accBatchHelper.alphabetContains(contactRecords, startAlphabet);
        System.debug('currentAlphabet===>' + currentAlphabet);
        Map<String, String> nextAlphabetsMap = new Map<String, String>{'A' => 'B', 'B' => 'C', 'C' => 'D', 'D' => 'E','E' => 'F', 'F' => 'G', 'G' => 'H', 'H' => 'I','I' => 'J','J' => 'K','K' => 'L', 'L' => 'M', 'M' => 'N', 'N' => 'O','O' => 'P','P' => 'Q','Q' => 'R','R' => 'S', 'S' => 'T','T' => 'U', 'U' => 'V','V' => 'W','W' => 'X','X' => 'Y','Y' => 'Z','Z' => 'A'};
            if(currentAlphabet != NULL && currentAlphabet != ''){
                for(Contact conRec: contactRecords){
                    string nextAlphabet = nextAlphabetsMap.get(currentAlphabet.toUpperCase());
                    if(conRec.Name.toLowerCase().startsWith(currentAlphabet.toLowerCase())){
                        conRec.Alphabet__c = nextAlphabet;
                        contactMails.add(conRec.Email);
                    }else{
                        conRec.Alphabet__c ='';
                    }
                    conRecords.add(conRec);
                }
           }
  }
   // Added by Harsha Tolani : 4/9/2022 this is finish method in this we update the value and send email accordingly and at a time only one alphabet names will be take and send email 
    Public void finish(Database.BatchableContext info){
        	if(contactMails.size() > 0){
                system.debug(contactMails);
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.toAddresses = contactMails;
                message.optOutPolicy = 'FILTER';
                message.subject = 'Thank you for reaching out';
                message.plainTextBody = 'Hello,\nWe appreciate your patience, and will be happy to solve this issue for you.\nThank You';
                Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
             	/*if(conRecords.size() > 0){
                       UPDATE conRecords;
                    }*/
               Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
                if (results[0].success) {
                        System.debug('The email was sent successfully.');
                    if(conRecords .size() > 0){
                            UPDATE conRecords;
                    }
                }
                else {
                        System.debug('The email failed to send: '+ results[0].errors[0].message);
                }
          }
    }
}