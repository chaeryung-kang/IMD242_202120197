void setup() {
  size(800, 800) ;
}

void draw() {
  background(255);  
  translate(width / 2, height / 2);  


  stroke(0);  
  strokeWeight(8);  
  noFill();
  ellipse(0, 0, 760, 760); 
  

  for (int markerIndex = 0; markerIndex < 60; markerIndex++) {
    pushMatrix();
    rotate(markerIndex * 6);  

    if (markerIndex % 5 == 0) {
      strokeWeight(4); 
      line(0, -340, 0, -380); 
    } else {
      strokeWeight(2);  
      line(0, -360, 0, -380);  
    }
    popMatrix();
  }


  int currentSecond = second();
  int currentMinute = minute();
  int currentHour = hour() % 12; 


  pushMatrix();
  rotate(currentSecond * -6);  
  stroke(255, 0, 0);  
  strokeWeight(2);
  line(0, 0, 0, -350);  
  popMatrix();


  pushMatrix();
  rotate(currentMinute * -6 + currentMinute * -0.1); 
  stroke(0);  
  strokeWeight(6);
  line(0, 0, 0, -300); 
  popMatrix();


  pushMatrix();
  rotate(currentHour * -30 + currentMinute * -0.5); 
  stroke(0);  
  strokeWeight(8);
  line(0, 0, 0, -200);  
  popMatrix();

  //
  fill(255, 0, 0);
  noStroke();
  ellipse(0, 0, 20, 20);  
}
