
// Wrong challenge

public with sharing class DataLord {
    public DataLord() {
    }

    public static Integer NumAccounts(){
        Integer numOfAccounts = [SELECT COUNT() FROM Account];
        return numOfAccounts;
    }

    public static Integer NumHot(){
        return [SELECT COUNT() 
        FROM Account 
        WHERE Rating ='Hot'];
    }

    public static Integer NumComplex(){
        return [SELECT COUNT()
        FROM Account
        WHERE Name LIKE '%&'
        ];
    }

    public static List<Account> BigFive(){
        return [SELECT AnnualRevenue FROM ACCOUNT ORDER BY AnnualRevenue DESC NULLS Last LIMIT 5 ];
    }
    public static Opportunity LastBigOpportunity(){
        return [SELECT name,CloseDate, amount FROM Opportunity WHERE Amount > 100000 ORDER BY CloseDate DESC LIMIT 1];
    }

    public static List<Contact> MajorPlayers(){
        return [SELECT Account.Rating, Account.Name FROM Contact WHERE Account.Rating = 'Hot'];
    }

    public static List<AggregateResult> MostPopularAccount(){
        return [SELECT Account.Name, COUNT(Id) FROM CONTACT GROUP BY Account.Name ORDER BY COUNT(ID) DESC LIMIT 1];
    }

    
}