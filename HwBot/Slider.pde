class Slider {
  int x, y, val, maxval, minval, r ; 
  String name ;
  boolean caught ; 
  Slider(String n, float X, float Y, int... etc) {
    name = n ; 
    x = int(X) ; 
    y = int(Y) ; 
    if (etc.length > 0) {
      if ( etc.length > 1) minval = etc[1] ;
      else minval = 0 ;
      maxval = etc[0] ;
    } else {
      minval = 0 ; 
      maxval = 100 ;
    }
    val = minval ;
    caught = false ; 
    r = 10 ; 
  }
  void display() { 
    stroke(60) ; 
    strokeWeight(5) ; 
    line( x, y, x + maxval - minval, y) ; 
    if ( inside() || caught ) fill(70,70,240) ;
    else fill(40) ; 
    strokeWeight(2) ;
    circle( x + val - minval, y, 2*r ) ; 
    //textSize(20) ; 
    textAlign(RIGHT, BOTTOM) ; 
    text(name, x, y ) ;  
    if ( inside() || caught ) { 
      textAlign(LEFT, TOP) ; 
      correctedtext(str(val), x + maxval - minval, y ) ;
    }
  }
  boolean inside() { 
    return ( dist( (mouseX - panx)/zoomscale, (mouseY-pany)/zoomscale, x + val - minval, y ) < r ) ;
  }
}
