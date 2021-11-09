Walker joe, jeff, jason;
void setup(){
  size(1000,1000);
  joe = new Walker(color(255,0,0));
  jeff = new Walker(color(0,0,255));
  jason = new Walker(color(0,255,0));
  }
void draw(){
  background(152);
  joe.walk();
  joe.show();
  jeff.walk();
  jeff.show();
  jason.walk();
  jason.show();
  if(dist(joe.myX,joe.myY,jeff.myX,jeff.myY)<200)
    jason.myColor = joe.myColor = jeff.myColor = color(34,254,123);
}
class Walker{
  int myX, myY, myColor;
  Walker(int y){
    myX = (int)(Math.random()*300)+100;
    myY = (int)(Math.random()*300)+100;
    myColor = y;
  }
  void walk(){
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }
  void show(){
    fill(myColor);
    ellipse(myX,myY,50,50);
  }
}
