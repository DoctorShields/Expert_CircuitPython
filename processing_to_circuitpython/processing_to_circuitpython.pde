import processing.serial.*;
Serial myPort;
int w = 310;
int h = 415;
int space = 5;
color bg = color(180,50,170);
color boxes = color(220,220,220);
color lines = color(255,0,0);
color dot = color(255,0,0);
color txtColor = color(0,60,160);
int dotR = 8;
int xPos, yPos;
String xTxt, yTxt;
int lineHeight = 32;
String outString;

void settings() {
  size(w, h);
}

void setup() {
  println("Available serial ports:");
  println(Serial.list());
  //myPort = new Serial(this, Serial.list()[1], 9600);
  drawBg();
}

void draw() {

}

void drawBg() {
  noStroke();
  background(bg);
  fill(boxes);
  rect(space, space, w-space*2, w-space*2);
  rect(space, w, w-space*2, h-w-space);
  strokeWeight(1);
  stroke(lines);
  line(w/2,space,w/2,w-space);
  line(space,w/2+space,w-space,w/2+space);
  fill(txtColor);
  textSize(lineHeight);
  xTxt = "Servo 1: " + xPos + "°";
  text(xTxt, space*4, w+space*8);
  yTxt = "Servo 2: " + yPos + "°";
  text(yTxt, space*4, w+space*10+lineHeight);
}

void mouseMoved() {
  if(mouseX > space && mouseX < w-space*2 && mouseY > space && mouseY < w-space*2) {
    drawBg();
    noCursor();
    fill(dot);
    xPos = constrain((mouseX-space)*180/(w-space*2));
    yPos = constrain((mouseY-space)*180/(w-space*2));
    ellipse(mouseX,mouseY+dotR/2,dotR,dotR);
    outString = xPos + "|" + yPos + "$";
    println(outString);
  }
}

int constrain(int val) {
 return min(max(val,0),180); 
}
