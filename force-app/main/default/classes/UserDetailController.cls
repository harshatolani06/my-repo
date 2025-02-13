public with sharing class UserDetailController {
    @AuraEnabled(cacheable = true)   
    public static List<User> getUserData() {
        return [SELECT Id,Name,UserName,Email,Title,Phone,Address,MediumPhotoUrl FROM User ];
    }
}