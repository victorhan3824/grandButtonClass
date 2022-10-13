//button class

class Button {
  float x, y, w, h; //shared dimension variables
  boolean clicked; //check whether clicked
  String text; //text variable
  int curve; //rectangle curvature
  int sWeight; //strokeWeight for tactile
  int bType; //determine button type
  PImage bImage; //button image
  color cText, cFill, cBorder;
  
  Button(int T, float X, float Y, float W, float H, int sW) { //basis constructor
  //call on this constructor by function this()
    bType = T; //button type
    x = X; //X coord
    y = Y; //Y coord
    w = W; //Width
    h = H; //Height  
    sWeight = sW; //stroke Weight
  }  
  
  Button(int T, float X, float Y, float W, float H, int sW, int C, color c1, color c2, color c3, String txt) {
    //type 0 button, rectange with color and a text label
    this(T, X, Y, W, H, sW);
    curve = C;
    cText = c1; //text color
    cFill = c2; //fill color
    cBorder = c3; //border color
    clicked = false;
    text = txt;
  }
  
  Button(int T, float X, float Y, float W, float H, int sW, PImage I) { 
    //type 1 button, image with no label, but tactile
    this(T, X, Y, W, H, sW);
    bImage = I;
  }
  
  void show() {
    strokeWeight(this.sWeight);
    if (this.bType == 0) {
      type0Button();  
    } else if (bType == 1) {
      type1Button();  
    } 
    
    checkForClick(); 
  }
  
  void type0Button() {
    stroke(cBorder);
    color textCol = cText;
    color fillCol = cFill;
    if (isHover()) { //when mouse hovers over
      textCol = cFill;
      fillCol = cText;
    } 
    drawButton(fillCol);
    drawLabel(textCol);    
  }
 
  void type1Button() {
    if (isHover()) {
      noFill();
      stroke(white);
      rect(x,y,w,h);
    }
    image(bImage,x,y,w,h);  
  }
  
  void drawButton(color c) {
    fill(c);
    rect(x,y,w,h,curve);
  }
  
  void drawLabel(color c) {
    fill(c);
    textSize(h/3);
    text(text, x, y);
  }
  
  void checkForClick() {
    //check if clicked
    if (this.isHover() && mReleased) clicked = true; 
    else clicked = false;  
  }
  
  boolean isHover() { //check if mouse over the button
    return (mouseX > x-w/2 && mouseX < x+w/2 &&
            mouseY > y-h/2 && mouseY < y+h/2);
  }
}
