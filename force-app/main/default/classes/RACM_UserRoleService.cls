public with sharing class RACM_UserRoleService {

    // List of RACM User Roles. (Should match with assigned PermSet and CustomPerm)
    public static final Set<String> RACM_ROLES = new Set<String> {'RACM_1st_line_Supervisor',
                                                         'RACM_2nd_line_Supervisor',
                                                         'RACM_Field_Office_Coordinator',
                                                         'RACM_General_User',
                                                         'RACM_Operations',
                                                         'RACM_RA_System_Admin',
                                                         'RACM_Timekeeper',
                                                         'RACM_Guest'};


    @AuraEnabled
    public static Boolean userHasPermission(List<String> permissionSetNames){
        try {
            for(PermissionSetAssignment psa : [SELECT PermissionSet.Name
            FROM PermissionSetAssignment WHERE AssigneeId =: UserInfo.getUserId()]){
                if(permissionSetNames.contains(psa.PermissionSet.Name)){
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static String[] getCurrentUserPermissionSets(){
        try {
            String[] permissionNames = new List<String>();
            for(PermissionSetAssignment psa : [SELECT PermissionSet.Name
            FROM PermissionSetAssignment WHERE AssigneeId =: UserInfo.getUserId()]){
                permissionNames.add(psa.PermissionSet.Name);
            }
            return permissionNames;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static String getCurrentUserRACMRole(){
        for(String permSetName : getCurrentUserPermissionSets()){
            system.debug('permSetName'+permSetName);
            if(RACM_ROLES.contains(permSetName)){
                return permSetName;
            }
        }
        return null;
    }

    @AuraEnabled
    public static List<UserRecordAccess> getUserRecordAccess(Id recordId){
        try {
            return [SELECT HasEditAccess, RecordId
                            FROM UserRecordAccess 
                            WHERE RecordId = :recordId AND UserId = :UserInfo.getUserId()];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
    @AuraEnabled
    public static DateTime getCurrentDateAndTime(){
        return system.now();
    }

}