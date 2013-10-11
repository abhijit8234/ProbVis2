//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// A text button
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TextButton {
  int     rectX, rectY;                    // Position of square button
  int     textX, textY;                    // Position of text inside button
  int     rectW, rectH;                    // The width & height of the rectangle
  int     textW, textH;                    // The width & height of the text
  color   rectColor, textColor;            // The color of the rectangle and text
  color   rectDefault, textDefault;        // The default color of the rectangle & text
  color   textHighlight, rectHighlight;    // The highlight color of the rectangle & text
  color   textSelected, rectSelected;      // The selected color of the rectangle & text
  color   strokeColor, strokeDefault;      // The current and default stroke color
  color   strokeHighlight, strokeSelected; // The highlighted and selected stroke color
  boolean buttonOver = false;              // State of the mouse over
  boolean selected = false;                // State of selection
  String  text;                            // The text of the button
  PFont   font;                            // The button'sfont
  int     fontSize;                        // The size of the font;
  int     padding;                         // Padding for the rectangle

  //--- Constructor takes in the text and a position ---//
  TextButton(String inText, int posX, int posY) {

    // save the text
    text = inText;

    // Create the font for this button 
    createButtonFont("HelveticaNeue", 24);

    // Calculate the dimensions of the text
    textW = int(textWidth(text));
    textH = int(textAscent() + textDescent());

    // set the position of the button
    setPosition(posX, posY);  

    // Calculate the dimension of the rectangle
    rectW = textW + padding*2;
    rectH = textH;

    // Set the colors of the rectangle  
    rectDefault = color(165);
    rectHighlight = color(170);
    rectSelected = color(155);
    rectColor = rectDefault;

    // Set the colors of the stroke
    strokeDefault = color(165);
    strokeHighlight = color(25);
    strokeSelected = color(25);
    strokeColor = strokeDefault;

    // Set the color of the text
    textDefault = color(75);
    textHighlight = color(50);
    textSelected = color(50);
    textColor = textDefault;
  }

  //--- Create the font for this button ---//
  void createButtonFont(String inFont, int inFontSize) {
    fontSize = inFontSize;
    padding = int(fontSize*.25); 
    font = createFont(inFont, fontSize);
    textFont(font);
  }

  //--- Draw the folder selection button ---//
  void draw() {

    // Update the state of the mouse over the button
    update(mouseX, mouseY);

    // Draw the rectangle
    stroke(strokeColor);
    fill(rectColor);
    rect(rectX, rectY, rectW, rectH, 7);

    // Draw the text
    fill(textColor);
    textMode(SHAPE);
    text(text, textX, textY);
  }

  //--- Mouse pressed triggers selection ---//
  void mousePressed() {
    if (buttonOver)
      setSelected(!selected);
  }

  //--- Update the mouse over button state ---//
  void update(int x, int y) {
    if ( overButton(rectX, rectY, rectW, rectH) ) {
      buttonOver = true;
      rectColor = rectHighlight;
      textColor = textHighlight;
      strokeColor = strokeHighlight;
    } 
    else {
      // reset the button over
      buttonOver = false;

      // set the button color based on the selection state
      if (selected) {
        rectColor = rectSelected;
        textColor = textSelected;
        strokeColor = strokeSelected;
      }
      else {
        rectColor = rectDefault;
        textColor = textDefault;
        strokeColor = strokeDefault;
      }
    }
  }

  //--- Check if the mouse is over the button ---//
  boolean overButton(int x, int y, int width, int height) {
    if (mouseX >= x && mouseX <= x+rectW && 
      mouseY >= y && mouseY <= y+rectH) {
      return true;
    } 
    else {
      return false;
    }
  }

  //--- Return the mouse over button state ---//
  boolean buttonOver() { 
    return buttonOver;
  }

  //--- Get the width of the button ---//
  int getWidth() {
    return rectW;
  }

  //--- Get the height of the button ---//
  int getHeight() {
    return rectH;
  }

  //--- Set the position of the button ---//
  void setPosition(int posX, int posY) {
    // Calculate the positions of the text 
    textX = posX + padding;
    textY = posY + fontSize - int(textDescent()*.25);

    // Calculate the position of the rectangle
    rectX = posX;
    rectY = posY;
  }

  //--- Set the selected flag ---//
  void setSelected(boolean selectedIn) {
    selected = selectedIn;
  }

  //--- Get the selected flag ---//
  boolean getSelected() {
    return selected;
  }
}

