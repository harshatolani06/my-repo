public with sharing class ContactManagementCpntroller {
    @AuraEnabled
    public static Task saveTask(string subject, string conId){
    Task t = new Task();
    t.Subject = subject;
    t.ActivityDate = Date.today() + 2;
    t.WhoId = conId;
    insert t;
    return t;
  }
   
    @AuraEnabled(cacheable=true)
    Public static List<ContactWrapper> getRecords(){
        List<Contact> conRecords = new List<Contact>();
        conRecords = [SELECT Id, Name, Email, (SELECT Id FROM Attachments) , (SELECT Id, WhoId, Subject, ActivityDate, Status FROM Tasks) FROM Contact];
        List<ContactWrapper> contactWrapRecords = new List<ContactWrapper>();
        
        for(Contact conRec :   conRecords){
            
            //system.debug('completdTaskPercent ==> ' + completdTaskPercent);
            if(conRec.Tasks.size() > 0){
                integer completedTasksCount = 0;
                for(Task tskRec: conRec.Tasks){
                    if(tskRec.Status == 'Completed'){
                        completedTasksCount++;
                    }
                }
                decimal completdTaskPercent = 0;
                completdTaskPercent =  (completedTasksCount * 100) / conRec.Tasks.size();
                String url = '';
                if(conRec.Attachments.size()  > 0){
                    url = 'https://ibirds-a1-dev-ed.file.force.com/servlet/servlet.FileDownload?file=';
                    url +=   conRec.Attachments[0].Id;
                }else{
                    url = 'https://www.lightningdesignsystem.com/assets/images/avatar1.jpg';
                }
                contactWrapRecords.add(new ContactWrapper(conRec.Id, conRec.Name, conRec.Email,url, conRec.Tasks.size(), conRec.Tasks, completdTaskPercent));
            }
            
            
        }
        return contactWrapRecords;
    }
    public class ContactWrapper{
        @AuraEnabled
        Public String id{get;set;}
        @AuraEnabled
        Public String name{get;set;}
        @AuraEnabled
        Public String email{get;set;}
        @AuraEnabled
        Public String url {get;set;}
        @AuraEnabled
        Public Integer taskCount {get;set;}
        @AuraEnabled
        Public List<Task> taskRecords {get;set;}
        @AuraEnabled
        Public Decimal completdTaskPercent {get;set;}

        public ContactWrapper(string id, String name, String email, String url, Integer taskCount , List<Task> taskRecords, Decimal completdTaskPercent){
            this.id = id;
            this.name = name;
            this.email = email;
            this.url = url;
            this.taskCount = taskCount;
            this.taskRecords = taskRecords;
            this.completdTaskPercent = completdTaskPercent;
        }
     
      }
    
}