//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Class to colormap data
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class Colormap {

  String  _name;
  float   _min, _max;
  boolean _changeRange = false;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor 
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  Colormap(String name, float min, float max) { 
    _name = name; 
    setRange(min, max);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default range)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  Colormap(String name) { 
    this(name, 0.0, 1.0); 
    _changeRange = false;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default everything)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  Colormap() { 
    this("DEFAULT");
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Copy constructor
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  Colormap copy() { 
    return new Colormap(_name, _min, _max);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Getters/Setters
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  void   setRange(float min, float max) { 
    _min = min; 
    _max = max; 
    _changeRange = true;
  }
  float  getRangeMin() { 
    return _min;
  }
  float  getRangeMax() { 
    return _max;
  }
  String getName() { 
    return _name;
  }
  void   printName() { 
    println(_name);
  }
  void   printRange() { 
    println("[" + _min + ", " + _max + "]");
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Get the color
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColor(float value) {
    // Make the range of the data between 0 and 1
    float newVal;
    if (_changeRange) newVal = changeRange(_min, value, _max, 0.0, 1.0);
    else             newVal = value;

    if (_max-_min < 0.00001) newVal = 0.5;
    return getColorDef(newVal);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Define colormap (override this function) 0<=value<=1
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColorDef(float value) { 
    return color(0, 0, 255);
  }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// A two-color colormap
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TwoColormap extends Colormap {
  // The two colors to map through
  color _colorLow;
  color _colorHigh;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor 
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoColormap(String name, color cL, color cH, float min, float max) {  
    super(name, min, max); 
    _colorLow = cL; 
    _colorHigh = cH;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default range)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoColormap(String name, color cL, color cH) { 
    this(name, cL, cH, 0.0, 1.0);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default everything)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoColormap() { 
    this(new String("TWOCOLOR"), color(0, 0, 0), color(255, 255, 255));
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Copy constructor
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoColormap copy() { 
    return  new TwoColormap(_name, _colorLow, _colorHigh, _min, _max);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Get the colors
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColorLow() { 
    return _colorLow;
  }
  color getColorHigh() { 
    return _colorHigh;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Get the color
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColorDef(float value) {
    if (_max-_min < 0.00001) value = 0.5;
    return lerpColor(_colorLow, _colorHigh, value);
  }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// A three-color colormap
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class ThreeColormap extends TwoColormap {
  // The third color to map through
  color _colorMid;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor 
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  ThreeColormap(String name, color cL, color cM, color cH, float min, float max) { 
    super(name, cL, cH, min, max); 
    _colorMid = cM;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default range)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  ThreeColormap(String name, color cL, color cM, color cH) { 
    this(name, cL, cM, cH, 0.0, 1.0);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default everything)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  ThreeColormap() { 
    this(new String("THREECOLOR"), color(0, 103, 204), color(204, 204, 0), color(210, 41, 5));
  }  

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Copy constructor
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  ThreeColormap copy() { 
    return new ThreeColormap(_name, _colorLow, _colorMid, _colorHigh, _min, _max);
  } 

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Get the color
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColorDef(float value) {
    color col;
    if (value < 0.5)  col = lerpColor(_colorLow, _colorMid, value*2.0);
    else            col = lerpColor(_colorMid, _colorHigh, (value-0.5)*2.0);
    return col;
  }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// An HSV colormap
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class HSVColormap extends Colormap {
  float _h1, _h2;
  float _s1, _s2;
  float _v1, _v2;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor 
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  HSVColormap(String name, float h1, float h2, float s1, float s2, float v1, float v2, float min, float max) { 
    super(name, min, max); 
    _h1 = h1; 
    _h2 = h2; 
    _s1 = s1; 
    _s2 = s2; 
    _v1 = v1; 
    _v2 = v2;
  }    

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default range)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  HSVColormap(String name, float h1, float h2, float s1, float s2, float v1, float v2) { 
    this(name, h1, h2, s1, s2, v1, v2, 0.0, 1.0);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default everything)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  HSVColormap() { 
    this("HSV", 0.0, 360.0, 1.0, 1.0, 1.0, 1.0) ;
  } 

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Copy constructor
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  HSVColormap copy() { 
    return new HSVColormap(_name, _h1, _h2, _s1, _s2, _v1, _v2, _min, _max);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Set the hue
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  void setHue(float h1, float h2) { 
    _h1 = h1; 
    _h2 = h2;
  }
  float getHue1() { 
    return _h1;
  } 
  float getHue2() { 
    return _h2;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Set the saturation
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  void setSat(float s1, float s2) { 
    _s1 = s1; 
    _s2 = s2;
  }
  float getSat1() { 
    return _s1;
  } 
  float getSat2() { 
    return _s2;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Set/Get the value
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  void setVal(float v1, float v2) { 
    _v1 = v1; 
    _v2 = v2;
  }
  float getVal1() { 
    return _v1;
  } 
  float getVal2() { 
    return _v2;
  }


  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Define colormap (override this function) 0<=value<=1
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColorDef(float value) {
    float newHue = (1.0-value)*_h1 + (value)*_h2;
    float newSat = (1.0-value)*_s1 + (value)*_s2;
    float newVal = (1.0-value)*_v1 + (value)*_v2;
    return hsv2rgb(newHue, newSat, newVal);
  }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// 2D colormap - default behavior interpolates between colors
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TwoDimensionalColormap extends Colormap {
  ColormapFactory _one, _two;
  float _min2, _max2;

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor 
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimensionalColormap(String name, ColormapFactory one, ColormapFactory two, float min1, float max1, float min2, float max2) { 
    super(name, min1, max1); 
    _min2 = min2; 
    _max2 = max2; 
    _one = one; 
    _two = two;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default range)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimensionalColormap(String name, ColormapFactory one, ColormapFactory two) { 
    this(name, one, two, 0.0, 1.0, 0.0, 1.0);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default everything)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimensionalColormap() { 
    this("2D-DEFAULT", new HueColormapFactory(), new ValueColormapFactory());
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (set name)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimensionalColormap(String name) { 
    this(name, new HueColormapFactory(), new ValueColormapFactory());
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Copy Constructor
  // - - - -- - - - - - - - - - - - - - - - - - - - - - //
  TwoDimensionalColormap copy() { 
    return new TwoDimensionalColormap(_name, _one, _two, _min, _max, _min2, _max2);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Set the range of the colormaps
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  void setRange(float min1, float max1, float min2, float max2) { 
    super.setRange(min1, max1); 
    _min2 = min2; 
    _max2 = max2;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Return the 1D color
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColorDef(float value) { 
    return _one.getColormap().getColor(value);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Get the color
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColor(float value1, float value2) { 
    Colormap one = _one.getColormap();
    one.setRange(_min, _max);


    color c1 = one.getColor(value1);
    Colormap two = _two.getColormap();
    two.setRange(_min2, _max2);
    color c2 = two.getColor(value2);
    return lerpColor(c1, c2, 0.5);
  }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// 2D colormap using hue to make through 2nd map
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TwoDimHSVColormap extends TwoDimensionalColormap {

  // - - - - - - - - - - - - - - - - - - - - - - - - - - // 
  // Constructor
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimHSVColormap(String name, ColormapFactory one, ColormapFactory two, float min1, float max1, float min2, float max2) { 
    super(name, one, two, min1, max1, min2, max2);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default range)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //   
  TwoDimHSVColormap(String name, ColormapFactory one, ColormapFactory two) { 
    super(name, one, two);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Constructor (default everything)
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimHSVColormap() { 
    super("2D-HSV-DEFAULT", new RainbowColormapFactory(), new ValueColormapFactory());
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Copy
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  TwoDimHSVColormap copy() { 
    return new TwoDimHSVColormap(_name, _one, _two, _min, _max, _min2, _max2);
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  // Get the color
  // - - - - - - - - - - - - - - - - - - - - - - - - - - //
  color getColor(float value1, float value2) { 

    // Get the hue from the 1st colormap
    Colormap one = _one.getColormap();
    if (_max - _min < 0.00001)  value1 = 0.5;
    else
      one.setRange(_min, _max);


    float [] c1 = rgb2hsv(one.getColor(value1));

    float hue = c1[0]; 
    float sat = c1[1]; 
    float val = c1[2];

    Colormap two = _two.getColormap();
    two.setRange(_min2, _max2);
    ((HSVColormap)two).setHue(hue, hue);
    ((HSVColormap)two).setSat(sat, sat);
    ((HSVColormap)two).setVal(val, ((HSVColormap)two).getVal2());
    return two.getColor(value2);
  }
}

