/*
	Author name: Harsha Tolani
	Date: 16/8/2022
	Description :In this we make Custom Controller for contact page
*/

//This is Class of this Controller
public class ContactdetailsonList {
	Public List<Contact> ConList {get;set;}
    public Integer rowIndex {get;set;}
    //public String rowNumber{get;set;}
    //Added by Harsha Tolani 16-aug-2022 this is constructor for custom controller
    public ContactdetailsonList(){
        ConList = new list<Contact>();
        ConList.add(new Contact());
    }
   
	//Added by Harsha Tolani 16-aug-2022 this is method for add rows     
    public void addRow(){
        ConList.add(new Contact());
        
    }
	//Added by Harsha Tolani 16-aug-2022 this is method for save contact     
    public pagereference saveContact(){
        Insert ConList;
        ConList = new list<Contact>();
        ConList.add(new Contact());
        return null;
    }
	//Added by Harsha Tolani 16-aug-2022 this is method for delete row     
    public PageReference deleteRow(){
        rowIndex = Integer.valueOf(ApexPages.currentPage().getParameters().get('rowIndex'));
        ConList.remove(rowIndex);
        return null;
    }
         /*public class ControllerWrapper{
        public Integer rowNumber{get;set;}
        public Contact rowIndex {get;set;}
        public ControllerWrapper(Integer rowNumber,Contact rowIndex){
            this.rowNumber = rowNumber;
            this.rowIndex = rowIndex;
        }
    }*/
}