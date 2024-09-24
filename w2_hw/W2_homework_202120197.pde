void setup() {
  size(640, 480);
  background(255);
  rectMode(CENTER);
  strokeWeight(3);
}

void draw() {
  fill(110, 66, 50);
  circle(220, 240, 110);
  fill(220, 170, 130);
  circle(220, 240, 65);
  fill(110, 66, 50);
  circle(420, 240, 110);
  fill(220, 170, 130);
  circle(420, 240, 65);
  fill(110, 66, 50);
  circle(320, 240, 200);
  fill(220, 170, 130);
  circle(320, 240, 150);
  fill(0, 0, 0);
  circle(280, 230, 30);
  fill(255, 255, 255);
  circle(280, 230, 20);
  fill(0, 0, 0);
  circle(360, 230, 30);
  fill(255, 255, 255);
  circle(360, 230, 20);
  fill(0);
  ellipse(320, 260, 20, 15);
  line(320, 280, 320, 270);
  line(320, 280, 310, 290);
  line(320, 280, 330, 290);
}

 void mousePressed() {
      fill(114, 0, 0);
      ellipse(320, 260, 20, 15);
}
