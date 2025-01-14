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


    // Class Challenge

    @AuraEnabled
    public static void preventContactFromSave(List<Account> accList){
        try {

            List<Contact> cont = new List<Contact>();
            // Prevent save if contact email doesnt match the rest of the contacts email
            // on that Account.
            // find accounts related to contacts


            for(Contact con : conList){

                if(con.contains(con)){
                    con.addError('Email must match rest of the contacts domain!');
                }

            }
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }


}