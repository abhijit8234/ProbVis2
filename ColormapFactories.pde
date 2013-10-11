//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Factory class to generate colormaps
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class ColormapFactory{
    Colormap cmap;
    ColormapFactory(){ cmap = new Colormap(); }
    Colormap getColormap(){  return cmap.copy(); }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Two color factory
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TwoColormapFactory extends ColormapFactory{
    // Full constructor
    TwoColormapFactory(String name, color c1, color c2, float min, float max){cmap = new TwoColormap(name, c1, c2, min, max);  }
    // Default Range
    TwoColormapFactory(String name, color c1, color c2){ cmap = new TwoColormap(name, c1, c2); }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Three color factory
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class ThreeColormapFactory extends ColormapFactory{
    // Full constructor
    ThreeColormapFactory(String name, color c1, color c2, color c3, float min, float max){ cmap = new ThreeColormap(name, c1, c2, c3, min, max); }
    // Default Range
    ThreeColormapFactory(String name, color c1, color c2, color c3){ cmap = new ThreeColormap(name, c1, c2, c3); }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// HSV factory
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class HSVColormapFactory extends ColormapFactory{
    // Full Constructor
    HSVColormapFactory(String name, float h1, float h2, float s1, float s2, float v1, float v2, float min, float max) { cmap = new HSVColormap(name, h1, h2, s1, s2, v1, v2, min, max); } 
    // Default Range
    HSVColormapFactory(String name, float h1, float h2, float s1, float s2, float v1, float v2) { cmap = new HSVColormap(name, h1, h2, s1, s2, v1, v2); }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// 2D factory
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TwoDimensionalColormapFactory extends ColormapFactory{
    // Full Constructor
    TwoDimensionalColormapFactory(String name,  ColormapFactory one, ColormapFactory two, float min1, float max1, float min2, float max2) { cmap = new TwoDimensionalColormap(name, one, two, min1, max1, min2, max2); }
    // Default range
    TwoDimensionalColormapFactory(String name,  ColormapFactory one, ColormapFactory two) {  cmap = new TwoDimensionalColormap(name, one, two); }
}

//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// 2D HSV factory
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
class TwoDimHSVColormapFactory extends ColormapFactory{
    // Full Constructor
    TwoDimHSVColormapFactory(String name,  ColormapFactory one, ColormapFactory two, float min1, float max1, float min2, float max2) { cmap = new TwoDimHSVColormap(name, one, two, min1, max1, min2, max2); }
    // Default range
    TwoDimHSVColormapFactory(String name,  ColormapFactory one, ColormapFactory two) {  cmap = new TwoDimHSVColormap(name, one, two); }
}

