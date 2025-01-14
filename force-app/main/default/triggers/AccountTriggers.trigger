trigger AccountTriggers on Account (after insert, before delete) {
    // Create a trigger to prevent the deletion of Accounts with Contacts.


    switch on Trigger.operationType {
        // when AFTER_INSERT{
        //     // AccountHelper.createNewRelatedContact(Trigger.new);
        // }
        
        when BEFORE_DELETE {
            AccountHelper.preventDelete(Trigger.old);

        }
        when AFTER_INSERT { 
            // AccountHelper
            AccountHelper.insertNewRelatedContact(Trigger.new);
        }
        when BEFORE_UPDATE{
            // for(Account acc : Trigger.new){
            //     if(acc.email == null){
            //         acc.addError('You cannot create an acc without email');

            //         // to show it on a specific field
            //         // acc.email.addError('You cannot create an acc without email');
            //     }
            // }
        }
    }



    // Create a trigger to create a new related Contact when an Account is inserted.

}