public with sharing class AccountHelper {
    public AccountHelper() {

    }

   
    @AuraEnabled
    public static void preventDelete(List<Account> oldAccList){

        // Create a trigger to prevent the deletion of Accounts with Contacts.
        // if contact exists
        // throw error
        try {

            List<Contact> relatedContactList = [SELECT Id
            FROM Contact  
            WHERE AccountId In : Trigger.oldMap.KeySet()];

            set<id> accIds = new set<id>();

            if(!relatedContactList.isEmpty()){

                for(Contact c: relatedContactList){
                    accIds.add(c.AccountId);
                }

                for(Account acc: oldAccList){
                    if(accIds.contains(acc.id)){
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