global class ProcessLeadApplicantEmail implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        Lead led = new Lead();
        led.FirstName = email.fromName.substring(0,email.fromName.indexOf(' '));
        led.LastName = email.fromName.substring(email.fromName.indexOf(' '));
        led.Company = led.FirstName + ' ' + led.LastName;
        led.Email = envelope.fromAddress;
        insert led;
        
        if(email.binaryAttachments != NULL && email.binaryAttachments.size() > 0){
            Attachment attachment = new Attachment();
            for(integer i = 0 ; i<email.binaryAttachments.size() ; i++){

                attachment.ParentId = led.Id;
                attachment.Name = email.binaryAttachments[i].filename;
                attachment.Body = email.binaryAttachments[i].body;
            }
            insert attachment;
        }
        return result;
    }

}