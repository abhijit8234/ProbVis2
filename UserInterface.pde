//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// The user interface control of the program
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class UserInterface {

  // The tree of buttons
  ButtonTree buttonTree;

  // The view, data, stats button group
  String [] topTexts = { 
    "data", "view", "stats"
  };
  String [] dataTexts = {
    "select folder"
  };
  String [] viewTexts = {
    "mesh on/off", "overlay on/off", "reset camera"
  };
  String [] statsTexts = {
    "change difference measure", "change number of bins", "change distribution"
  };

  //--- Constructor ---//
  UserInterface() {
    buttonTree = new ButtonTree(int(width*.5), 10);
    buttonTree.addTopLevel(topTexts);
    buttonTree.addSecondLevel(topTexts[0], dataTexts);
    buttonTree.addSecondLevel(topTexts[1], viewTexts);
    buttonTree.addSecondLevel(topTexts[2], statsTexts);
  }

  //--- Draw the user interface ---//
  void draw() {
    buttonTree.draw();
  }

  //--- Mouse pressed events ---//
  void mousePressed() {

    // forward mouse pressed to the tree
    buttonTree.mousePressed();

    // check if the data button was pushed
    if (buttonTree.getButton("select folder").buttonOver()){
      selectFolder("Select a folder to process:", "folderSelectedAction");
    }
  }
  
  //--- Deselect all UI buttons ---//
  void deselectAll(){
      buttonTree.deselectAll();
  }
  
}

