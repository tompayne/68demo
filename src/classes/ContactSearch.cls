public class ContactSearch {
    
    public static List<Contact> searchForContacts(String last, String postal){
        Contact[] newList = [Select Id, LastName, MailingPostalCode from Contact where LastName=:last and MailingPostalCode=:postal];
        
        List<Contact> m = new List<Contact>();
        for(integer i=0; i<newList.size();i++){
            m.add(newList[i]);
            System.debug(newlist[i]);
           
            i++;
        }
        
        return m;
        
    }

}