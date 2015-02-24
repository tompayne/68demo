@isTest
private class TestContactOwnerChange {

    static testMethod void TestOwnerChange() {
        // create some test contacts
        List<Contact> newcontacts = initTestContacts('c', 5);
        
        user u = initTestUser ('myname', 'myname');
        
        System.runAs(u){
            
            insert newcontacts;
            
        }
        
        Test.StartTest();
        
        for (Contact ct: newcontacts){
            ct.OwnerId = UserInfo.getUserID();
            ct.Email ='someone@care.com';
        }

        update newcontacts;
        
        Test.StopTest();

        System.assertEquals(newcontacts.size(), ProgramFlowExperiment.EmailCounter);
        
    }
    
    public static List<Contact> initTestContacts (String prefix, Integer count) {
        
        List<Contact>results = new List<Contact>();
        for(Integer x=1; x<count; x++){
            results.add(new Contact (LastName = prefix + '_' + string.ValueOf(x),
                                    email = prefix + '_' + string.ValueOf(x) + '@apexMode.com' ));
                                    
        }
        return results;
    }
    
    public static User initTestUser(String username, String thealias) {
        
        User u = new User(Alias = thealias,
        Email = username + '@apexMode.com' ,
        FirstName = 'Joe', LastName = username,
        TimeZoneSidKey = 'America/Los_Angeles',
        UserName = username + '@apexMode.com',
        UserPermissionsMarketingUser = True,
        LocaleSidKey = 'en_US',
        EmailEncodingKey = 'UTF-8',
        LanguageLocaleKey = 'en_US');
        u.ProfileID = userinfo.getProfileID();
        return u;
    }
    
    
}//end