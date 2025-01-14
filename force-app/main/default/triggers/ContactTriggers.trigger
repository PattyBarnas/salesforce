trigger ContactTriggers on Contact (before insert, after update) {
    // Create a trigger to set a default value for Email on Contacts that are inserted without one.

    // if(Trigger.isInsert){
    // }

    switch on Trigger.operationType{
        when BEFORE_INSERT{

            System.debug('trigger is fired');
            ContactHelper.insertDefaultEmail(Trigger.new);
            
            }
        
        // when AFTER_UPDATE{
        //     // AccountHelper.preventDelete(Trigger.old);

        // }
    }


    // if(Trigger.isUpdate){

    // }

    // 

}