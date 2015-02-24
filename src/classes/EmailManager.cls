public class EmailManager {
	
	//public method 
    
    public void sendMail(string address, string subject, string body){
    
    //Create an email message object
    
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        string [] toAddresses = new string [] {address};

        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        
        //pass this email to the builtin sendEmail method of the
        //method class

         Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

        inspectResults(results);
       
     }

     private static boolean inspectResults(Messaging.SendEmailResult [] results){

     	boolean sendResult = true;

     	for (Messaging.SendEmailResult res: results){

     		if (res.isSuccess()){
     			System.debug('emial sent');

     		}else { 
     		System.debug('emial not sent ' + res.getErrors());

		}
	}
	return sendResult;


     }

}