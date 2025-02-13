public class ContactTableRecords {
    public Contact conRec{get;set;}
    public List<Contact> conRecords{get;set;}
    public string searchKey{get;set;}
    public string selectedType{get;set;}
    public List<ContactWrapper> contactWrap{get;set;}
    public ContactTableRecords(){
        conRec = new Contact();
       	searchKey = '';
       
		conRecords = new List<Contact>(); 
        conRecords = [SELECT Id , FirstName, LastName, Phone,Type__c, Email FROM Contact Limit:10];
        conRec = new Contact();
        fillContactWrap();
        
    }
   
    public void search(){
        string searchRecord= '%'+ searchKey +'%';
        conRecords = [SELECT Id , FirstName,LastName, Email,Phone,Type__c FROM Contact Where Name LIKE: searchRecord]; 
        System.debug('Search Ky:==>'+searchRecord);
         System.debug('records:==>'+conRecords);
        fillContactWrap();
       }
    public void ModifiedRecords(){
        List<Contact> modifiyContact = new List<Contact>();
        for(ContactWrapper conWrap : contactWrap){
            if(conWrap.isCheck && selectedType != 'None'){
               conWrap.conRec.Type__c = selectedType;
               modifiyContact.add(conWrap.conRec); 
            }
        }
        if( modifiyContact.size()>0)
        {
            UPDATE modifiyContact; 
        }
    }
    
    
    public void fillContactWrap(){
         contactWrap = new List<ContactWrapper>();
        for(Contact conRec: conRecords){
         contactWrap.add(new ContactWrapper(false,conRec));   
        }
    }
    Public class ContactWrapper{
        public Boolean isCheck{get;set;}
        public Contact conRec{get;set;}
        public ContactWrapper(Boolean isCheck, Contact conRec){
            this.isCheck = isCheck;
            this.conRec = conRec;
            
        }
    }
    
}