//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //
// Defined colormap factories
//* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

// Blue Red
class BlueRedColormapFactory extends TwoColormapFactory{
    public BlueRedColormapFactory() { super(new String("BLUERED"), blue, red); }
    public BlueRedColormapFactory(float min, float max) { super(new String("GRAYSCALE"), blue, red, min, max); }
}

// Blue Green
class BlueGreenColormapFactory extends TwoColormapFactory{
    public BlueGreenColormapFactory() { super(new String("BLUEGreen"), blue2, green2); }
    public BlueGreenColormapFactory(float min, float max) { super(new String("blue green"), blue2, green2, min, max); }
}

// Cyan - white - yellow
class CyanWhiteYellowColormapFactory extends ThreeColormapFactory{
    public CyanWhiteYellowColormapFactory() { super("CyanWhiteYellow", cyan, white, yellow); }
    public CyanWhiteYellowColormapFactory(float min, float max) { super("CyanWhiteYellow", cyan, white, yellow, min, max); }
}

// Cyan Yellow
class CyanYellowColormapFactory extends TwoColormapFactory{
    public CyanYellowColormapFactory() { super("CyanYellow", cyan, yellow2); }
    public CyanYellowColormapFactory(float min, float max) { super("CyanYellow", cyan, yellow2, min, max); }
}

// Red Yellow
class RedYellowColormapFactory extends TwoColormapFactory{
    public RedYellowColormapFactory() { super("RedYellow", red, yellow2); }
    public RedYellowColormapFactory(float min, float max) { super("RedYellow", red, yellow2, min, max); }
}

// Red Green
class RedGreenColormapFactory extends TwoColormapFactory{
    public RedGreenColormapFactory() { super("RedGreen", red2, green3); }
    public RedGreenColormapFactory(float min, float max) { super("RedGreen", red2, green3, min, max); }
}

// Grayscale
class GrayscaleColormapFactory extends TwoColormapFactory{
    public GrayscaleColormapFactory() { super(new String("GRAYSCALE"), white, black); }
    public GrayscaleColormapFactory(float min, float max) { super(new String("GRAYSCALE"), white, black, min, max); }
}


// Rainbow
class RainbowColormapFactory extends ThreeColormapFactory{
   
    public RainbowColormapFactory(){ super(new String("RAINBOW"),blue,yellow,red); }
    public RainbowColormapFactory(float min, float max){ super(new String("RAINBOW"),blue,yellow,red,min,max); }
}

// HUE
class HueColormapFactory extends HSVColormapFactory{
    public HueColormapFactory(float h1, float h2, float min, float max)  { super(new String("HUE"),  h1,h2, 1.0,1.0, 1.0,1.0, min, max); }
    public HueColormapFactory(float h1, float h2)  { super(new String("HUE"),  h1,h2, 1.0,1.0, 1.0,1.0); }
    public HueColormapFactory() { super(new String("HUE"),  0.0,360.0, 1.0,1.0, 1.0,1.0); }
}

// SATURATION
class SaturationColormapFactory extends HSVColormapFactory{
    public SaturationColormapFactory(float s1, float s2, float min, float max) { super(new String("SATURATION"), 0.0,0.0, s1,s2, 1.0,1.0, min, max); } 
    public SaturationColormapFactory(float s1, float s2) { super(new String("SATURATION"), 0.0,0.0, s1,s2, 1.0,1.0); } 
    public SaturationColormapFactory(float h) { super(new String("SATURATION"), h,h, 0.0,1.0, 1.0,1.0 ); } 
    public SaturationColormapFactory(float h, float s1, float s2) { super(new String("SATURATION"), h,h, s1,s2, 1.0,1.0 ); } 
    public SaturationColormapFactory(float h, float s1, float s2, float min, float max) { super(new String("SATURATION"), h,h, s1,s2, 1.0,1.0, min, max); }
    public SaturationColormapFactory() { super(new String("SATURATION"), 0.0,0.0,  0.0,1.0,  1.0,1.0 ); } 
}

// NEG SATURATION
class NegSaturationColormapFactory extends HSVColormapFactory{
    public NegSaturationColormapFactory(float s1, float s2, float min, float max) { super(new String("NEGSATURATION"), 0.0,0.0, s2,s1, 1.0,1.0, min, max); } 
    public NegSaturationColormapFactory(float s1, float s2) { super(new String("NEGSATURATION"), 0.0,0.0, s2,s1, 1.0,1.0); } 
    public NegSaturationColormapFactory(float h) { super(new String("NEGSATURATION"), h,h, 1.0,0.0, 1.0,1.0 ); } 
    public NegSaturationColormapFactory(float h, float s1, float s2) { super(new String("NEGSATURATION"), h,h, s2,s1, 1.0,1.0 ); } 
    public NegSaturationColormapFactory(float h, float s1, float s2, float min, float max) { super(new String("NEGSATURATION"), h,h, s2,s1, 1.0,1.0, min, max); }
    public NegSaturationColormapFactory() { super(new String("NEGSATURATION"), 0.0,0.0,  1.0,0.0,  1.0,1.0 ); } 
}

// VALUE
class ValueColormapFactory extends HSVColormapFactory{
    public ValueColormapFactory(float v1, float v2, float min, float max) { super(new String("VALUE"), 0.0,0.0, 1.0, 1.0, v1,v2, min, max); } 
    public ValueColormapFactory(float v1, float v2) { super(new String("VALUE"), 0.0,0.0, 1.0, 1.0, v1,v2); } 
    public ValueColormapFactory(float h) { super(new String("VALUE"), h,h, 1.0,1.0, 0.0,1.0 ); } 
    public ValueColormapFactory(float h, float v1, float v2) { super(new String("VALUE"), h,h, 1.0,1.0, v1,v2); } 
    public ValueColormapFactory(float h, float v1, float v2, float min, float max) { super(new String("VALUE"), h,h, 1.0,1.0, v1,v2, min, max); }
    public ValueColormapFactory() { super(new String("VALUE"), 0.0,0.0,  1.0,1.0,  0.0,1.0 ); }     
}

// VALUE
class NegValueColormapFactory extends HSVColormapFactory{
    public NegValueColormapFactory(float v1, float v2, float min, float max) { super(new String("VALUE"), 0.0,0.0, 1.0, 1.0, v1,v2, min, max); } 
    public NegValueColormapFactory(float v1, float v2) { super(new String("VALUE"), 0.0,0.0, 1.0, 1.0, v2,v1); } 
    public NegValueColormapFactory(float h) { super(new String("VALUE"), h,h, 1.0,1.0, 1.0,0.0 ); } 
    public NegValueColormapFactory(float h, float v1, float v2) { super(new String("VALUE"), h,h, 1.0,1.0, v2,v1); } 
    public NegValueColormapFactory(float h, float v1, float v2, float min, float max) { super(new String("VALUE"), h,h, 1.0,1.0, v2,v1, min, max); }
    public NegValueColormapFactory() { super(new String("VALUE"), 0.0,0.0,  1.0,1.0,  1.0,0.0 ); }     
}


// Rainbow + value
class RainbowValueColormapFactory extends TwoDimHSVColormapFactory{
    public RainbowValueColormapFactory() { super("RAINBOW-VALUE-2D-HSV", new RainbowColormapFactory(), new ValueColormapFactory()); }
    public RainbowValueColormapFactory(float min1, float max1, float min2, float max2) { super("RAINBOW-VALUE-2D", new RainbowColormapFactory(), new ValueColormapFactory(), min1, max1, min2, max2);}
}

// Rainbow + value
class RainbowNegValueColormapFactory extends TwoDimHSVColormapFactory{
    public RainbowNegValueColormapFactory() { super("RAINBOW-VALUE-2D-HSV", new RainbowColormapFactory(), new NegValueColormapFactory(0.25, 1.0)); }
    public RainbowNegValueColormapFactory(float min1, float max1, float min2, float max2) { super("RAINBOW-VALUE-2D", new RainbowColormapFactory(), new NegValueColormapFactory(), min1, max1, min2, max2);}
}

// Rainbow + saturation
class RainbowSaturationColormapFactory extends TwoDimHSVColormapFactory{
    public RainbowSaturationColormapFactory() { super("RAINBOW-SAT-2D-HSV", new RainbowColormapFactory(), new SaturationColormapFactory()); }
    public RainbowSaturationColormapFactory(float min1, float max1, float min2, float max2) { super("RAINBOW-VALUE-2D", new RainbowColormapFactory(), new SaturationColormapFactory(), min1, max1, min2, max2);}
}

// Rainbow + saturation
class RainbowNegSaturationColormapFactory extends TwoDimHSVColormapFactory{
    public RainbowNegSaturationColormapFactory() { super("RAINBOW-SAT-2D-HSV", new RainbowColormapFactory(), new NegSaturationColormapFactory(0.25, 1.0)); }
    public RainbowNegSaturationColormapFactory(float min1, float max1, float min2, float max2) { super("RAINBOW-VALUE-2D", new RainbowColormapFactory(), new NegSaturationColormapFactory(0.15, 1.0), min1, max1, min2, max2);}
}

// Blue/Red + value
class BlueRedNegValueColormapFactory extends TwoDimHSVColormapFactory{   
    public BlueRedNegValueColormapFactory() { super("BLUE-RED-VALUE-2D-HSV", new BlueRedColormapFactory(), new NegValueColormapFactory(0.25, 1.0)); }
    public BlueRedNegValueColormapFactory(float min1, float max1, float min2, float max2) { super("BLUE-RED-VALUE-2D-HSV", new BlueRedColormapFactory(), new NegValueColormapFactory(0.15, 1.0), min1, max1, min2, max2);}
}

// Cyan-white-yellow + value
class CyanWhiteYellowNegValueColormapFactory extends TwoDimHSVColormapFactory{
    public CyanWhiteYellowNegValueColormapFactory() { super("CyanWhiteYellowNegVal", new CyanWhiteYellowColormapFactory(), new NegValueColormapFactory(0.25, 1.0)); }
    public CyanWhiteYellowNegValueColormapFactory(float min1, float max1, float min2, float max2) { super("CyanWhiteYellowNegVal", new CyanWhiteYellowColormapFactory(), new NegValueColormapFactory(0.25, 1.0), min1, max1, min2, max2); }

}

// Red yellow + value
class RedYellowNegValueColormapFactory extends TwoDimHSVColormapFactory{
    public RedYellowNegValueColormapFactory() { super("RedYellowNegVal", new RedYellowColormapFactory(), new NegValueColormapFactory(0.25, 1.0)); }
    public RedYellowNegValueColormapFactory(float min1, float max1, float min2, float max2) { super("RedYellowNegVal", new RedYellowColormapFactory(), new NegValueColormapFactory(0.25, 1.0), min1, max1, min2, max2); }
}

// Blue/Green + value
class BlueGreenNegValueColormapFactory extends TwoDimHSVColormapFactory{   
    public BlueGreenNegValueColormapFactory() { super("BLUE-GREEN-VALUE-2D-HSV", new BlueGreenColormapFactory(), new NegValueColormapFactory(0.25, 1.0)); }
    public BlueGreenNegValueColormapFactory(float min1, float max1, float min2, float max2) { super("BLUE-GREEN-VALUE-2D-HSV", new BlueGreenColormapFactory(), new NegValueColormapFactory(0.15, 1.0), min1, max1, min2, max2);}
}

// Red green + value
class RedGreenNegValueColormapFactory extends TwoDimHSVColormapFactory{
    public RedGreenNegValueColormapFactory() { super("RedGreenNegVal", new RedGreenColormapFactory(), new NegValueColormapFactory(0.25, 1.0)); }
    public RedGreenNegValueColormapFactory(float min1, float max1, float min2, float max2) { super("RedGreenNegVal", new RedGreenColormapFactory(), new NegValueColormapFactory(0.25, 1.0), min1, max1, min2, max2); }
}
