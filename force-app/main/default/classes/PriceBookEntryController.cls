public with sharing class PriceBookEntryController {
    @AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getPriceBookEntryList() {
        return [SELECT Name,Product2.Id,Pricebook2.Id, ProductCode , UnitPrice,  Product2.Description , Product2.Family FROM PricebookEntry WHERE PriceBook2.IsStandard = true];
    }
}