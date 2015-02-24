@isTest
public class testTransferContact {
	static testMethod void insertNewContact() {
		Contact myContact = new Contact();
		myContact.FirstName = 'Jake';
		myContact.LastName = 'Thomas';
		insert myContact;
	}
}