public with sharing class MyPageCustom {

    
    public Account account {get;set;}
    public List<Contact> contact {get; set;}
    public List<Account> accounts {get; set;}
    private Id id;
    public String userInput {get; set;}


       public MyPageCustom(){
        // account = [SELECT NAME, ID FROM ACCOUNT WHERE NAME = 'HAHA' LIMIT 1];
        id = ApexPages.currentPage().getParameters().get('id');
        userInput = '';
        contact = new List<Contact>();
    
       }

       public void getCurrentUser(){
        if(id != null){
           account = [SELECT NAME, ID FROM ACCOUNT WHERE Id = :id LIMIT 1];
        }
       }

       public void getAccByUserInput(){
        if (!String.isEmpty(userInput)) {
            List<Account> accs = [SELECT NAME FROM ACCOUNT WHERE NAME LIKE :('%' + userInput + '%') LIMIT 1];
            if (accs.size() > 0) {
                account = accs[0];
                id = account.Id;
            } else {
                account = null;
                id = null;
            }
        }
    }
       

    public void getRelListOfAcc(){
      if (id != null) {
          contact = [SELECT NAME, AccountId FROM Contact WHERE AccountId = :id];
      } else {
        contact = new List<Contact>();
      }
    }

    public void getAccsByKeystrokes(){
        if(!String.isEmpty(userInput)){
            accounts = [SELECT NAME FROM ACCOUNT WHERE NAME LIKE :('%' + userInput + '%')];
        }
    }

    public void saveAccounts(){
        if(accounts != null){
            update account;
        } else{
            insert account;
        }
    }

}