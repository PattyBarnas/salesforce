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

    public static void matchingEmailInsert(List<Contact> contacts){
        
        Set<Id> conIds = new Set<Id>();

        for(Contact c : contacts){
            conIds.add(c.AccountId);
        }

        List<Contact> otherContacts = [SELECT Email, AccountId FROM Contact WHERE ID IN :conIds];

        for(Integer i = 0; i < conIds.size(); i++){
            for(Integer j = 0; j < contacts.size(); j++){
                if(otherContacts.get(i).AccountId == contacts.get(j).AccountId){
                    //get domain of contact
                    List<String> emailsplit = contacts.get(j).Email.split('@');
                    String domain = emailsplit[1];
                    if(!otherContacts.get(j).Email.contains(domain)){
                        contacts.get(j).addError('You cannot add contact, wrong domain');
                    }
 
                }
            }
        }
    }
 


}