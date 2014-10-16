Die[] dice;
int total;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(26);
  background(35, 200, 255);
  total=0;
  dice = new Die[3];
  for(int i=0; i<dice.length; i++){
    dice[i] = new Die((width/dice.length)*i+75, 250);
  }
}
void draw()
{
  background(35, 200, 255);
  for(int i=0; i<dice.length; i++){
    dice[i].show();
  }
  if(dice[0].settled==true && dice[1].settled==true && dice[2].settled==true){
    textSize(26);
    text("Total: "+total, width/2, 400);
  }
}
void mousePressed()
{
  for(int i=0; i<dice.length; i++){
    if(i==0){
      total=0;
    }
    dice[i].roll();
    total+=dice[i].value;
    dice[i].ypos = 0;
    dice[i].rotation=0;
    dice[i].speed=(int)(Math.random()*4+4);
  }
}
class Die //models one single dice cube
{
  int xpos, ypos, value, finalY, speed, rotation;
  boolean settled;

  Die(int x, int y) //constructor
  {
    xpos=x;
    ypos=0;
    finalY=y;
    value=(int)(Math.random()*6+1);
    total+=value;
    speed=(int)(Math.random()*4+4);
    rotation=speed;
    settled=false;
  }
  void roll()
  {
    value=(int)(Math.random()*6+1);
    settled=false;
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