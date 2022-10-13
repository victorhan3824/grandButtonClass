//where I store random stuff

void click() {
  mReleased = false; //set this default to false
  if (mousePressed) wasPressed = true; //detect if you click
  if (wasPressed && !mReleased) {
    mReleased  = true; 
    wasPressed = false;
  }
}
