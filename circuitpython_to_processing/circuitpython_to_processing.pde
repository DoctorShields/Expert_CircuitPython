import processing.serial.*;
Serial myPort;
int w = 300;
int h = 300;
color bg = color(180,50,170);
color face = color(40,100,180);
color dot = color(255,0,0);
int angle;
int dotR = 8;

void settings() {
  size(w, h);
}

void setup() {
  println("Available serial ports:");
  println(Serial.list());
  myPort = new Serial(this, Serial.list()[1], 9600);
}

void draw()
{
  if (myPort.available() > 0) 
  { 
    background(bg);
    angle = myPort.read();
    println(angle);
    stroke(255);
    strokeWeight(3);
    fill(face);
    ellipse(w/2,h/2,w,h);
    float x = w/2-w/2*cos(radians(angle));
    float y = h/2-h/2*sin(radians(angle));
    line(w/2, h/2, x, y);
    fill(dot);
    ellipse(x,y,dotR,dotR);
    ellipse(w/2,h/2,dotR,dotR);
  } 
}
