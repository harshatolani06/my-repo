public class TestController {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunityList(){
        return [Select Id, Name From Opportunity LIMIT 1];
    }
   
   
}