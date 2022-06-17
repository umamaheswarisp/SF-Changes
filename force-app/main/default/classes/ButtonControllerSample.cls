public class ButtonControllerSample {

   
 /*private ApexPages.StandardController standardController;
 
    public ButtonControllerSample(ApexPages.StandardController standardController)
    {
        this.standardController = standardController;
    }
 
    public PageReference doSomething()
    {
        // Apex code for handling record from a Detail page goes here
        Id recordId = standardController.getId();
        Test_C record = (Test_C) standardController.getRecord();
        return null;
    }
    List<Contact> results = Database.query(
        'SELECT Id, FirstName, LastName, Title, Email ' +
        'FROM Contact ' +
        //'ORDER BY ' + sortOrder + ' ASC ' +
        'LIMIT 10'
    );
*/
    private String sortOrder = 'LastName';
public static AnimalSub getNames() {
   
    	Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
          AnimalSub name;
        if(response.getStatusCode() == 200) {
                             
             JSONParser parser = JSON.createParser(response.getBody());
       
            while (parser.nextToken() != null) {
                  if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    // Get the value.
                     Animal animal = (Animal)parser.readValueAs(Animal.class);
                    system.debug('name: ' + animal.animal.name);
                      name = animal.animal;
                }
            }        
        }
    return name;
}
}