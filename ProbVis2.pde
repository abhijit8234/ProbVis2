//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
//        ____  ____  _____  ____  _  _  ____  ___    ___         //
//       (  _ \(  _ \(  _  )(  _ \( \/ )(_  _)/ __)  (__ \        //
//        )___/ )   / )(_)(  ) _ < \  /  _)(_ \__ \   / _/        // 
//       (__)  (_)\_)(_____)(____/  \/  (____)(___/  (____)       //
//                                                                //
//                  Written by Kristi Potter 2013                 //
//                       University of Oregon                     //
//                     kpotter@cas.uoregon.edu                    //
// Tool for comparing and exploring Probability Density Functions //
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
import processing.opengl.*;
import javax.media.opengl.GL;
import javax.media.opengl.GL2;

MouseTransforms mouseTransforms;
UserInterface userInterface;
DataMesh dataMesh;

//--- Setup the scene ---//
void setup() {

  // set the size and the renderer
  size(1000, 1000, OPENGL);

  // initialize the mouse transforms
  mouseTransforms = new MouseTransforms();

  // initialize the user interface
  userInterface = new UserInterface();
}

//--- Draw the scene ---//
void draw() {

  background(204);

  // push the mouse transforms
  pushMatrix();
  mouseTransforms.transform();

  // draw the mesh
  if (dataMesh != null)
    dataMesh.draw();

  // pop the mouse transforms
  popMatrix();

  // draw the user interface
  userInterface.draw();
}

//--- Mouse pressed events ---//
void mousePressed() {

  // forward to the mouse transforms
  mouseTransforms.mousePressed();

  // forward to the user interface
  userInterface.mousePressed();
}

//--- Mouse dragged events ---//
void mouseDragged() {

  // forward to the mouse transforms
  mouseTransforms.mouseDragged();
}

//--- Key pressed events ---//
void keyPressed() {

  // forward to the mouse transforms
  mouseTransforms.keyPressed();
}  

//--- Key released events ---//
void keyReleased() {

  // forward to the mouse transforms
  mouseTransforms.keyReleased();
}

//--- Mouse released events ---//
void mouseReleased() {

  // forward to the mouse transforms
  mouseTransforms.mouseReleased();
}

//--- Action to take when a folder is selected ---//
void folderSelectedAction(File selection) {

  // if we have a selection, create a new data reader and mesh
  if (selection != null) {
    DataReader dataReader = new DataReader(selection.getAbsolutePath());  
    dataMesh = new DataMesh(new Mesh(dataReader.readGeometry(), dataReader.readConnectivity()), new DataVector(dataReader.readData()));
    dataMesh.colormapMesh();
    userInterface.deselectAll();
  }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
//                      Static Functions                          //
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

//--- Change the range of x from (i,I) to (o,O) ---//
static double changeRange(double i, double x, double I, double o, double O) {
  if (i == I ) return o;
  else return (O - o)*(x - i)/(I - i) + o;
}
static float changeRange(float i, float x, float I, float o, float O) {
  if (i == I ) return o;
  else return (O - o)*(x - i)/(I - i) + o;
}
static int changeRange(int i, int x, int I, int o, int O) {
  if (i == I ) return o;
  else return (O - o)*(x - i)/(I - i) + o;
}

