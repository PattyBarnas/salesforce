public class ContactHelper {
    public ContactHelper() {

    }

    @AuraEnabled
    public static void insertDefaultEmail(List<Contact> newContactList){
        for(Contact c : newContactList){
            if(String.isEmpty(c.Email)){
                c.Email = c.LastName + '@yahoo.com';
            }
        }
    }

}