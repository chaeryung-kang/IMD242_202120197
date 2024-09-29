//boolean expression / always true or false
//relational oprator / compare two numbers >, <, >=, <=, ==, !=
//number is changing
void setup() {
  size(640, 360);
}

void draw() {
  background(0);

  if (mouseX > 320) {
    background(255);
  }

  stroke(127);
  strokeWeight(4);
  line(320, 0, 320, height);
}
