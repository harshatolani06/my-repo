public class priceBookRecords{
@AuraEnabled(cacheable=true)
    public static List<PricebookEntry> getPriceBookEntries(){
       return [SELECT Id, Name, Pricebook2Id, Product2Id, UnitPrice, IsActive, ProductCode FROM PricebookEntry];
    }
 }