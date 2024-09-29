void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(255);
  strokeWeight(2);
  line(320, 0, 320, 360);
  line(0, 180, 640, 180);

  if (mouseX < width / 2 && mouseY < height / 2) {
    square(160, 90, 90);
  } else if (mouseX > width / 2 && mouseY < height / 2) {
    circle(480, 90, 90);
  } else if (mouseX < width / 2 && mouseY > height / 2) {
    ellipse(160, 270, 90, 40);
  } else if (mouseX > width / 2 && mouseY > height / 2) {
    line(440, 240, 530, 310);
  }
}
