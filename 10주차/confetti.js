class Confetti {
  constructor(x, y, w, h, colour, force, angForce) {
    this.pos = [0, 0];
    this.vel = [0, 0];
    this.size = [0, 0];
    this.ang = 0;
    this.angVel = 0;
    this.init(x, y, w, h, colour, force, angForce);
  }

  init(x, y, w, h, colour, force, angForce) {
    this.pos[0] = x;
    this.pos[1] = y;
    this.size[0] = w;
    this.size[1] = h;
    this.colour = colour;
    const randomDir = radians(random(360));
    this.vel[0] = force * cos(randomDir);
    this.vel[1] = force * sin(randomDir);
    this.ang = radians(random(360));
    this.angVel = radians(angForce);
  }

  update(force, friction) {
    for (let idx = 0; idx < 2; idx++) {
      this.vel[idx] += force[idx];
      this.pos[idx] += this.vel[idx]; 
      this.vel[idx] *= friction;      
    }
    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos[0], this.pos[1]);
    rotate(this.ang);
    noStroke();
    fill(this.colour);
    rect(0, 0, this.size[0], this.size[1]);
    pop();
  }

  getDiagonal() {
    const sumSquare = pow(this.size[0] * 0.5, 2) + pow(this.size[1] * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    return this.pos[0] < -this.getDiagonal()
      || this.pos[0] > width + this.getDiagonal()
      || this.pos[1] < -this.getDiagonal()
      || this.pos[1] > height + this.getDiagonal();
  }
}



const colours = [
  "#257180",
  "#F2E5BF", 
  "#FD8B51",
  "#CB6040"
];
const gravity = [0, 0.1];
const friction = 0.99;
let cnt = 0;
let mouse = [0, 0];
let confetties = [];

function setup() {
  createCanvas(800, 800);
}

function gen(x, y, n) {
  for (let idx = 0; idx < n; idx++) {
    const randomW = random(4, 20);
    const randomH = random(4, 20);
    const randomForce = random(1, 10);
    const randomAngForce = random(-30, 30);
    const newConfetti = new Confetti(x, y, 
      randomW, randomH,
      colours[floor(random(colours.length))],
      randomForce, randomAngForce);
    confetties.push(newConfetti); 
  }
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log("gen: " + cnt);
  gen(mouse[0], mouse[1], cnt);
}

function keyPressed() { 
  if (key === 'p' || key === 'P')
    console.log("confetties: " + confetties.length); 
}

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }
  background(255);
  for (let idx = confetties.length - 1; idx >= 0; idx--) { 
    const aConfetti = confetties[idx];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(idx, 1);
    }
  }
  for (let idx = 0; idx < confetties.length; idx++)
    confetties[idx].display();
}