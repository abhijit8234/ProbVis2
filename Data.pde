//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to hold a data set that is a vector of doubles
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class Data {

  double [] data;
  double mean; 
  double stdDev;
  double min; 
  double max;
  double [] histogram;
  double minDense;
  double maxDense;
  boolean statsFound = false;

  //--- Pass in the new data ---//
  Data(double [] datas) {
    data = datas;
  }

  //--- Return the statistics ---//
  double getMean() { 
    return mean;
  }
  double getStdDev() { 
    return stdDev;
  }

  //--- Calcuate the standard deviaton and histogram ---//
  void calculateHistogram(int numBins) {

    // Make sure the mean/min/max/std dev have been calculated
    if (!statsFound)
      calculateStatistics();

    histogram = new double[numBins];

    // Count the number of data vals that fall in each bin
    for (int i = 0; i < data.length; i++) {  

      double findex = changeRange(min, (double)data[i], max, 0.0d, (double)(numBins-1));
      int index = (int)Math.floor(findex);
      histogram[index] ++;
    }

    // Normalize the count
    for (int i = 0; i < numBins; i++) {          
      if (min == max) histogram[i] = 1.0/(numBins);
      else           histogram[i] = histogram[i]/(data.length);
    }
    histogram[numBins-1] = histogram[numBins-2];

    // Get the min/max densities
    minDense = maxDense = histogram[0];
    for (int i = 0; i < numBins; i++) {
      minDense = minDense < histogram[i] ? minDense : histogram[i];
      maxDense = maxDense > histogram[i] ? maxDense : histogram[i];
    }
  }

  //--- Find min, max, mean, & std dev of each of the data sets ---//
  void calculateStatistics() {
    //println("find data stats");

    // initialize
    mean = stdDev = 0.0;
    min = max = data[0];

    // find the min/max and mean 
    for (int i = 0; i < data.length; i++) {
      min = min < data[i] ? min : data[i];
      max = max > data[i] ? max : data[i];
      mean += data[i];
    }
    mean /= data.length;
    if (min == max) mean = min;

    // find the std dev
    for (int i = 0; i < data.length; i++) {
      stdDev += (data[i]-mean)*(data[i]-mean);
    }
    stdDev = Math.sqrt( stdDev/(data.length-1) );

    statsFound = true;
  }
}

