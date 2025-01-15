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

    public static void updatePhoneFieldOnAcc(List<Contact> contacts){
        Set<Id> accountIds = new Set<Id>();
        for(Contact contact : contacts){
            if(contact.AccountId != null){
                accountIds.add(contact.AccountId);
            }
        }
        List<Account> accounts = [SELECT Phone FROM Account WHERE ID IN :accountIds];
 
        for(Account account : accounts){
            for(Contact contact : contacts){
                if(contact.AccountId == account.Id){
                    account.Phone = contact.Phone;
                }
            }
        }
        update accounts;
    }
 


}