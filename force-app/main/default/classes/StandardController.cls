public with sharing class StandardController {

   
    public Account account {get;set;}
    public List<Contact> contact {get; set;}
    public List<Account> accounts {get; set;}

    private ApexPages.StandardSetController sd;

    public StandardController(ApexPages.StandardSetController setController) {
        this.sd = sd;
    }


}