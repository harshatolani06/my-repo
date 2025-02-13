/**
* Name            : ConsumerEmailServices
* Author          : Harsha Tolani
* Date            : 21-March-2023
* Description     : 
* Tests Needed: 
**/
global class ConsumerEmailServices implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        System.debug('Case Id In Headers :'+Cases.getCaseIdFromEmailHeaders(email.headers));
        
        try{
            List<EmailMessage> emailMessages = new List<EmailMessage>();
            String verificationCode = '';
            if(email.plainTextBody != null && email.plainTextBody.contains('Confirmation code:')){
                verificationCode = email.plainTextBody.substringBetween('Confirmation code:','To allow').trim();                
                System.debug('verificationCode : '+verificationCode);
                System.debug('entered email service verification block');
            }
     	  /* Contact vCon = [SELECT Id, Name, Email FROM Contact WHERE Email = :email.fromAddress LIMIT 1];
           	Account accRec = new Account();
            accRec.Name = 'Harsha';
            accRec.Type = 'Prospect';
           	Insert accRec;*/
           
            Id recordId;
            if(email.inReplyTo != NULL){
           	EmailMessage emailmes = [SELECT Id, Name, ReplyToEmailMessageId, RelatedToId, MessageIdentifier FROM EmailMessage
                                     Where MessageIdentifier =: email.inReplyTo];
                
                if(emailmes != NULL && emailmes.RelatedToId != NULL){
                    recordId = emailmes.RelatedToId;
                    
                }
                
            }
            System.debug('recordId' +recordId);
          emailMessages.add(createEmailMessage(email,recordId));
            if(emailMessages.size() > 0){
                insert emailMessages;
                result.success = true;
                System.debug('emailMessages: '+emailMessages);
            }
        }
        catch(Exception e) {
            System.debug('Error: '+e);
            result.success = true;
            
        }
        return result;
    } 
    
    
    Public static EmailMessage createEmailMessage(Messaging.InboundEmail email, String recordId) {
        
        EmailMessage objEmailMessage = new EmailMessage();
        objEmailMessage.subject = email.subject;
         String htBody = email.htmlBody;
          htBody = htBody + '<p>Test</p>';
        System.debug('htBody' +htBody);
        objEmailMessage.HtmlBody = htBody;
        objEmailMessage.TextBody = email.plainTextBody;
        objEmailMessage.FromAddress = email.fromAddress != null ? email.fromAddress : '';
        objEmailMessage.ToAddress = email.toAddresses != null ? String.join(email.toAddresses,',') : '';
        objEmailMessage.CcAddress = email.ccAddresses != null ? String.join(email.ccAddresses,',') : '';
        objEmailMessage.FromName = email.fromName;
        objEmailMessage.RelatedToId = recordId;
        //objEmailMessage.ParentId = recordId;        
        objEmailMessage.status = '3'; 
        objEmailMessage.MessageDate = system.now();
        
        return objEmailMessage;
    }
}