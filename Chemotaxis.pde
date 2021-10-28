PImage img, img2, img3;
Walker [] oldPplHome = new Walker [10];
int mySizeX = 100;
int mySizeY = 75;
int time = 0;
int time2 = 0;
int time3 = 0;
boolean eaten1 = false;
boolean eaten2 = false; 
boolean eaten3 = false; 
boolean eaten4 = false;
float health = 3;
color c1 = color(255, 255, 255);
void setup() {
  size(1000, 1000);
  frameRate(100);
  img = loadImage("Pizza_Full.png");
  img2= loadImage("Pizza_Half.png");
  img3= loadImage("Pizza_fourth.png");
  for (int i=0; i<10; i++) {
    oldPplHome[i] = new Walker();
  }
}
void draw() {
  background(59, 183, 237);
  textSize(50);
  fill(255);
  noStroke();
  text( "Time Survived: "+millis()/1000, 16, 55);
  text("Lives:",694,54);
  image(img, 894, 12, 41,40);
  image(img, 942, 12, 41,40);
  image(img, 846, 12, 41,40);
  
  
  for (int i = 0; i < oldPplHome.length; i++) { //choosing between each type of pizza
  if (eaten1==false&&eaten2==false) { //if both "bites" are false 
      image(img, mouseX-20, mouseY-20, 41, 40);
    }
    if (dist(oldPplHome[i].myX, oldPplHome[i].myY, mouseX, mouseY) <= 20 && eaten1==false) {
      eaten1=true;
      time = millis();
      health=3;
    }
    if (eaten1 == true && eaten2 == false) {
      image(img2, mouseX-20, mouseY-20, 41, 40);
      fill(59, 183, 237);
      rect( 846, 12, 41,40);
      //rect( 894, 12, 41,40);
      //rect(942, 12, 41,40);
    }
    
    if (dist(oldPplHome[i].myX, oldPplHome[i].myY, mouseX, mouseY) <= 20 && eaten1==true && millis()-time>=4000 && eaten2 == false) {
      eaten2=true;
      time2 = millis();
      health =2;

    }
    if (eaten2 == true && eaten3 == false) {
      image(img3, mouseX-20, mouseY-20, 41, 40);
      fill(59, 183, 237);
      rect( 846, 12, 41,40);
      rect( 894, 12, 41,40);
    }
  }
     for (int i = 0; i< 10; i++) { //blob walks and shows 

    oldPplHome[i].walk();
    oldPplHome[i].show();
  }
    for (int i = 0; i < oldPplHome.length; i++) {
   if (dist(oldPplHome[i].myX, oldPplHome[i].myY, mouseX, mouseY) <= 20 && eaten2==true && millis()-time2>=4000) {
      eaten3=true;
    }
    if (eaten3 == true) {
      noLoop();
      background(0);
       fill(255);
      text("GAME OVER", 350, 500, 500);
      text("You Survived " +millis()/1000+ " Seconds!", 200,50,50);
    }
  }
   

  for (int i = 0; i < oldPplHome.length; i++) {
    if (dist(oldPplHome[i].myX, oldPplHome[i].myY, mouseX, mouseY) <= 20) { //blob expands
      oldPplHome[i].expands();
      oldPplHome[i].random = 6;
    }
    }
  
 
  
    //for (int i = 0; i < oldPplHome.length; i++) {
    // if (dist(oldPplHome[i].myX, oldPplHome[i].myY, mouseX, mouseY) <= 20 || eaten1==true && time>=3000) { //if it eats again, eaten2 == true;
    //  eaten2=true;
    //}
    // if (dist(oldPplHome[i].myX, oldPplHome[i].myY, mouseX, mouseY) <= 20 && (millis()-time) >= 3000) {
    //oldPplHome[i].expands();
    // oldPplHome[i].random = 6;
    // }
    // }
    //}
  }
  class Walker
  {
    int myX, myY;
    float x, y;
    float random; 
    Walker()
    {

      myX=(int)(Math.random()*1000);
      myY=(int)(Math.random()*1000);
      x=30;
      y=30;
      random=4;
    }
    void walk()
    {
      if (mouseX>=myX) {
        myX=myX+(int)(Math.random()*random);
      } else {
        myX-=(int)(Math.random()*random);
      }
      if (myY<0) {
        myY=0;
      }
      if (mouseY>myY) {
        myY=myY+(int)(Math.random()*random);
      } else {
        myY-=(int)(Math.random()*random);
      }
      if (myY<0) {
        myY=0;
      }
      random*=1.0001;
    }
    void show()
    {

      fill(c1);
      strokeWeight(2);
      ellipse(myX, myY, x, y);
    }
      
    }
  

  }
