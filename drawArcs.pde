void drawArcs(){  
  float startAngle = 0;  
  float lastAngle = 0;
  float radian = 360.0/childrenA.length;
  int stationRadius = 80;
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(angle/4));  
  
  for (int i = 0; i < childrenA.length; i++) {   
        
    fill(255,0,0);
    noStroke();
    arc(0, 0, scaler*abs(arrayDueTimes.get(i))+arrayLateTimes.get(i)+stationRadius, scaler*abs(arrayDueTimes.get(i))+arrayLateTimes.get(i)+stationRadius, lastAngle, lastAngle+radians(radian));
    
    fill(90+i*100/childrenA.length);
    noStroke();
    arc(0, 0, scaler*(arrayDueTimes.get(i))+stationRadius, scaler*(arrayDueTimes.get(i))+stationRadius, lastAngle, lastAngle+radians(radian));
    lastAngle += radians(radian);
    startAngle = startAngle + lastAngle;
      
    float delta = TWO_PI / childrenA.length;   
    pushMatrix();
      rotate(delta * i+delta);  
      fill(255);
      strokeWeight(1);
    popMatrix(); 
     
    
    pushMatrix();
      rotate(delta * i+delta/2);  
      fill(255);
      noStroke();
      text(arrayOrigin.get(i) + " to " + arrayDestination.get(i) + " Arrives in " + arrayDueTimes.get(i) + " mins.", 60, 0);
    popMatrix(); 
    
    noStroke();
    fill(0);
    ellipse(0,0,stationRadius,stationRadius);
    
    pushMatrix();
      fill(0, 200, 0);
      text(stationID.get(index),-22,5);
    popMatrix();    

  }//for 
  popMatrix(); 
  angle++;     // Increment the rotation 
}
  
  
