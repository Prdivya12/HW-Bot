int nextFontIndex ;
float nextTheta, nextSize ; 

class stringing {
  String s ; 
  int x, y ;
  IntList fontIndex ; 
  FloatList sizes, thetas ; 
  float size, theta ; 
  color c ;  
  stringing(int X, int Y) { 
    s = "" ; 
    fontIndex = new IntList() ;
    sizes = new FloatList() ; 
    thetas = new FloatList() ; 
    x = X ; 
    y = Y ;
    theta = buttons.get(0).sliders.get(1).val*PI/180 ;
    size = buttons.get(0).sliders.get(0).val ;
  }
  void add(char c) { 
    s += c ; 
    fontIndex.append( nextFontIndex ) ;
    sizes.append( nextSize ) ;
    thetas.append( nextTheta ) ; 
    //textFont( createFont(fonts[fontIndex.get(fontIndex.size()-1)], 64) ) ;
    //textFont( fonts[fontIndex.get(fontIndex.size()-1)] ) ; 
    //textFont( fonts[nextFontIndex] ) ;
    //textSize( size + nextSize ) ; 
    //cursorx = x + textWidth(s)*cos(theta) ;
    //cursory = y + textWidth(s)*sin(theta) ;
    changeFont() ;
  }
  void remove() { 
    if ( s.length() > 0 ) {
      //textFont( createFont(fonts[fontIndex.get(fontIndex.size()-1)], 64) ) ;
      //textFont( fonts[fontIndex.get(fontIndex.size()-1)] ) ; 
      //cursorx = x + textWidth(s.substring(0, s.length()-1))*cos(theta) ;
      //cursory = y + textWidth(s.substring(0, s.length()-1))*sin(theta) ;
      s = s.substring(0, s.length()-1) ;
      fontIndex.remove(fontIndex.size()-1) ; 
      sizes.remove(sizes.size()-1 ) ;
      thetas.remove(thetas.size()-1 ) ;
      changeFont() ;
    }
  }
}

void synccursor() {
  stringing s = ss.get(ss.size()-1) ; 
  float wx = 0, wy = 0 ; 
  if ( s.s.length() > 0 ) {
    for ( int i = 0; i < s.s.length(); i++ ) {
      textFont( fonts[s.fontIndex.get(i)] ) ;
      textSize( s.size + s.sizes.get(i) ) ;  
      wx += textWidth(s.s.charAt(i))*cos(s.theta + s.thetas.get(i)) ; 
      wy += textWidth(s.s.charAt(i))*sin(s.theta + s.thetas.get(i)) ;
    }
  }
  cursorx = s.x + wx ; 
  cursory = s.y + wy ;
}
