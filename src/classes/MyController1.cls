public with sharing class MyController1 {
	public final Account account {get; set;}
	
	public MyController1() {
		account = [select name from Account where id = : ApexPages.currentPage().getParameters().get('id')];
	}
	
	public pageReference save() {
		update account;
		return null;
	}
}