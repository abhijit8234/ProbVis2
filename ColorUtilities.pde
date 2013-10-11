// - - - - - - - - - - - - - - - - - - - - - - - - - - //
// Convert HSV to rgb
// - - - - - - - - - - - - - - - - - - - - - - - - - - //

color hsv2rgb(float h, float s, float v) {

  float Min;
  float Chroma;
  float Hdash;
  float X;
  color RGB;
  float R, G, B;
  R = G = B = 0;

  Chroma = s * v;
  Hdash = h / 60.0;
  X = Chroma * (1.0 - abs((Hdash % 2.0) - 1.0));

  if (Hdash < 1.0) {
    R = Chroma;
    G = X;
  }
  else if (Hdash < 2.0) {
    R = X;
    G = Chroma;
  }
  else if (Hdash < 3.0) {
    G = Chroma;
    B = X;
  }
  else if (Hdash < 4.0) {
    G= X;
    B = Chroma;
  }
  else if (Hdash < 5.0) {
    R = X;
    B = Chroma;
  }
  else if (Hdash < 6.0) {
    R = Chroma;
    B = X;
  }

  Min = v - Chroma;

  R += Min;
  G += Min;
  B += Min;

  RGB = color(R*255.0, G*255.0, B*255.0);
  return RGB;
}

// - - - - - - - - - - - - - - - - - - - - - - - - - - //
// Convert rgb to hsv
// - - - - - - - - - - - - - - - - - - - - - - - - - - //
float [] rgb2hsv(color rgb) {
  float max;
  float min;
  float Chroma;
  float HSV[] = new float[3];

  float red = red(rgb)/255.0;
  float green = green(rgb)/255.0;
  float blue = blue(rgb)/255.0;

  min = max = red;
  min = min < green ? min : green;
  min = min <  blue ? min : blue;

  max = max > green ? max : green;
  max = max >  blue ? max : blue;
  Chroma = max - min;

  //If Chroma is 0, then S is 0 by definition, and H is undefined but 0 by convention.
  if (Chroma != 0)
  {
    if (red == max) {
      HSV[0] = (green - blue) / Chroma;

      if (HSV[0] < 0.0) {
        HSV[0] += 6.0;
      }
    }
    else if (green == max) {
      HSV[0] = ((blue - red) / Chroma) + 2.0;
    }
    else { //blue(rgb) == Max
      HSV[0] = ((red - green) / Chroma) + 4.0;
    }

    HSV[0] *= 60.0;
    HSV[1] = Chroma / max;
  }

  HSV[2] = max;
  return HSV;
}

