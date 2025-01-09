
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

    
}