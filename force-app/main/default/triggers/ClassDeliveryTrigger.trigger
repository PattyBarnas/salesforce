trigger ClassDeliveryTrigger on Class_Delivery__c (after insert) {

    switch on Trigger.operationType {
        when AFTER_INSERT{
            ClassDelHelper.changeClassDelivery(Trigger.new);
        }

    }


}