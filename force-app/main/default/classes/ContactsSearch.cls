/*
    Author: Harsha Tolani
    Date : 12-Sep-2022
    Description: In this controller we are creating contact records.
*/

public class ContactsSearch{
    public Contact conRec {get;set;}
    public List<Contact> conRecords {get;set;}
    public List<ContactsSearchWrapper> conSearchWrapper {get;set;}
    public string rowIndex {get;set;}
    public boolean isCheck {get;set;}
    
    // Constructor
    public ContactsSearch(){
        conRec = new Contact(); // Memory Allocation // Object Creation // Value
        conRecords = new List<Contact>();
        conSearchWrapper = new List<ContactsSearchWrapper>();
        isCheck = false;
        rowIndex  = '0';
        conSearchWrapper.add(new ContactsSearchWrapper(false, new Contact()));
        //conRecords.add(new Contact());
        
    }
    // Added by Harsha Tolani 12-Sep-2022 In this method we are inserting the contact records.
    public void createContacts(){
        for(ContactsSearchWrapper conWrap: conSearchWrapper){
            if(conWrap.isCheck){
                conRecords.add(conWrap.conRec);
            }    
        }
        if(conRecords.size() > 0){
            INSERT conRecords;
        }
    }
    
    public void addRow(){
        conSearchWrapper.add(new ContactsSearchWrapper(false, new Contact()));
    }
    
    public void removeRow(){
        conSearchWrapper.remove(integer.valueOf(rowIndex));
    }
    
    public class ContactsSearchWrapper{
        public boolean isCheck {get;set;}
        public Contact conRec {get;set;}
        
        public ContactsSearchWrapper(boolean isCheck, Contact conRec){
            this.isCheck = isCheck;
            this.conRec = conRec;
        }
    }

}