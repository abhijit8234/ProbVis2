//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to control the mouse transforms
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class MouseTransforms {

  float prevMouseX, prevMouseY;
  boolean translateOn;
  float translateX, translateY, translateZ;
  boolean rotateXOn, rotateYOn;
  float rotateX, rotateY;
  boolean shiftPressed, tabPressed;

  //--- Constructor initializes the transformations ---//
  MouseTransforms() {
    setHome();
  }

  //--- Set the default (home) transformations ---//
  void setHome() {
    translateX = translateY = translateZ = 0;
    rotateX = rotateY = 0;
    rotateXOn = rotateYOn = false;
    shiftPressed = tabPressed = false;
  }

  //--- Make the transformation calls ---//
  void transform() {
    translate(width*.5, height*.5);
    translate(translateX, translateY, translateZ);  
    rotate(radians(rotateX), 0, 1, 0);
    rotate(radians(rotateY), 1, 0, 0);
  }

  //--- Action to take on mouse pressed ---//
  void mousePressed() {
    prevMouseX = mouseX;
    prevMouseY = mouseY;

    if (mouseButton == RIGHT) 
      rotateXOn = rotateYOn = true;
  }

  //--- Action to take on mouse dragged ---//
  void mouseDragged() {

    // translate on left mouse button 
    if (mouseButton == LEFT) {
      translateX +=  mouseX - prevMouseX;
      translateY +=  mouseY - prevMouseY;
    }

    // rotate on right mouse button 
    if (mouseButton == RIGHT) {
      if (shiftPressed)
        rotateXOn = false;
      if (tabPressed)
        rotateYOn = false;

      if ( rotateXOn )
        rotateX   += mouseX - prevMouseX;

      if ( rotateYOn)
        rotateY -= mouseY - prevMouseY;
    }
    
    // zoom on middle mouse button
    if(mouseButton == CENTER)
       translateZ +=  (mouseX - prevMouseX) + (mouseY - prevMouseY);

    // save the current mouse pos as the previous
    prevMouseX = mouseX;
    prevMouseY = mouseY;
  }


  //--- Action to take on key pressed events ---//
  void keyPressed() {

    // h key resets viewing
    if (key == 'h') 
      setHome();

    // shift key restricts rotation to Y axis
    if (key == CODED && keyCode == SHIFT) 
      shiftPressed = true;

    // tab key restricts rotation to X axis
    if (key == TAB)
      tabPressed = true;
  }  

  //--- Action to take on key released events ---//
  void keyReleased() {
    shiftPressed = tabPressed = false; 
    rotateXOn = rotateYOn = true;
  }

  //--- Action to take on mouse released events ---//
  void mouseReleased() {
    rotateXOn = rotateYOn = false;
  }
}

