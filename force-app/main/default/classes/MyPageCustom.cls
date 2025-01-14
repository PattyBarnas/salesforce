public with sharing class MyPageCustom {

    public Id accId{get;set;}
    public Account acc;

       public MyPageCustom(){

       }

    public ApexPages.StandardSetController ssc {
      get{

        if(ssc == null){
            ssc = new ApexPages.StandardSetController([SELECT NAME, ID FROM ACCOUNT]);
        }
        return ssc;

        } 
    set;
    }

}