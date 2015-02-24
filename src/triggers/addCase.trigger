trigger addCase on Case (before insert, before update) {

	for (Case cs:trigger.new) {
		if (cs.description == 'Stop'){
			cs.description = 'No Way!';
		}
		//cs.ContactId = '003o000000J96eO';
		//cs.AccountId = '001o00000068ZfC';
	
	}

}