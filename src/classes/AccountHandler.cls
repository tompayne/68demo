public class AccountHandler {
    
   
    
    public static Account insertNewAccount(string myString) {
        
        
        if (String.isBlank(myString)) {
            return null;
        }
       
      
        Account ac = new Account(Name = myString);
        insert ac;
        return ac;    
      
            }
	 }