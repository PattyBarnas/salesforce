trigger AccountTriggers on Account (after insert, before delete, after update) {
    // Create a trigger to prevent the deletion of Accounts with Contacts.


    switch on Trigger.operationType {
       
        when BEFORE_DELETE {
        AccountHelper.preventDelete(Trigger.old);

        }

        when BEFORE_UPDATE{
 
        }
        when AFTER_INSERT { 
            // AccountHelper
            System.debug('After Insert Fired.');
            AccountHelper.insertNewRelatedContact(Trigger.new);
        }
        when AFTER_UPDATE {
            // AccountHelper.updatePhoneFieldOnAcc(Trigger.new);
        }
    } 



    // Create a trigger to create a new related Contact when an Account is inserted.

}