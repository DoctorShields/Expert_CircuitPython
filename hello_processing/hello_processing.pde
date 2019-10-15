int w = 300;
int h = 300;
int rad = 20;
float xpos = w/2;
float ypos = h/2;    
float xspeed = 2;
float yspeed = 3;
int xdir = 1;
int ydir = 1;
color bg = color(180,50,170);
color ball = color(40,100,180);

void settings() {
  size(w, h);
}

void setup() {
  
}

void draw() 
{
  background(bg);
  xpos = xpos + ( xspeed * xdir );
  ypos = ypos + ( yspeed * ydir );
  if (xpos > w-rad || xpos < rad)
    xdir *= -1;
  if (ypos > h-rad || ypos < rad)
    ydir *= -1;
   fill(ball);
  ellipse(xpos, ypos, rad*2, rad*2);
}
