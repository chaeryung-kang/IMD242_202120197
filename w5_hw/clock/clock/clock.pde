void setup() {
  size(800, 800) ;
}

void draw() {
  background(255);  
  translate(width / 2, height / 2);  // 화면 중심으로 이동

  // 시계 테두리 그리기
  stroke(0);  
  strokeWeight(8);  
  noFill();
  ellipse(0, 0, 760, 760);  // 시계 테두리
  
  // 시계 마커 그리기
  for (int markerIndex = 0; markerIndex < 60; markerIndex++) {
    pushMatrix();
    rotate(markerIndex * 6);  

    if (markerIndex % 5 == 0) {
      strokeWeight(4);  // 5의 배수는 굵게 그리기
      line(0, -340, 0, -380);  // 긴 마커
    } else {
      strokeWeight(2);  // 짧은 마커
      line(0, -360, 0, -380);  
    }
    popMatrix();
  }

  // 현재 시간 정보 가져오기
  int currentSecond = second();
  int currentMinute = minute();
  int currentHour = hour() % 12;  // 12시간제를 위해 나머지 연산

  // 초침 그리기 (1초마다 6도 회전)
  pushMatrix();
  rotate(currentSecond * -6);  // 초침은 초마다 6도씩 회전
  stroke(255, 0, 0);  // 빨간색
  strokeWeight(2);
  line(0, 0, 0, -350);  // 초침의 길이
  popMatrix();

  // 분침 그리기 (1분마다 6도 회전)
  pushMatrix();
  rotate(currentMinute * -6 + currentMinute * -0.1);  // 분침은 분마다 6도씩 회전, 초에 따라 미세하게 이동
  stroke(0);  // 검은색
  strokeWeight(6);
  line(0, 0, 0, -300);  // 분침의 길이
  popMatrix();

  // 시침 그리기 (1시간마다 30도 회전)
  pushMatrix();
  rotate(currentHour * -30 + currentMinute * -0.5);  // 시침은 시마다 30도씩 회전, 분에 따라 미세하게 이동
  stroke(0);  // 검은색
  strokeWeight(8);
  line(0, 0, 0, -200);  // 시침의 길이
  popMatrix();

  // 시계의 중앙점 그리기
  fill(255, 0, 0);
  noStroke();
  ellipse(0, 0, 20, 20);  // 중앙의 빨간 원
}
