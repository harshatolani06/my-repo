public with sharing class UserController {
    @AuraEnabled(cacheable=true)
    public static List<User> getUserRecords(){
        return [SELECT Name, Username, Title,CompanyName,ProfileId, Phone, SmallBannerPhotoUrl, Email FROM User];

    }
}