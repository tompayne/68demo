@isTest

public class testFindDups {
  static testMethod void testDupes(){
    Contact dupContact = new Contact();
    dupContact.FirstName = 'John';
    dupContact.LastName = 'Smith';
    dupContact.Email = 'john@john.com';
    insert dupContact;

    Lead dupLead = new Lead();
    dupLead.FirstName = 'John';
    dupLead.LastName = 'Smith';
    dupLead.Company   = 'Golden State Warriors';
    dupLead.Email = 'john@john.com';
    
    try {
      insert dupLead;
   } catch (Exception e) { 
           System.debug('An error happened, as predicted!');
     }

    List <Lead> dupes = [Select Id from Lead Where Email = 'john@john.com'];
    System.assertEquals(0, dupes.size());

    Lead legitLead = new Lead();
    legitLead.FirstName = 'David';
    legitLead.LastName = 'Lee';
    legitLead.Company   = 'Golden State Warriors';
    legitLead.Email = 'dlee@john.com';
    insert legitLead;
    
    List <Lead> legits = [Select Id from Lead Where Email = 'dlee@john.com'];
    System.assertEquals(1, legits.size());


  }
}