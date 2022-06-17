public class INDICATOR_Controller {
  @AuraEnabled
  public static  String getSObjectLabel(){
    Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
         String name ;
      Map<String, Object> mapname = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());  
        if(response.getStatusCode() == 200) {
                             
             /*JSONParser parser = JSON.createParser(response.getBody());
       
            while (parser.nextToken() != null) {
                  if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    // Get the value.
                     Animal animal = (Animal)parser.readValueAs(Animal.class);
                    system.debug('name: ' + animal.animal.name);
                      name = animal.animal.name;
                }
            } */
            
            // Cast the values in the 'animals' key as a list
           // JSONParser parser = JSON.createParser(response.getBody());
       
            /*while (parser.nextToken() != null) {
                  if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    // Get the value.
                     Animal animal = (Animal)parser.readValueAs(Animal.class);
                     system.debug('name: ' + animal.animal.name);
                     name = animal.animal.name;
                }
            }  */
        }
      Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
       List<Object> animals = (List<Object>) results.get('animals');
      System.debug('valueeeeeeee........'+animals);
     // return animals[0].toString();
    	name = animals.toString();
      return name;
  }
}