
/*
1. Lead is created or updated
2. Lead has an email address
3. Try to find a matching Contact based on email address (using SOQL!)
4. If a match is found, give the user an error
5. If a match is not found, do nothing
*/


trigger findDupes on Lead (before insert, before update){
  for (Lead myLeads : trigger.new){
    if (myLeads.Email != null){
      List <Contact> Dupes = [Select Id from Contact Where Email =: myLeads.Email];
      if (Dupes.size() > 0){
        String errorMessage = 'You entered a duplicate record, ';
        errorMessage += 'see this contact record '+ Dupes[0].Id;
        String fieldError = 'This is a duplicate';
        myLeads.addError(errorMessage); //puts error message at top
        Trigger.new[0].Email.addError(fieldError); //put error message on field
      }
    }
  }
}



