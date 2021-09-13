class Button { 
  float x, y, bx, by ;
  String name ; 
  color c ; 
  boolean active ;
  ArrayList<Slider> sliders ;
  Button(String temp_name, float temp_x, float temp_y, float bxx, float byy ) { 
    name = temp_name ;
    c = color(200, 0, 240) ;  
    x = temp_x ; 
    y = temp_y ; 
    bx = bxx ; 
    by = byy ;
    sliders = new ArrayList<Slider>() ; 
    active = false ;
  }
  Button(color temp_c, float temp_x, float temp_y) { 
    name = null ;
    c = temp_c ;
    x = temp_x ; 
    y = temp_y ;
  }
  void display() { 
    stroke(230);
    if ( active ) fill(c) ;
    else if ( inside() ) fill(c, 50) ; 
    else fill(50) ; 
    rectMode(CENTER) ;
    textAlign( CENTER, CENTER ) ; 
    rect( x, y, 2*bx, 2*by ) ;
    fill(250) ; 
    text(name, x, y) ;
    if (active) for (Slider s : sliders) s.display() ;
  }
  boolean inside() { 
    return ( (mouseX - panx)/zoomscale > x - bx 
      && (mouseX - panx)/zoomscale < x + bx 
      && (mouseY - pany)/zoomscale > y - by 
      && (mouseY - pany)/zoomscale < y + by ) ;
  }
}
