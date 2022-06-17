@isTest
public class AnimalLocatorTest {

    @isTest static void testGet(){
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('AnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        system.Test.setMock(system.HttpCalloutMock.class, mock);
        String result = AnimalLocator.getAnimalNameById(1);
    
      System.assertEquals('chicken',result, 'The name is not chicken'); 	
    }
}