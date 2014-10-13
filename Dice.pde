Die[] dice;

void setup()
{
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(26);
  background(35, 200, 255);
  size(500, 500);
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
}
void mousePressed()
{
  for(int i=0; i<dice.length; i++){
    dice[i].roll();
    dice[i].ypos = 0;
    dice[i].rotation=0;
    dice[i].speed=(int)(Math.random()*4+4);
  }
}
class Die //models one single dice cube
{
  int xpos, ypos, value, finalY, speed, rotation;

  Die(int x, int y) //constructor
  {
    xpos=x;
    ypos=0;
    finalY=y;
    value=(int)(Math.random()*6+1);
    speed=(int)(Math.random()*4+4);
    rotation=speed;
  }
  void roll()
  {
    value=(int)(Math.random()*6+1);
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
      }
    }
      pushMatrix();
      translate(xpos, ypos);
      rotate(radians(rotation));
      fill(#BBFF1F);
      rect(0, 0, 100, 100, 8);
      fill(0);
      text(value, 0, 10);
      popMatrix();
  }
}
