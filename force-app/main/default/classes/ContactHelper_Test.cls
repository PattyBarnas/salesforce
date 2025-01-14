@isTest
public with sharing class ContactHelper_Test {
    public ContactHelper_Test() {

    }

    static void TestPreventSaves(){
        Account testAcc = new Account(Name='test acc');

        insert testAcc;

        Contact testC = new Contact(LastName='testC', AccountId = testAcc.Id, Email='test@temp.com');
        Contact testC2 = new Contact(LastName='testC2', AccountId = testAcc.Id, Email='test@sdfs.com');
  
        List<Contact> toAdd = new List<Contact>();
        toAdd.add(testC);
        toAdd.add(testC2);

        List<Database.SaveResult> sr = Database.insert(toAdd, true);

        Integer success = 0;
        Integer fail = 0;

        for(Database.SaveResult s : sr){
            if(s.isSuccess()){
                success =+ 1;
            } else {
                fail += 1;
            }
        }

    }
}