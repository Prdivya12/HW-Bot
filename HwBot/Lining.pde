class lining {
  float x, y, px, py, w ; 
  color c ; 
  lining(float px_, float py_) { 
    c = color(20, 50, 255) ; 
    x = y = 0 ;
    w = 5 ; 
    px = px_ ; 
    py = py_ ;
  }
  void display() {
    stroke(sliders.get(0).val, sliders.get(1).val, sliders.get(2).val, sliders.get(3).val); 
    strokeWeight(buttons.get(1).sliders.get(0).val/10) ; 
    line(x, y, px, py) ;
  }
  void setxy( float x_, float y_ ) {
    x = x_ ; 
    y = y_ ;
  }
}
