//testing some code
//more tests

public class myLists {

	public void viewList(){
		List <String> doNotCall = new List <String>() ;
		doNotCall.add ('(707) 321-9922');

		List <Contact> dontCall = [SELECT Phone FROM Contact WHERE (Phone IN: doNotCall)];
	    if (dontCall.size() < 1) {
	    	system.debug ('there are no records');
	    } else {
	    	system.debug('I found 1');
	    	
	    }

	} 
}