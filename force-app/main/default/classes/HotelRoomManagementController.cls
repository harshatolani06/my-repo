/*
Name: HotelRoomManagementController
Author name: Harsha Tolani
Date:10/10/2022
Description :This is a controller for HotelRoomManagement Component.
*/

public class HotelRoomManagementController {
    Public Boolean color {get;set;}
    //Added by Harsha Tolani : 10-10-2022 This is method for getting the room details from PricebookEntry.
    @AuraEnabled(cacheable=true)
    Public static List <PriceBookEntryWrapper> getRoomDetails(){
         List<PricebookEntry> roomDetails = new List<PricebookEntry>();
         roomDetails = [SELECT Id, Name, ProductCode , UnitPrice, Product2Id, Product2.Number_Of_People__c , Product2.Description ,Product2.Rooms_Type__c, Product2.Status__c FROM PricebookEntry where Product2.Rooms_Type__c IN ('NonAC', 'AC') and Product2.Family = 'Hotel Rooms' and PriceBook2.IsStandard = true and Product2.isActive = true Order by ProductCode];
         List<PriceBookEntryWrapper> priceBookWrapRecords = new List<PriceBookEntryWrapper>();
         for(PricebookEntry roomRec: roomDetails){
              String url = '';
              url = 'https://ibirds-a1-dev-ed.lightning.force.com/lightning/r/Product2/' + roomRec.Product2.Id + '/view' ;
              String  bgColor = 'background-color: #64FF33'; 
              if(roomRec.Product2.Status__c == 'Booked'){
                bgColor = 'background-color: #FF3333';
              }
              priceBookWrapRecords.add(new PriceBookEntryWrapper(roomRec.Product2Id, roomRec.Name, roomRec.ProductCode, roomRec.UnitPrice, roomRec.Product2.Description, roomRec.Product2.Rooms_Type__c, roomRec.Product2.Status__c , bgColor , url, roomRec.Product2.Number_Of_People__c));
         }
         return  priceBookWrapRecords;
    }
    //Added by Harsha Tolani : 14-10-2022 This is method for getting the room images from files.
    @AuraEnabled
    public static List<String> getRoomAttachments(string productId){
        List<ContentDocumentLink> contentDocumentLinks = new List<ContentDocumentLink>();
        contentDocumentLinks = [SELECT Id, ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId =: productId];
        //contentDocumentLinks = [SELECT Id, ContentDocumentId FROM ContentDocumentLink WHERE LinkedEntityId = '01t5i000003t5D8AAI'];
        Set<Id> contentDocumentIds = new Set<Id>();
        for(ContentDocumentLink ctLinkRec : contentDocumentLinks){
            contentDocumentIds.add(ctLinkRec.ContentDocumentId);
        }

        List<ContentVersion> contentVersions = new List<ContentVersion>();
        contentVersions = [SELECT Id FROM ContentVersion WHERE ContentDocumentId IN : contentDocumentIds];
        List<String> attachmentURLs = new List<String>();
        for(ContentVersion ctVersionRec: contentVersions){
            string imgURL = 'https://ibirds-a1-dev-ed.file.force.com/sfc/servlet.shepherd/version/renditionDownload?rendition=ORIGINAL_Jpg&versionId=';
            imgURL += ctVersionRec.Id;
            attachmentURLs.add(imgURL);
        }
        system.debug(attachmentURLs);
        return attachmentURLs;
    }

    //Added by Harsha Tolani : 11-10-2022 This is a Wrapper Class 
    public class PriceBookEntryWrapper{
        @AuraEnabled
        Public String proId{get;set;}
        @AuraEnabled
        Public String roomName{get;set;}
        @AuraEnabled
        Public String roomNumber{get;set;}
        @AuraEnabled
        Public Decimal roomPrice{get;set;}
        @AuraEnabled
        Public String roomDescription{get;set;}
        @AuraEnabled
        Public String roomType{get;set;}
        @AuraEnabled
        Public String roomStatus{get;set;}
        @AuraEnabled
        Public String bgColor{get;set;}
         @AuraEnabled
        Public String url{get;set;}
         @AuraEnabled
        Public Decimal numberOfPeople{get;set;}
        
         
        public PriceBookEntryWrapper(String proId, String roomName, String roomNumber, Decimal roomPrice ,String roomDescription,String roomType,String roomStatus,String bgColor, String url, Decimal numberOfPeople){
            this.proId = proId;
            this.roomName = roomName;
            this.roomNumber = roomNumber;
            this.roomPrice  = roomPrice;
            this.roomDescription = roomDescription;
            this.roomType = roomType;
            this.roomStatus = roomStatus;
            this.bgColor = bgColor;
            this.url = url;
            this.numberOfPeople = numberOfPeople;
        }
     
      }
    

}