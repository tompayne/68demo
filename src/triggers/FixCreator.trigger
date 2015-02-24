trigger FixCreator on Case (before insert) {
	Set<String> allEmails = new Set <String>();
	for (Case newCase : Trigger.new) {
		if(newCase.SuppliedEmail !=null){
			allEmails.add(newCase.SuppliedEmail);
		}
		List<User> potentialUsers = [Select Id, Email From User 
									 Where Email In :allEmails];

		Map<String,User> emailToUserMap = new Map<String,User>();
		for (User u : potentialUsers){
			emailToUserMap.put (u.Email, u);
		} 

		for (Case newCase : trigger.new) {
			if (newCase.SuppliedEmail != null){
				User creator = emailToUserMap.get(newCase.SuppliedEmail);
				if(creator != null){
					newCase.CreatedById = creator.Id;
				}
			}
		}
	}

}