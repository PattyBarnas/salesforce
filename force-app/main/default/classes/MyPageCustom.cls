public with sharing class MyPageCustom {

    // public Account accounts {get;set;}
    public Account account {get;set;}
    private Id id;

       public MyPageCustom(){
        // account = [SELECT NAME, ID FROM ACCOUNT WHERE NAME = 'HAHA' LIMIT 1];
        id = ApexPages.currentPage().getParameters().get('id');
    
       }

       public void getCurrentUser(){
        if(id != null){
           account = [SELECT NAME, ID FROM ACCOUNT WHERE Id = :this.id LIMIT 1];
        
        }
       }

    // public ApexPages.StandardSetController ssc {
      
    //     get{
    //     if(ssc == null){
    //         ssc = new ApexPages.StandardSetController([SELECT NAME, ID FROM ACCOUNT WHERE NAME = 'Unique 1']);
    //     }
    //     return ssc;

    //     } 
    // set;
    // }

}