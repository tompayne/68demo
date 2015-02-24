@isTest
private class TestMyController1 {

    static testMethod void testSave() {
        MyController1 myc = new MyController1();
       
        pageReference pageRef = myc.save();
        
        System.assertNotEquals(null,pageRef);
        System.assertEquals('/apex/TestMyController', pageRef.getUrl());
        
        Map<String, String> pageParameters = pageRef.getParameters();
        System.assertEquals(1,pageParameters.values().size());
        System.assertEquals('recordID', pageParameters.get('id'));
    }
}