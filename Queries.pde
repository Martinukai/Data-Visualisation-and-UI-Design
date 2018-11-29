void requestStationData() {   
  
  xmlS = loadXML(urlStationInfo);  
  childrenS = xmlS.getChildren("objStationFilter");  
    
  storedName = new String[childrenS.length]; // Array to store Station Name
  stationID = new StringList();
  
  for (int i = 0; i < childrenS.length; i++) {
    XML sIDElement = childrenS[i].getChild("StationCode"); 
    String sID = sIDElement.getContent();  
    stationID.append(sID);   
    
    XML sNameElement = childrenS[i].getChild("StationDesc"); 
    String sName = sNameElement.getContent();  
    storedName[i] = sName;
  }   
} 


//________________________________________________________________________________________________________________________________ 
void requestArrayData() {   
  arrayID = new StringList();
  arrayOrigin = new StringList();
  arrayDestination = new StringList();  
  arrayDueTimes = new IntList();
  arrayLateTimes = new IntList();
  
  for (int i = 0; i < childrenS.length; i++) {    
    String myString = stationID.get(index);
    
    //xmlA = loadXML("stationData.xml");  // Uncomment this line and comment the line below if the server is down or you have poor connection
    xmlA = loadXML("http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByCodeXML?StationCode=" + myString);  
      
    childrenA = xmlA.getChildren("objStationData");  

    for (int j = 0; j < childrenA.length; j++) {   
      
      XML originElement = childrenA[j].getChild("Origin");
      String origin = originElement.getContent();      
      arrayOrigin.append(origin);
      
      XML destinationElement = childrenA[j].getChild("Destination");
      String destination = destinationElement.getContent();   
      arrayDestination.append(destination);
      
      XML dueElement = childrenA[j].getChild("Duein");
      int due = dueElement.getIntContent();     
      arrayDueTimes.append(due);
      
      if(childrenA.length >= 1){
        println("This station is currently active");
      } else {  
        println("This station is currently inactive. Please check back tomorrow");
      }

      XML lateElement = childrenA[j].getChild("Late");
      int late = lateElement.getIntContent();     
      arrayLateTimes.append(late);
    } 
  } 
}
