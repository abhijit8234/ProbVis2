//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to manage a wireframe mesh, a color mesh, and a data vector
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class DataMesh {

  Mesh mesh;
  DataVector dataVector;
  double minColorValue, maxColorValue;  

  Colormap colormap;
  ColormapFactory colormapFactory;

  DataMesh(Mesh inMesh, DataVector inDataVector) {
    mesh = inMesh;
    dataVector = inDataVector;
  }

  //--- Draw the wireframe and color meshes ---//
  void draw() {

    if (mesh != null)
      mesh.draw();
  }

  //--- Colormap the color mesh ---//
  void colormapMesh() {
   
    colormapFactory = new BlueRedColormapFactory((float)dataVector.getMinMean(), (float)dataVector.getMaxMean());
    colormap = colormapFactory.getColormap();
    color [] meanColors = new color[dataVector.getSize()];
    
    for(int i = 0; i < dataVector.getSize(); i++){
       meanColors[i] = colormap.getColor((float)dataVector.getMean(i));
    }
    mesh.setColors(meanColors);
  }
}

