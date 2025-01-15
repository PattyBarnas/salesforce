@isTest
public class ContactHelper_Test {

    @isTest
    public static void TestPreventSaves() {
        // Create a test account
        Account testAcc = new Account(Name = 'test acc');
        insert testAcc;

        // Create contacts with different domains
        Contact test1 = new Contact(LastName = 'jake', AccountId = testAcc.Id, Email = 'test@zzzz.com');
        Contact test2 = new Contact(LastName = 'mike', AccountId = testAcc.Id, Email = 'test@xxxx.com');

        List<Contact> conList = new List<Contact>();
        conList.add(test1);
        conList.add(test2);

        try {
            ContactHelper.matchingEmailInsert(conList);
        } catch (DMLException e) {
            // Handle exception
        }

        List<Contact> contacts = [SELECT Id, LastName, Email, AccountId FROM Contact WHERE AccountId = :testAcc.Id];

        System.assertEquals(1, contacts.size());
    }
}
