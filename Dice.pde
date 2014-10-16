Button[] options = {
  new Button(220, 100, 60, 20, "1 Die"),
  new Button(220, 250, 60, 20, "2 Dice"),
  new Button(220, 400, 60, 20, "3 Die")};
Boolean started;
Die[] dice;
int total;

void setup()
{
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(26);
  background(35, 200, 255);
  size(500, 500);
  total=0;
  started=false;
}
void draw() {
  background(35, 200, 255);
  if(started==true){
    for(int i=0; i<dice.length; i++){
      dice[i].show();
    }
    if(dice[0].settled==true){
      textSize(26);
      text("Total: "+total, width/2, 400);
    }
  } else {
    for(int i=0; i<options.length; i++) {
      options[i].show();
      options[i].checkForMouse();
      if(options[i].clicked==true){
        dice = new Die[i+1];
        for(int c=0; c<dice.length; c++){
          dice[c] = new Die((500/(dice.length+1))*(c+1), 250);
        }
      }
    }
  }
}
void mousePressed()
{
  total=0;
  if(started==true){
    for(int i=0; i<dice.length; i++){
      dice[i].roll();
      dice[i].ypos = 0;
      dice[i].rotation=0;
      dice[i].speed=(int)(Math.random()*4+4);
    }
  }
}
class Die //models one single dice cube
{
  int xpos, ypos, value, finalY, speed, rotation;
  boolean settled;

  Die(int x, int y) //constructor
  {
    settled=false;
    xpos=x;
    ypos=0;
    finalY=y;
    value=(int)(Math.random()*6+1);
    speed=(int)(Math.random()*4+4);
    rotation=speed;
    total+=value;
  }
  void roll()
  {
    value=(int)(Math.random()*6+1);
    settled=false;
    total+=value;
  }
  void show()
  {
    if(ypos<finalY){
      ypos+=speed;
      rotation+=speed;
    } else {
      if(rotation<-3){
        rotation+=5;
      } else if(rotation>3){
        rotation-=5;
      } else if(rotation>-3 && rotation<3){
        rotation=0;
        settled=true;
      }
    }
      pushMatrix();
      translate(xpos, ypos);
      rotate(radians(rotation));
      fill(187, 255, 31);
      rect(0, 0, 100, 100, 8);
      fill(0);
      switch(value){
        case 1:
          ellipse(0, 0, 15, 15);
          break;
        case 2:
          ellipse(0, -25, 15, 15);
          ellipse(0, 25, 15, 15);
          break;
        case 3:
          ellipse(-25, -25, 15, 15);
          ellipse(0, 0, 15, 15);
          ellipse(25, 25, 15, 15);
          break;
        case 4:
          ellipse(-25, -25, 15, 15);
          ellipse(-25, 25, 15, 15);
          ellipse(25, -25, 15, 15);
          ellipse(25, 25, 15, 15);
          break;
        case 5:
          ellipse(-25, -25, 15, 15);
          ellipse(-25, 25, 15, 15);
          ellipse(25, -25, 15, 15);
          ellipse(25, 25, 15, 15);
          ellipse(0, 0, 15, 15);
          break;
        case 6:
          ellipse(-25, -25, 15, 15);
          ellipse(-25, 25, 15, 15);
          ellipse(25, -25, 15, 15);
          ellipse(25, 25, 15, 15);
          ellipse(-25, 0, 15, 15);
          ellipse(25, 0, 15, 15);
          break;
      }
      popMatrix();
  }
}


class Button {
  int x, y, len, wid;
  String value;
  boolean clicked;
  Button(int xpos, int ypos, int len1, int wid1, String val){
    x=xpos;
    y=ypos;
    len=len1;
    wid=wid1;
    value = val;
    clicked=false;
  }
  void show(){
    strokeWeight(1);
    textAlign(CENTER);
    textSize(16);
    stroke(0);
    fill(#D3E3DF);
    rectMode(CORNER);
    rect(x, y, len, wid, 4);
    fill(0);
    text(value, x+wid/2*3, y+15);
    rectMode(CENTER);
  }
  Boolean checkForMouse(){
    if(mousePressed==true){
      if(mouseX>x && mouseX<x+len && mouseY>y && mouseY<y+wid){
        clicked=true;
        started=true;
      } else {
        clicked=false;
      }
    }
    return clicked;
  }
}