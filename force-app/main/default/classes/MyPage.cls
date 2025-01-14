public with sharing class MyPage {

    ApexPages.StandardSetController sd;
    
    public MyPage(ApexPages.StandardSetController controller){
        sd = controller;
        sd.setPageSize(2);
    }

   
}


