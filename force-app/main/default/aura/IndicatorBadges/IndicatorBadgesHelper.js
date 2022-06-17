({
  getResponse : function(component){
  //  var action = component.get("c.getSObjectLabel");
   var action = component.get("c.getSObjectLabel");
    action.setCallback(this, function(response){
   		var label = response.getReturnValue();
       
       // component.set("v.AnimalVal", label);
        
         /* var lst = [];
          
          for(var key in label){
              lst.push(label[key]);
          }*/
         component.set("v.AnimalVal", label);
    });
    $A.enqueueAction(action);
  },
  //future code here
})