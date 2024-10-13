int tileNum;
int randomSeed = 0;

void setup() {
  size(600, 600);
}

void draw() {
  randomSeed(randomSeed);
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  float noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  float tileSize = width / float(tileNum);

  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      rotate(radians(360 * noiseVal));
      stroke(255);
      line(0, 0, tileSize * 0.4, 0); 
      
      float smallCircleSize = tileSize * 0.4 * 0.3;
      fill(0);
      circle(tileSize * 0.4, 0, smallCircleSize); 
      popMatrix();
    }
  }
}
