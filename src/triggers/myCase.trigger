trigger myCase on Account (after insert) {
for (Account acc : Trigger.new){
    Case shirtCase = new Case();
    shirtCase.Subject = 'some case';
    shirtCase.Priority = 'Very high';
    shirtCase.AccountID = acc.id;
    insert shirtCase;
    }
}