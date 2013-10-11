//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to draw a colormapped mesh
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class Mesh {

  color   [] colors;     // The colors at each vertex
  PVector [] vertices;   // The vertex geometries
  PVector [] triangles;  // The connected vertices
  boolean drawWireframe; // Flag to turn wireframe on/off

    //--- Constructor takes in points and connectivity ---//
  Mesh(PVector [] points, PVector [] connectivity) {
    drawWireframe = false;
    vertices = points;
    triangles = connectivity;
  }

  //--- Constructor takes in points, connectivity, and color ---//
  Mesh(PVector [] points, PVector [] connectivity, color [] rgbs) {
    drawWireframe = false;
    vertices = points;
    triangles = connectivity;
    colors = rgbs;
  }

  //--- Set the colors ---//
  void setColors(color[] rgbs) {
    colors = rgbs;
  }

  //--- Draw the mesh ---//
  void draw() {
    if (colors == null || colors.length == 0)
      drawWireframe = false;
  
    beginShape(TRIANGLES);
    if(drawWireframe)
       stroke(0); 
    else
      noStroke();
    
    for (int i = 0; i < triangles.length; i++) {
      int idx1 = int(triangles[i].x);
      fill(colors[idx1]);
      vertex(vertices[idx1].x, vertices[idx1].y, vertices[idx1].z);

      int idx2 = int(triangles[i].y);
      fill(colors[idx2]);
      vertex(vertices[idx2].x, vertices[idx2].y, vertices[idx2].z);

      int idx3 = int(triangles[i].z);
      fill(colors[idx3]);
      vertex(vertices[idx3].x, vertices[idx3].y, vertices[idx3].z);
    }
    endShape();
  }
}

