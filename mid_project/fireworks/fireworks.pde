ArrayList<Explosion> explosions; // 폭발(불꽃놀이) 효과 리스트
ArrayList<Meteor> meteors;       // 별똥별 리스트

void setup() {
  fullScreen();
  explosions = new ArrayList<Explosion>(); // 폭발 리스트 초기화
  meteors = new ArrayList<Meteor>();       // 별똥별 리스트 초기화
}

void draw() {
  background(10, 10, 30, 50); // 우주 배경 (잔상 효과를 위해 오퍼시티 낮춤)

  // 별똥별 생성
  if (random(1) < 0.018) { // 약 1% 확률로 별똥별 생성
    meteors.add(new Meteor());
  }

  // 별똥별 업데이트 및 그리기
  for (int i = meteors.size() - 1; i >= 0; i--) {
    Meteor m = meteors.get(i);
    m.update();
    m.display();
    if (m.isOutOfScreen()) { // 화면 밖으로 나가면 사라지게 함
      meteors.remove(i);
    }
  }

  // EXPLOSION 그리기
  for (int i = explosions.size() - 1; i >= 0; i--) {
    Explosion e = explosions.get(i);
    e.update();
    e.display();
    if (e.isFinished()) { // 폭발이 끝나면 사라지도록
      explosions.remove(i);
    }
  }

  // ArrayList 크기 화면에 출력
  fill(255); // 흰색 글씨
  textSize(16); // 글씨 크기 설정
  text("Explosions: " + explosions.size(), 10, 20); // 폭발 리스트 크기
  text("Meteors: " + meteors.size(), 10, 40);       // 별똥별 리스트 크기
}

// 마우스를 클릭하면 클릭한 부분을 기점으로 터지는 불꽃
void mousePressed() {
  explosions.add(new Explosion(mouseX, mouseY));
}

// Explosion 클래스
class Explosion {
  ArrayList<Particle> particles; // 폭발 입자 리스트
  boolean finished = false;

  Explosion(float x, float y) {
    particles = new ArrayList<Particle>();
    for (int i = 0; i < 100; i++) { // 폭발 입자 수 증가
      float angle = random(TWO_PI); // 360도 방향으로 퍼지는 입자
      float speed = random(2, 12);  // 퍼지는 속도 범위를 다양하게
      float vx = cos(angle) * speed;
      float vy = sin(angle) * speed;

      // 밝은 색상에서 랜덤으로 터지도록
      color col = color(random(150, 255), random(100, 255), random(100, 255));
      particles.add(new Particle(x, y, vx, vy, col));
    }
  }

  void update() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isFaded()) { // 입자가 투명해진 상태로 제거
        particles.remove(i);
      }
    }
    if (particles.isEmpty()) { // 모든 입자가 사라지면 끝나도록
      finished = true;
    }
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }

  boolean isFinished() {
    return finished;
  }
}

// Particle 클래스
class Particle {
  float x, y; // 위치
  float vx, vy; // 속도
  color col; // 색상
  float lifespan; // 얼마나 남아있는가
  float fadeSpeed; // 잔상이 사라지는 속도
  float friction = 0.97; // 잔상이 바깥으로 나갈수록 입자 퍼지는 속도 줄어듦
  ArrayList<PVector> trail; // 잔상 효과

  Particle(float x, float y, float vx, float vy, color col) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.col = col;
    this.lifespan = 255; // 처음에는 밝게 시작
    this.fadeSpeed = 255 / 180.0; // 약 5초 동안 투명화 (180프레임 기준)
    trail = new ArrayList<PVector>();
  }

  void update() {
    x += vx; // 속도에 따라 이동
    y += vy;

    vx *= friction; // 속도를 서서히 감소
    vy *= friction;
    lifespan -= fadeSpeed; // 서서히 사라짐

    trail.add(new PVector(x, y)); // 잔상 추가
    if (trail.size() > 15) { // 꼬리 길이 제한
      trail.remove(0);
    }
  }

  void display() {
    noStroke();
    for (int i = 0; i < trail.size(); i++) {
      float alpha = map(i, 0, trail.size() - 1, 50, lifespan);
      fill(col, alpha);
      PVector t = trail.get(i);
      ellipse(t.x, t.y, 4, 4);
    }
    fill(col, max(lifespan, 0)); // 중심 입자
    ellipse(x, y, 6, 6);
  }

  boolean isFaded() {
    return lifespan <= 0;
  }
}

// Meteor 클래스 (별똥별)
class Meteor {
  float x, y;         // 현재 위치
  float vx, vy;       // 속도
  color col;          // 색상
  float size;         // 별똥별 크기
  ArrayList<PVector> tail; // 잔상 

  Meteor() {
    x = random(width);          // x 선 위에서 랜덤으로 생성되도록
    y = random(0, 0);      // 화면 위쪽에서 시작
    if (random(1) < 0.5) {
      vx = random(2, 4);
    } else {
      vx = random(-4, -2);
    }
    vy = abs(vx); // 45도 각도를 유지하기 위해 vy를 vx와 동일하게 설정
    col = color(255, 255, random(0, 255)); // 밝은 색
    size = random(3, 6);        // 랜덤 크기
    tail = new ArrayList<PVector>(); // 꼬리 초기화
  }

  void update() {
    x += vx;
    y += vy;

    tail.add(new PVector(x, y)); // 현재 위치를 꼬리에 추가
    if (tail.size() > 10) {      // 꼬리 길이가 너무 길어지지 않도록
      tail.remove(0);
    }
  }

  void display() {
    noStroke();
    for (int i = 0; i < tail.size(); i++) {
      float alpha = map(i, 0, tail.size() - 1, 50, 200); // 꼬리 투명도
      fill(col, alpha);
      PVector t = tail.get(i);
      ellipse(t.x, t.y, size / 2, size / 2);
    }
    fill(col);
    ellipse(x, y, size, size);
  }

  boolean isOutOfScreen() {
    return y > height; 
  }
}
