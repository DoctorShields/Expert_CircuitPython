int screenW = 400;
int screenH = 400;
int outerR = screenW/2-10;
int innerR = outerR - 50;
color bg = color(180,50,170);
color face = color(40,100,180);
color tick = color(255,255,0);
color txtColor = color(255,255,255);
int ticks = 30;
float thetaI = 0;
int val;
float theta;

void settings() {
  size(screenW, screenH);
}

void setup() {
  frameRate(4);
}

void draw() {
  theta = thetaI;
  val = 0;
  drawSpeedo();
  thetaI += .1;
}

void drawSpeedo() {
  strokeWeight(3);
  stroke(tick);
  fill(face);
  ellipse(screenW/2, screenH/2, outerR*2, outerR*2);
  for (int i=0; i<ticks; i++) {
      float x1 = screenW/2 + innerR*cos(theta);
      float y1 = screenH/2 - innerR*sin(theta);
      float x2 = screenW/2 + outerR*cos(theta);
      float y2 = screenH/2 - outerR*sin(theta);
      float txtX = screenW/2-8 + (innerR-12)*cos(theta);
      float txtY = screenH/2+4 - (innerR-12)*sin(theta);
      line(x1, y1, x2, y2);
      fill(txtColor);
      textSize(12);
      text(val, txtX, txtY); 
      theta += 2*PI/ticks;
      val += 100/ticks;
  }
}
