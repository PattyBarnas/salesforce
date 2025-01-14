public with sharing class ClassDelHelper {
    public ClassDelHelper() {

    }

    public void createDeliveryRecord(String Id){

        List<Class_Delivery__c> classList = [SELECT Name FROM Class_Delivery__c WHERE Id = :Id];

        for(Class_Delivery__c c : newClass){
            Class_Delivery__c = new Class_Delivery__c();

        }
    }
}