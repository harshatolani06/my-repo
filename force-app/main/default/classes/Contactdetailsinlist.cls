/* Name : Harsha Tolani
   Date : 13-09-2022
   Description : This is controller for contact details in list. */
   
public class Contactdetailsinlist{
    Public List<Contact> conRecords {get;set;}
   // public Contact conRec{get;set;}
       public string rowIndex{get;set;}
   
    
    public Contactdetailsinlist(){
       
        conRecords = new List<Contact>();
        //conRec = new Contact();  
        conRecords.add(new Contact());
       // conRecords.add(new Contact());
       rowIndex = '0';
       
   }
   Public void addRow(){
   conRecords.add(new Contact());
   
   }
   
    Public void saveRecords(){
    conRecords.add(new Contact());
         if(conRecords.size()>0){
             INSERT conRecords;
        }
    }
    public void removeRow(){
        conRecords.remove(integer.valueOf(rowIndex));
    }
}