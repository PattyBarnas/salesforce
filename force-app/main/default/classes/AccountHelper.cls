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
            List<Contact> conList = [SELECT AccountId From Contact WHERE AccountId In :accIds];

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
            
            List<Contact> contList = new List<Contact>();

            for(Integer i = 0; i < newAcc.size(); i++){
                Contact cont = new Contact(LastName = 'Testing' + i);
                cont.AccountId = newAcc[i].Id;
                contList.add(cont);

            }

           insert contList;
        } catch (Exception e) {
            
        }
    }



    // public static Account createAccount(){

    // }
    // public static List<Account> createAccounts(Integer accsToCreate){
    //     for(Integer i; i < accsToCreate; i++){
    //         Account a = new Account(Name = 'Test' + i);

    //     }
    // }
}