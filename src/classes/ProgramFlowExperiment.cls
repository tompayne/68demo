public class ProgramFlowExperiment {
	
	public static integer EmailCounter = 0;
	
	private void SendEmail()
	{
		EmailCounter ++ ;
		System.Debug ('Queueing email to send');
	}
	
	
	private void SendQueuedEmails() {
		
		System.Debug ('Sending email queue');
	}

	private static Set<ID> AlreadyProcessedList = null;
	
	public void HandleContactUpdateTrigger(List<Contact> newlist, Map<ID, Contact> oldmap ) {
		
		if (AlreadyProcessedList == null) AlreadyProcessedList = new Set<ID> (); 

		for (Contact ct : newlist){
		
			if (AlreadyProcessedList.contains(ct.Id)) continue;
			if (ct.OwnerID != oldmap.get(ct.ID).OwnerID)	{
				
				AlreadyProcessedList.add(ct.Id);
				SendEmail();
			}
		}
		SendQueuedEmails();
	}
}