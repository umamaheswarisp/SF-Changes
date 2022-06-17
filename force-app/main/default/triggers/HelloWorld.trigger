trigger HelloWorld on Account (before insert) {
    
    System.debug('hello world');
    TriggerClass.makeCallout();
    System.debug('end');
    
}