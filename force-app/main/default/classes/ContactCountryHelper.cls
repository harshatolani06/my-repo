/*
	Name: ContactCountryHelper
	Author name: Harsha Tolani
	Date: 25/8/2022
	Description :In this we make Custom Controller for contact trigger
*/

public class ContactCountryHelper {
   Public static void CityRecords(List<Contact> contactRecords,Map<Id, Contact> conNewMap,Map<Id, Contact> conoldMap){
    Set<Id> ConId = new Set<Id>(); 
    Set<String> CityName= new Set<String>();
    Set<String> StateName = new Set<String>();
       for(Contact conRec: contactRecords){
           if((conRec.MailingState != NULL && conRec.MailingState != conoldMap.get(conRec.Id).MailingState)||
              (conRec.MailingCity != NULL &&  conRec.MailingCity != conOldMap.get(conRec.Id).MailingCity)||
              (conRec.MailingCountry != NULL && conRec.MailingCountry != conOldMap.get(conRec.Id).MailingCountry)){
              ConId.add(conRec.Id);
              CityName.add(conRec.MailingCity);
              StateName.add(conRec.MailingState);
           }
      }
       Map<Id,Country__c> countryRecordsMap = new Map<Id,Country__c>([SELECT Id, Name, City__c, State__c, Contact__c, Contact__r.Name FROM Country__c WHERE City__c IN : CityName AND State__c IN : StateName AND Contact__c IN :  ConId]);
       Map<String, List<Country__c>> contactCountriesMap = new Map<String, List<Country__c>>();
       for(Country__c countryRec: countryRecordsMap.values()){
           List<Country__c> contriesRecord = contactCountriesMap.get(countryRec.Contact__c);
           if(contriesRecord == NULL){
               contriesRecord = new List<Country__C>();
           }
           contriesRecord.add(countryRec);
           contactCountriesMap.put(countryRec.Contact__r.Name ,contriesRecord );
       }	
       System.debug(contactCountriesMap);
       
       // Map<Id,Contact> conRecordMap = new Map<Id,Contact>([SELECT Id, MailingCountry, MailingCity, MailingState (SELECT Id, Name, City__c, State__c FROM Country__c WHERE City__c =:CityName AND State__c =:StateName) FROM Contact]); 
      	     
   }

}