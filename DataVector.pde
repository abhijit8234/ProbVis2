//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to hold a vector of data sets
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class DataVector {

  Data [] data;
  double minMean, maxMean; 
  double minStdDev, maxStdDev;

  //--- Constructor takes in the vector of data sets ---//
  DataVector(ArrayList<Data> datas) {

    data = datas.toArray(new Data[datas.size()]);

    for (int i = 0; i < data.length; i++) {
      ThreadStatsCalculator tc = new ThreadStatsCalculator(data[i]);
      tc.start();
    }

    // Calculate a histogram
    calculateHistograms(256);

    // Calcualte statistics over all of the data
    calculateStatistics();
  }

  //--- Return the number of data sets in the vector ---//
  int getSize() { 

    return data.length;
  }

  //--- Return the overall data statistics ---//
  double getMinMean() { 
    return minMean;
  }
  double getMaxMean() { 
    return maxMean;
  }

  //--- Return the individual data statistics ---//
  double getMean(int i) { 
    return data[i].getMean();
  }

  //--- Calculate histograms for each of the data sets ---//
  void calculateHistograms(int numBins) {
       for (int i = 0; i < data.length; i++) {
      ThreadHistoCalculator tc = new ThreadHistoCalculator(data[i], numBins);
      tc.start();
    }
  }

  //--- Calculate statistics over all of the data ---//
  void calculateStatistics() {
    println("find vector stats"); 
    // Find the minimum and maximum mean values
    minMean = maxMean = data[0].getMean();
    for (int i = 0; i < data.length; i++) {
      minMean = minMean < data[i].getMean() ? minMean : data[i].getMean();
      maxMean = maxMean > data[i].getMean() ? maxMean : data[i].getMean();
    }
  }
}

// * * * * * Class to find data stats in parallel * * * * * //
class ThreadStatsCalculator extends Thread {
  private Data data;

  ThreadStatsCalculator(Data inData) {
    data = inData;
  }

  public void run() {
    data.calculateStatistics();
  }
}



// * * * * * Class to find histograms in parallel * * * * * //
class ThreadHistoCalculator extends Thread {
  private Data data;
  private int numBins;

  ThreadHistoCalculator(Data inData, int inNumBins) {
    data = inData;
    numBins = inNumBins;
  }

  public void run() {
    data.calculateHistogram(numBins);
  }
}

