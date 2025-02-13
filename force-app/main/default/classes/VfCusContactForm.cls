/*
	Name: vfCusContactForm
	Author name: Harsha Tolani
	Date: 3/8/2022
	Description :In this we make Custom Controller for contact page
*/

public class VfCusContactForm {
    
    public Contact conRec{get;set;}
    private List<Contact> conRecords{get;set;}
    public List<Contact> contactRecords {get;set;}
    private List<Contact> modifiedContacts {get;set;}
    public string myInputQueryString{get;set;}
    private String query {get;set;}
    Public string selectedType {get; set;}
    public List<Contact> selectedRec {get; set;}
    public String removeRec {get; set;}
     public List<ControllerWrapper> contactWrap {get;set;}
    //Variable to hold all accounts added/edited
    public List<Contact> allContactList = new List<Contact>();
    
    //Variable to hold add contacts to be deleted
	public List<Contact> deleteContactList = new List<Contact>();
  
   //Added by Harsha Tolani 04-aug-2022 this is constructor for custom controller	    
    public vfCusContactForm(){
        conRecords = new List<Contact>();
        conRec = new Contact();
        contactWrap = new List<ControllerWrapper>();
      
        contactRecords = new List<Contact>();
       // query = 'SELECT Name, Email, Phone FROM Contact';
        contactRecords = [SELECT FirstName,LastName, Name, Email, Type__c, Phone FROM Contact];
        conRec = new Contact();
        fillControllerWrapper();
        
      }
    
    //Added by Harsha Tolani 04-aug-2022 this is method for insert record.
    public void createContacts(){
       contactRecords = new List<Contact>();
               contactRecords.add(conRec);
        if( contactRecords.size()>0){
            INSERT  contactRecords;
            conRec.clear();
            contactRecords = [SELECT FirstName, LastName, Name, Email, Type__c, Phone FROM Contact];
        }
    }
    //Added by Harsha Tolani 04-aug-2022 this is method for search through input field
    Public void myInputQuery(){
        String searchKeyword = '%'+myInputQueryString +'%';
     /* if(myInputQueryString != NULL){
            contactRecords = [SELECT Name, Email, Phone From Contact WHERE Name =: myInputQueryString];
           
        }*/
        contactWrap = new List<ControllerWrapper>();
        contactRecords = [SELECT  FirstName, LastName, Name, Email,Type__c, Phone FROM Contact WHERE Name Like :searchKeyword LIMIT 20];
        
        system.debug('Hello' +contactRecords);
        for(Contact conRec: contactRecords){
          contactWrap.add(new ControllerWrapper(false, conRec));
        }
        contactRecords.clear();
        
       }
    
     public void fillControllerWrapper(){
        for(Contact conRec: contactRecords){
          contactWrap.add(new ControllerWrapper(false, conRec));
        }
    }
     // Added by Harsha Tolani 08-Aug-2022 Getting contact types
    public List<SelectOption> getContactTypes(){
        List<SelectOption> pickListValues = new List<SelectOption>();
        Schema.DescribeFieldResult fieldResult = Contact.Type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        pickListValues.add(new SelectOption('--None--','--None--'));
        for( Schema.PicklistEntry pickListVal : ple){
            pickListValues.add(new SelectOption(pickListVal.getLabel(),pickListVal.getValue()));
        }     
        return pickListValues;
    }
    
    //Added by Harsha Tolani 09-Aug-2022 this is method for modify record 
    public void modifiedContactRecords(){
        List<Contact> modifiedContacts = new List<Contact>();
        for(ControllerWrapper wrapRec: contactWrap){
            if(wrapRec.isCheck && selectedType != '--None--'){
                wrapRec.conRec.Type__c = selectedType;
                modifiedContacts.add(wrapRec.conRec);
            }
        }
        if(modifiedContacts.size() > 0){
            UPDATE modifiedContacts;
        }
    }
     //Added by Harsha Tolani 09-Aug-2022 this is method for delete record
    public void deleteRecords(){
        delete modifiedContacts;
    }
    //Added by Harsha Tolani 09-Aug-2022 this is method for remove record from user side
    public void Remove(){
    	modifiedContacts = new List<Contact>();
    	Integer indexVal = Integer.valueof(system.currentpagereference().getparameters().get('index'));
    	ControllerWrapper delRec = contactWrap.remove(indexVal-1);
    	modifiedContacts.add(delRec.conRec); 
    }
    
    //Added by Harsha Tolani 08-Aug-2022 Wrapper controller
      public class ControllerWrapper{
        public boolean isCheck  {get;set;}
        public Contact conRec {get;set;}
        public ControllerWrapper(boolean isCheck, Contact conRec){
            this.isCheck = isCheck;
            this.conRec = conRec;
        }
    }
    
}