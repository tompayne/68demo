trigger CountFriends on Contact (before Insert){
for (Contact c: trigger.new){
    System.debug ('Tom has a new friend');
    System.debug ('Hi '+ c.FirstName + ' ' + c.LastName);
}
List<Contact> total = [Select Id from Contact];
System.debug ('Tom has '+ total.size() + ' friends');
}