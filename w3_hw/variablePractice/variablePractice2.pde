void setup() {
  size(640, 360);
  background(0);
}

void draw() {

  circle(mouseX, mouseY, 30);
  if (mousePressed == true) {
    background(0);
  }
}
