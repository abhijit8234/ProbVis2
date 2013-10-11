//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// A button group that allows only 1 to be selected
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
import java.util.Map;
import java.util.Set;
import java.util.Iterator;

class ButtonGroup {

  // the hashmap of buttons in this group
  Map<String, TextButton> buttons;

  // the padding between buttons
  int padding = 10;

  // the selected button
  String selected = "NONE";

  //--- Cosntructor takes in an intial position and a list of text
  ButtonGroup(int posX, int posY, String [] buttonTexts) {

    // create a button for each text
    buttons = new HashMap(buttonTexts.length);
    for (int i = 0; i < buttonTexts.length; i++) {
      buttons.put(buttonTexts[i], new TextButton(buttonTexts[i], posX, posY));
    }
    positionButtons(posX, posY);
  }

  //--- Draw the button group ---//
  void draw() {
    for (String key : buttons.keySet())
      buttons.get(key).draw();
  }

  //--- Mouse pressed action ensures only 1 button selected ---//
  void mousePressed() {

    // find which button was selected
    String tmpSelected = "";
    for (String key : buttons.keySet()) {
      if (buttons.get(key).buttonOver())
        selected = key;
    }

    // unselect all buttons, except the selected
    if (selected != "NONE") {
      for (String key : buttons.keySet())
        buttons.get(key).setSelected(false);
      buttons.get(selected).setSelected(true);
    }
  }

  //--- Position the buttons ---//
  void positionButtons(int posX, int posY) {

    // position each button    
    int currentX = posX;
    int currentY = posY;
    Object [] keySet = buttons.keySet().toArray();
    for (int i = 0; i < keySet.length; i++) {    
      buttons.get(keySet[i].toString()).setPosition(currentX, currentY);
      currentX += buttons.get(keySet[i].toString()).getWidth() + padding;
    }
  }

  //--- Return a specific button ---//
  TextButton getButton(String key) {
    return buttons.get(key);
  }

  //--- Get the width of a button ---//
  int getButtonWidth(String key) {
    return buttons.get(key).getWidth();
  }

  //--- Get the height of the button group ---//
  int getHeight() {
    Iterator iter = buttons.keySet().iterator();
    String key = iter.next().toString();
    return buttons.get(key).getHeight();
  }

  //--- Get the width of the button group ---//
  int getWidth() {
    int width = padding;
    for (String key : buttons.keySet()) 
      width += buttons.get(key).getWidth() + padding;
    return width;
  }

  //--- Return the selected button ---//
  String getSelected() { 
    return selected;
  }

  //--- Deselect all buttons in group ---//
  void deselectAll() {
    selected = "NONE";
    for (String key : buttons.keySet())   
      buttons.get(key).setSelected(false);
  }

  //--- Check if this group has a button key ---//
  boolean hasKey(String key) {
    return buttons.containsKey(key);
  }
}

