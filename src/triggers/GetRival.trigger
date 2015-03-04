trigger GetRival on Account (before insert, before update) {
	 Set<String> myRivals = new Set<String>();
	 for (Account  accountRivals: Trigger.new) {
		if(accountRivals.Rival_Picklist__c !=null){
			myRivals.add(accountRivals.Rival_Picklist__c);
		}
		List<Rival__c> myOwnRivals = [Select Id, Name From Rival__c 
									 Where Name In :myRivals];
	
	Map<String,Rival__c> rivalsMap = new Map<String,Rival__c>();
		for (Rival__c u : myOwnRivals){
			rivalsMap.put (u.Name, u);
		} 

		for (Account newRivalName : trigger.new) {
			if (accountRivals.Rival_Picklist__c != null){
				Rival__c theTrueRival = rivalsMap.get(accountRivals.Rival_Picklist__c);
				if(theTrueRival != null){
					newRivalName.Rival__c = theTrueRival.id;
				}
	}

}
}
}
