function setup() {
  createCanvas(400, 400);
}

function draw() {
  background(220);
  for(let n = 0; n < width; n += 40 ) {
    let x = 20 + n;
    let y = height * 0.5;
    let diameter = 30;
    circle(x, y, diameter);
  }
    //자바는 float int 전부 let으로 구분 x 로 사용 가능

}
