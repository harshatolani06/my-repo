/*
	Name: VfCustomContactForm
	Author name: Harsha Tolani
	Date: 3/8/2022
	Description :In this we make Custom Controller for contact page
*/


public class VfCustomContactForm
{	
    public Contact conRec {get;set;}
 	public List<Contact> contactRecords{get;set;}

	//Added by Harsha Tolani 03-aug-2022 this is constructor for custom controller
	public VfCustomContactForm(){
        conRec = new Contact();
        
        contactRecords = new List<Contact>();
        contactRecords = [SELECT FirstName, LastName, Email, Phone FROM Contact];

	}
	//Added by Harsha Tolani 03-aug-2022 this is method for controller
	public void CreateContacts(){
        List<Contact> conRecords = new List<Contact>();
        
        conRecords.add(conRec);
        if(conRecords.size() > 0){
    		INSERT conRecords;   
        }
	}
}