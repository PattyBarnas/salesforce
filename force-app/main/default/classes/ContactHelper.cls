public class ContactHelper {
    public ContactHelper() {

    }

    @AuraEnabled
    public static void insertDefaultEmail(List<Contact> newContactList){
        // List<Contact> email = new List<Contact>();
        for(Contact c : newContactList){
            if(String.isEmpty(c.Email)){
                c.Email = c.LastName + '@yahoo.com'; 
            }
        }
       
    }


    // Class Challenge

    public static void matchingEmailInsert(List<Contact> contacts) {
        Set<Id> conIds = new Set<Id>();
    
        for(Contact c : contacts) {
            conIds.add(c.AccountId);
        }
    
        if(conIds.size() > 0) {
            List<Contact> otherContacts = [SELECT Email, AccountId FROM Contact WHERE AccountId IN :conIds];
    
            Map<Id, String> accountDomainMap = new Map<Id, String>();
            
            for(Contact oc : otherContacts) {
                List<String> emailsplit = oc.Email.split('@');
                accountDomainMap.put(oc.AccountId, emailsplit[1]);
            }
    
            for(Integer j = 0; j < contacts.size(); j++) {
                if (accountDomainMap.containsKey(contacts.get(j).AccountId)) {
                    String domain = accountDomainMap.get(contacts.get(j).AccountId);
                    if(!contacts.get(j).Email.contains(domain)) {
                        contacts.get(j).addError('You cannot add contact, wrong domain');
                    }
                }
            }
        }
    }

    public static void updatePhoneFieldOnAcc(List<Contact> contList) { 
        Set<Id> accIds = new Set<Id>();
    
        
        for(Contact c: contList){
            accIds.add(c.AccountId);
        }
    
        if (!accIds.isEmpty()) {
         
            Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id, Phone FROM Account WHERE Id IN :accIds]);
    
          
            List<Contact> contactsToUpdate = new List<Contact>();
    
            for(Contact c : contList) {
                if (accountMap.containsKey(c.AccountId)) {
                    accountMap.get(c.AccountId).Phone = c.Phone;
                    contactsToUpdate.add(c);
                }
            }
    
            if (!contactsToUpdate.isEmpty()) {
                update contactsToUpdate;
            }
        }
    }
    


}