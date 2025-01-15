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


    // public static void updatePhoneFieldOnAcc(List<Contact> contList,){ 


    //     Map<Id, String> accountPhoneUpdate = new Map<Id, String>();

    //     for(Contact c: contList){
    //         // Contact oldCon = Trigger.oldMap.get(c.Id);
    //         if(c.Phone != oldCon.Phone){
    //             accountPhoneUpdate.put(con.AccountId, con);
    //         }
    //     }

    //     List<Account> accToUpdate = new List<Account>();

    //     for(Id accountId: accountPhoneUpdate.keySet()){
    //         accToUpdate.add(new Account(Id = accountId, Phone = accountPhoneUpdate.get(acc)))
    //     }

    // }
    // public static Account createAccount(){

    // }
    // public static List<Account> createAccounts(Integer accsToCreate){
    //     for(Integer i; i < accsToCreate; i++){
    //         Account a = new Account(Name = 'Test' + i);

    //     }
    // }
}