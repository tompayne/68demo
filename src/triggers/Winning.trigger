trigger Winning on Opportunity (before update) {
	for (Opportunity opp : trigger.new) {
		Opportunity oldMap = trigger.oldMap.get(opp.id);
		system.debug(oldMap.id);

		Boolean oldOppIsWon = oldMap.StageName.equals('Closed Won');
		Boolean newOppIsWon = opp.StageName.equals('Closed Won');

		if (!oldOppIsWon && newOppIsWon ){
			opp.I_am_awesome__c = true;
		}




	}
	

}