size(640, 480);
//colorMode(HSB, 255);
//colorMode(HSB, 360, 100, 100);
//컬러모드는 RGB와 HSB 사용, HSB는 원기둥형 컬러모드
background(255, 80, 20);
//background(r, g, b);
fill(30, 30, 255);
//strokeWeight는 stroke보다 앞이어도 뒤여도 상관없음
//G, B 값을 지정해주지 않으면 일단 grayscale로 칠해줌
//0부터 255의 숫자를 넣으면 rgb에 맞춰서 색을 넣어줌
strokeWeight(8);
stroke(0, 50, 127);
//stroke랑 fill은 circle보다 면저 나오면 되지 저 둘 사이의 상관관계는 크게 필요x
circle(150, 240, 100);
rectMode(CENTER);
fill(255, 0, 16, 127);
strokeWeight(8);
stroke(127, 0, 50);
//stroke(r, g, b);
//테두리 없애고 싶으면 noStroke();
noStroke();
square(200, 240, 100);
//fill 값 뒤로 네 번째에 값을 넣으면 투명도 됨
