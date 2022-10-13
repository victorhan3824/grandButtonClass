
//color pallette
color blue   = #28E7ED;
color green  = #00F201;
color pink   = #F76DDC;
color yellow = #FFF387;
color black  = #000000;
color white  = #FFFFFF;

//button related variables
Button myButtons[] ;

boolean mReleased, wasPressed;

//other variables
color backgrd;
PImage image;

void setup() {
  size(700 ,700);  
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  //other variables
  backgrd = color(169);
  image = loadImage("dKey.png");
 
  //initializ buttons
  myButtons = new Button[4];
  myButtons[0] = new Button(0, width/4, 150, 150, 100, 3, 5, pink, blue, black, "Blue");
  myButtons[1] = new Button(0, width/4, 275, 150, 100, 1, 10, yellow,green,black,"Green");
  myButtons[2] = new Button(1, width*0.6, 250, 300, 300, 15, image);
  myButtons[3] = new Button(0, width/2, 500, 500, 150, 2, 50, blue, pink, black, "Pink");
}

void draw() {
  background(backgrd);
  click();
  strokeWeight(3);
  
  for (int i=0; i<4;i++) {
    Button bN = myButtons[i];
    bN.show();
    if (bN.clicked) {
      if (bN.bType == 0) backgrd = bN.cFill;
      if (bN.bType == 1) backgrd = color(169);
    }
  }
}
