/*
	Name: VfEmailTemplate
	Author name: Harsha Tolani
	Date: 26/7/2022
	Description : fetch data for close won
*/

//
public class VfEmailTemplate {
    
    public static string accountName{get;set;}
    public static List<Opportunity> getOppRecords(){
        List<Opportunity> OppRecord = [SELECT Id, Name, StageName, CloseDate FROM Opportunity WHERE StageName = 'Closed Won' AND Account.Name = :accountName];
        return OppRecord;
    }

}