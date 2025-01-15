public with sharing class AccountHelper {
    public AccountHelper() {

    }

   
    @AuraEnabled
    public static void preventDelete(List<Account> accList){

        try {
            // Not letting me delete even if empty
            Set<Id> accIds = new Set<Id>();
           
            for(Account acc : accList){
                if(acc.Id != null){
                accIds.add(acc.Id);
                } 
            }
            // Get related contacts list
            List<Contact> conList = [SELECT AccountId FROM Contact WHERE AccountId IN :accIds];
            for (Account acc : accList){
                for(Contact c: conList){
                    if(acc.Id == c.AccountId){
                        acc.addError('Cannot delete an account that contains contacts.');
                    }
                }
            }
           
        } catch (Exception e) {
            
        }
    }

    @AuraEnabled
    public static void insertNewRelatedContact(List<Account> newAcc){
        try {        
            for (Account acc : newAcc) {
                Contact newContact = new Contact(
                    FirstName = acc.Name,  
                    LastName = 'Related', 
                    AccountId = acc.Id      
                );
                insert newContact;
            } 
        } catch (DMLException e) {
            
        }
    }


 
 




}