public with sharing class MyPageCustom {

    
    public Account account {get;set;}
    public Accounts accounts {get; set;}
    private Id id;
    public String userInput {get; set;}


       public MyPageCustom(){
        // account = [SELECT NAME, ID FROM ACCOUNT WHERE NAME = 'HAHA' LIMIT 1];
        id = ApexPages.currentPage().getParameters().get('id');
        userInput = '';
    
       }

       public void getCurrentUser(){
        if(id != null){
           account = [SELECT NAME, ID FROM ACCOUNT WHERE Id = :this.id LIMIT 1];
        }
       }

       public void getAccByUserInput(){
        if (!String.isEmpty(userInput)) {
            List<Account> accs = [SELECT NAME FROM ACCOUNT WHERE NAME LIKE :('%' + userInput + '%') LIMIT 1];
            if (accs.size() > 0) {
                account = accs[0];
            } else {
                account = null;
            }
        }
    }
       

    public void getListOfAccsByUserInput(){

    }

}