PImage p0;
PImage p1;
PImage e;
PImage f;
PImage hp;
PImage t;
PImage s1;
PImage s2;
PImage e1;
PImage e2;
int x;
int g;
int y;
int r;
int q;
int w;
int c;
int fx;
int fy;
int ex;
float ey;
int tx;
int ty;
int xx;
int yy;
int eex;
float eey;
int blood = 40;
int game = 1;
boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;

void setup () {
  size(640,480);
  background(255);
  p0 = loadImage("img/bg1.png");
  p1 = loadImage("img/bg2.png");
  e = loadImage("img/enemy.png");
  f = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  t = loadImage("img/treasure.png");
  s1 = loadImage("img/start1.png");
  s2 = loadImage("img/start2.png");
  e1 = loadImage("img/end1.png");
  e2 = loadImage("img/end2.png");
  x = 0;
  c = 0;
  g = -640;
  ey = floor(random(440));
  ex = 0;
  ey = floor(random(440));
  r = floor(random(200));
  tx = floor(random(600));
  ty = floor(random(400));
  fx=580;
  fy=240;
  xx=580;
  yy=240;
}

void draw() {
    
  background(255);
    
  switch(game){
      case (1):    
      image(s1,0,0);
      if(mouseX<=200+255&&mouseX>=200&&mouseY<=370+42&&mouseY>=370){image(s1,0,0);if(mousePressed){game=2;}}
      else{image(s2,0,0);}    
      break;
      
      case (2):
      
  q = floor(random(600));
  w = floor(random(400));
  y = floor(random(90));
  
  if(down){fy+=10;}
  if(up){fy-=10;}
  if(right){fx+=10;}
  if(left){fx-=10;}
  if(fx>590){fx=600;}
  if(fx<0){fx=-10;}
  if(fy>430){fy=440;}
  if(fy<0){fy=-10;}
  
  x = x+1;
  if(x==640)x=-640; 
  g = g+1;
  if(g==640)g=-640;
  image(p0, x, 0);
  image(p1, g , 0);
  
  if(ex==0)
  {ey=y;ey+=140;} 
  
  if(c==0)
  {
    image(e,ex,ey);
    image(e,ex-70,ey);
    image(e,ex-140,ey);
    image(e,ex-210,ey);
    image(e,ex-280,ey);
    ex+=5;
    if(ex-280>=640)
    {ex=0;c++;}
  }
  else if(c==1)
  {
    image(e,ex,ey);
    image(e,ex-70,ey+30);
    image(e,ex-140,ey+60);
    image(e,ex-210,ey+90);
    image(e,ex-280,ey+120);
    ex+=5;
    if(ex-280>=640)
    {ex=0;c++;}
  }
  else if(c==2)
  {
    image(e,ex,ey);
    image(e,ex-70,ey+70);
    image(e,ex-70,ey-70);
    image(e,ex-140,ey+140);
    image(e,ex-140,ey-140);
    image(e,ex-210,ey+70);
    image(e,ex-210,ey-70);
    image(e,ex-280,ey);
    ex+=5;
    if(ex-280>=640)
    {ex=0;c=0;}
  }
  
  if((fx+25<=tx+38&&fx+25>=tx+3&&fy+25<=ty+38&&fy+25>=ty+3)||(tx+20<=fx+48&&tx+20>=fx+3&&ty+20<=fy+48&&ty+20>=fy+3))
  {image(t,q,w);tx=q;ty=w;if(blood<200){blood+=20;}}
  else{image(t,tx,ty);}
  
  image(f,fx,fy);
  
  fill(255,48,48);
  rect(10, 10, blood, 20);
  image(hp,5,5);
  
  break;
  
  case (3):
  image(e1,0,0);
  if(mouseX<=200+232&&mouseX>=200&&mouseY<=304+42&&mouseY>=304){image(e1,0,0);if(mousePressed){game=2;}}
  else{image(e2,0,0);}
  break;
  }
}

void keyPressed(){
if(key==CODED){
    switch(keyCode){
      case DOWN:
      down = true;
        break;  
      case UP:
      up = true;
      break;
      case RIGHT:
      right = true;
      break;
      case LEFT:
      left = true;
      break;
     }
  }
}

void keyReleased(){
if(key==CODED){
    switch(keyCode){
      case DOWN:
      down = false;
        break;  
      case UP:
      up = false;
      break;
      case RIGHT:
      right = false;
      break;
      case LEFT:
      left = false;
      break;
     }
  }
}
