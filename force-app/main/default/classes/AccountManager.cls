@RestResource(urlMapping='/Accounts/*')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccountSample(){
        String id = RestContext.request.params.get('id');
        RestRequest req = RestContext.request;
       // String id = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id, Name, BillingCity, BillingPostalCode, BillingCountry  FROM Account where Id=:id];
        return acc;
    } 
    
    @HttpPost
    global static ID postAccount(String id, String name, String billingCountry, String phone){
        Account acc = new Account(Id=id, Name=name, BillingCountry=billingCountry, BillingPostalCode=phone);
        upsert acc;
        return acc.Id;
    }
    
    @HttpPut
    global static ID upsertAccount(String id, String name, String billingCountry, String phone){
        Account acc = new Account(Id=id, Name=name, BillingCountry=billingCountry, BillingPostalCode=phone);
        upsert acc;
        return acc.Id;
    }
    
    @HttpPatch
    global static ID updateAccount(){
        String id = RestContext.request.params.get('id');
        RestRequest req = RestContext.request;
        //String id = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id, Name, BillingCity, BillingPostalCode, BillingCountry  FROM Account where Id=:id];
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(req.requestbody.tostring());
        // Iterate through each parameter field and value
        for(String fieldName : params.keySet()) {
            // Set the field and value on the Case sObject
            acc.put(fieldName, params.get(fieldName));
        }
        update acc;
        return acc.Id;
    }
    
    @HttpDelete
    global static void deleteAcc(){
         RestRequest req = RestContext.request;
       	 String id = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Account acc = [SELECT Id, Name, BillingCity, BillingPostalCode, BillingCountry  FROM Account where Id=:id];
        delete acc;
    }
}