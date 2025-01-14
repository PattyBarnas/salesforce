public without sharing class ClassDelHelper {
    public ClassDelHelper() {

    }

    public void createDeliveryRecord(){
        // List<Class_Delivery__c> classList = [SELECT ID FROM Class_Delivery__c WHERE Id = :Id];
        // if(classList.isEmpty()){
        // }
        Class_Delivery__c newClass = new Class_Delivery__c(Course__c = 'Create Delivery', Name = 'create delivery');
        Database.insert(newClass);
    }

    public static void deleteDeliveryRecords(Id id){
        Class_Delivery__c classId = [SELECT id FROM Class_Delivery__c WHERE Id = :id];
        if(classId == null){
          Database.delete(classId);
        }
    }

    public static void changeClassDelivery(Id Id){

        Class_Delivery__c classDel = [SELECT Id, Name FROM Class_Delivery__c WHERE Id = :id];

        if(Schema.SObjectType.Class_Delivery__c.fields.Name.isUpdateable()){
            classDel.Name = '.Net';
            Database.update(classDel);

        }


    }
}