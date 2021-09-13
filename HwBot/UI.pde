boolean showui = true ; 

void UI() { 
  if ( showui ) {
    stroke(255, 0, 0) ; 
    strokeWeight(3) ; 

    line( leftborder + backgroundPagex , backgroundPagey , leftborder, backgroundPage.height)  ; 
    line( rightborder + backgroundPagex , backgroundPagey , rightborder, backgroundPage.height)  ;
    
    
    stroke( sliders.get(0).val, sliders.get(1).val, sliders.get(2).val ); 
    synccursor() ; 
    float csize = ss.get(ss.size()-1).size/2.5 ; 
    float ctheta = ss.get(ss.size()-1).theta ;
    line( cursorx - csize*sin(ctheta), cursory + csize*cos(ctheta), cursorx + csize*sin(ctheta), cursory - csize*cos(ctheta) ) ;

    textFont( fonts[nextFontIndex] ); 
    textSize( 50 ); 
    for (Slider s : sliders) s.display(); 
    for ( Button b : buttons )  b.display(); 
    fill( sliders.get(0).val, sliders.get(1).val, sliders.get(2).val, sliders.get(3).val ); 
    textAlign(LEFT, CENTER); 
    textSize(buttons.get(0).sliders.get(0).val*6); 
    pushMatrix(); 
    translate( 64, height - 170  - buttons.get(0).sliders.get(0).val); 
    rotate(buttons.get(0).sliders.get(1).val*PI/180); 
    text( "A", 0, 0 ); 
    float i = textWidth("A") ;
    textSize(buttons.get(0).sliders.get(0).val) ; 
    text(" Sample", i, 20 + buttons.get(0).sliders.get(0).val/2) ; 
    popMatrix();
  }
}

void scopezoom() {
  if ( mouseButton == CENTER ) {
    copy(mouseX - 50, mouseY - 50, 100, 100, constrain(int((mouseX - panx)/zoomscale) + 50, 0, width - 400), constrain(int((mouseY - pany)/zoomscale) + 50, 0, height - 400), 400, 400); 
    noFill(); 
    stroke(50); 
    rectMode(CORNER); 
    rect( (mouseX - panx)/zoomscale - 50, (mouseY - pany)/zoomscale - 50, 100, 100 );
  }
}
