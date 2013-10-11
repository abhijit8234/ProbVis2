//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to read in a folder with the data
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class DataReader {
  String _folderPath;

  //--- Constructor sets the folder path for the data ---//
  DataReader(String folderPath) { 
    _folderPath = folderPath;
  }

  //-- Read in the geometry, return the points ---//
  PVector [] readGeometry() {
    String filename = _folderPath+"/geometry.txt";
    String lines[] = loadStrings(filename);
    int numPts = lines.length;
    PVector [] geometry = new PVector[numPts];
    for (int i = 0; i < numPts; i++) {
      String[] pieces = splitTokens(lines[i]);
      geometry[i] = new PVector(float(pieces[0]), float(pieces[1]), float(pieces[2]));
    }
    return geometry;
  }

  //--- Read in the connectivity, return the connections --//
  PVector [] readConnectivity() {
    String filename = _folderPath+"/connectivity.txt";
    String lines[] = loadStrings(filename);
    int numTris = lines.length;
    PVector [] connect = new PVector[numTris];
    for (int i = 0; i < numTris; i++) {
      String[] pieces = splitTokens(lines[i]);
      connect[i] = new PVector(int(float(pieces[0])), int(float(pieces[1])), int(float(pieces[2])));
    }
    return connect;
  }

  //--- Read in the data values, return a vector of Data objects ---//
  ArrayList<Data> readData() {
    print("Reading in data...");
    ArrayList<Data> data = new ArrayList<Data>();
    // create a reader
    BufferedReader reader = createReader(_folderPath+"/data.txt");
    // read in the data line by line
    String line = "";
    while (line != null) {
      try {       
        line = reader.readLine();
        //print(".");
      } 
      catch (IOException e) {
        e.printStackTrace();
        line = null;
      }   
      // if we have data...
      if (line != null) {    
        // split the line based on whitespace
        String slist[] = split(trim(line), ' ');
        double list[] = new double[slist.length];   
        // convert each token in the list to a double
        int i=0;
        for (String s:slist) {
          list[i] = Double.parseDouble(s);
          i++;
        }
        data.add(new Data(list));
      }
    }
    println("...done.");
    return data;
  }
}

