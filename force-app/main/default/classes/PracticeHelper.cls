public class PracticeHelper {
    Public static void CityStateRecords(List<Contact> contactRecords, Map<Id, Contact> conNewMap, Map<Id, Contact> conOldMap){
        Set<Id> ConIds = new Set<Id>();
        Set<String> CityName = new Set<String>();
        Set<String> StateName = new Set<String>();
        	for(Contact conRec : contactRecords)
            {
                if((conRec.MailingCountry != NULL && conRec.MailingCountry != conOldMap.get(conRec.Id).MailingCountry) ||
                   (conRec.MailingState != NULL && conRec.MailingState != conOldMap.get(conRec.Id).MailingState) ||
                   (conRec.MailingCity != NULL && conRec.MailingCity != conOldMap.get(conRec.Id).MailingCity)){
                      ConIds.add(conRec.Id);
                      CityName.add(conRec.MailingCity);
                      StateName.add(conRec.MailingState);
                   }
            }
       
        
    }

}