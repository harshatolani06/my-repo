/*
	Name: contactList
	Author name: Harsha Tolani
	Date: 9/8/2022
	Description :In this we make Custom Controller for Fetch the data from Contact
*/

public class contactList {
    public Map<String, Contact> conRecordsMap{get;set;}
    //Added by Harsha Tolani on 9-08-2022 this is constructor which is used for fetch the data from record.
	public contactList(){
		conRecordsMap = new Map<String, Contact>();
        List<Contact> conRecords = new List<Contact>();
		conRecords = [SELECT Id, Name, Email, Phone FROM Contact LIMIT 15];
		for(Contact conRec : conRecords){
   		 conRecordsMap.put(conRec.Name, conRec);
		}
	}
}