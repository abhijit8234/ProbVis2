//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// A tree of button groups
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class ButtonTree {

  int posX, posY;
  ButtonGroup topLevel;
  Map<String, ButtonGroup> secondLevels;
  int padding = 5;

  //--- Constructor takes in the middle of the top level ---//
  ButtonTree(int posXIn, int posYIn) {
    posX = posXIn; 
    posY = posYIn;
    secondLevels = new HashMap();
  }

  //--- Add a top level button group ---//
  void addTopLevel(String [] text) {
    topLevel = new ButtonGroup(posX, posY, text);
    topLevel.positionButtons(int(posX - topLevel.getWidth()*.5), posY);
  }

  //--- Add a second level button group ---//
  void addSecondLevel(String key, String [] text) {
    ButtonGroup second = new ButtonGroup(posX, posY, text);
    second.positionButtons(int(posX - second.getWidth()*.5), posY + topLevel.getHeight() + padding);
    secondLevels.put(key, second);
  }

  //--- Draw the button tree ---//
  void draw() {
    if (topLevel != null)
      topLevel.draw();

    String selected = topLevel.getSelected();
    if (selected != "" && secondLevels.get(selected) != null)
      secondLevels.get(selected).draw();
  }

  //--- Action on mouse pressed ---//
  void mousePressed() {
    topLevel.mousePressed();
    for (String k : secondLevels.keySet()) 
      secondLevels.get(k).mousePressed();
  }

  //--- Return the 'key' button ---//
  TextButton getButton(String key) {

    if (topLevel.hasKey(key))
      return topLevel.getButton(key);

    for (String k : secondLevels.keySet()) 
      if (secondLevels.get(k).hasKey(key))
        return secondLevels.get(k).getButton(key);

    return null;
  }

  //--- Deselect all buttons in the tree ---//
  void deselectAll() {
    topLevel.deselectAll();
    for (String k : secondLevels.keySet()) 
      secondLevels.get(k).deselectAll();
  }
}

