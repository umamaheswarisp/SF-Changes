public class AnimalLocator {

    public static String getAnimalNameById(Integer i){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/1');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String name;
         if(response.getStatusCode() == 200) {

            Map<String, Object> mapname = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());             
            System.debug(mapname.get('animal'));
           
            JSONParser parser = JSON.createParser(response.getBody());
       
            while (parser.nextToken() != null) {
                  if (parser.getCurrentToken() == JSONToken.START_OBJECT) {
                    // Get the value.
                     Animal animal = (Animal)parser.readValueAs(Animal.class);
                     system.debug('name: ' + animal.animal.name);
                     name = animal.animal.name;
                }
            }        
         }
         
        return name;
    }
}