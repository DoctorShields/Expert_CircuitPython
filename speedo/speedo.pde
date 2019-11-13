int screenW = 400;
int screenH = 400;
int outerR = screenW/2-10;
int innerR = outerR - 50;
color bg = color(180,50,170);
color face = color(40,100,180);
color tick = color(255,255,0);
int ticks = 20;

void settings() {
  size(screenW, screenH);
}

void draw() {
  fill(face);
  noStroke();
  ellipse(screenW/2, screenH/2, outerR*2, outerR*2);
  strokeWeight(2);
  stroke(tick);
  float theta = 0;
  for (int i=0; i<ticks; i++) {
      float x1 = screenW/2 + innerR*cos(theta);
      float y1 = screenH/2 - innerR*sin(theta);
      float x2 = screenW/2 + outerR*cos(theta);
      float y2 = screenH/2 - outerR*sin(theta);
      line(x1, y1, x2, y2);
      theta += 2*PI/ticks;
  }
}
