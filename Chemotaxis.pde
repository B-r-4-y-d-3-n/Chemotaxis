Walker joe, jeff;
void setup(){
  size(1000,1000);
  joe = new Walker(color(255,0,0));
  jeff = new Walker(color(0,0,255));
  }
void draw(){
  background(152);
  joe.walk();
  joe.show();
  jeff.walk();
  jeff.show();
  if(dist(joe.myX,joe.myY,jeff.myX,jeff.myY)<300)
    joe.myColor = jeff.myColor = color(34,254,123);
}
class Walker{
  int myX, myY, myColor;
  Walker(int y){
    myX = (int)(Math.random()*800)+100;
    myY = (int)(Math.random()*800)+100;
    myColor = y;
  }
  void walk(){
    myX = myX + (int)(Math.random()*3)-1;
    myY = myY + (int)(Math.random()*3)-1;
  }
  void show(){
    fill(myColor);
    ellipse(myX,myY,100,100);
  }
}
