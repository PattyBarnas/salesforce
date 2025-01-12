trigger AccountTriggers on Account (after insert, before delete) {
    // Create a trigger to prevent the deletion of Accounts with Contacts.


    // if(Trigger.isDelete){
    //     AccountHelper.preventDelete(Trigger.old);

    // }
    switch on Trigger.operationType{
        // when AFTER_INSERT{
        //     // AccountHelper.createNewRelatedContact(Trigger.new);
        // }
        
        when BEFORE_DELETE{
            AccountHelper.preventDelete(Trigger.old);

        }
    }



    // Create a trigger to create a new related Contact when an Account is inserted.

}