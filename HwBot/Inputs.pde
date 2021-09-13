boolean pasting = false ;
void mousePressed() { 
  if ( mouseButton == RIGHT ) {
    panning = true; 
    panedx += mouseX; 
    panedy += mouseY;
  }
  if ( mouseButton == LEFT) {
    boolean caughtsomething = false ;
    if ( showui ) {
      for (Button b : buttons) {
        if ( b.inside() ) {
          if ( b.name == "Clear" ) {
            ss = new ArrayList<stringing>() ; 
            ss.add( new stringing(-1000, -1000) );
          } else if ( b.name == "Blue" ) colorJetBlue() ; 
          else if ( b.name == "Black" ) colorBlack() ; 
          else { 
            for (Button bb : buttons) bb.active = false ;
            b.active = true ;
            caughtsomething = true ;
          }
        } else {
          for (Slider s : b.sliders) { 
            if ( s.inside() ) {
              caughtsomething = true; 
              s.caught = true;
            }
          }
        }
      }
      for (Slider s : sliders) { 
        if ( s.inside() ) {
          caughtsomething = true; 
          s.caught = true;
        }
      }
    }
    if ( !caughtsomething ) {
      if ( buttons.get(0).active ) {
        cursorx = (mouseX - panx)/zoomscale ; 
        cursory = (mouseY - pany)/zoomscale ;
        ss.add( new stringing(int(cursorx), int(cursory)));
      }
      if ( buttons.get(1).active ) {
        ll.add( new lining(mouseX, mouseY) ) ; 
        ll.get(ll.size()-1).setxy(mouseX, mouseY) ;
      }
    }
  }
}

void mouseDragged() { 
  if ( panning ) {
    panx = mouseX - panedx ; 
    pany = mouseY - panedy ;
  } else { 
    for (Slider s : sliders) { 
      if ( s.caught ) {
        s.val = int((mouseX - panx - s.x)/zoomscale); 
        s.val = constrain( s.val, 0, s.maxval );
      }
    }
    for (Button b : buttons) if (b.active) {
      if ( b == buttons.get(1) ) {
        if ( ll.size() > 0 ) ll.get(ll.size()-1).setxy(mouseX, mouseY) ;
      }
      for (Slider s : b.sliders) { 
        if ( s.caught ) {
          s.val = int((mouseX - s.x + s.minval - panx)/zoomscale); 
          s.val = constrain( s.val, s.minval, s.maxval );
          if ( s == buttons.get(0).sliders.get(0) ) changeFont() ;
          if ( s == buttons.get(0).sliders.get(1) ) changeFont() ;
        }
      }
    }
  }
}

void mouseReleased() { 
  //caughtsomething = false; 
  for (Slider s : sliders) { 
    s.caught = false;
  }
  for (Button b : buttons) for (Slider s : b.sliders) { 
    s.caught = false;
  }
  if ( panning ) { 
    panning = false;
    panedx = -panx ; 
    panedy = -pany ;
  }
}

float zoomscale = 1 ; 
void mouseWheel(MouseEvent event) {   
  zoomscale -= event.getCount()/50.0 ;
  refreshpage() ; 
  //zoomscale = constrain( zoomscale , 0.5 , 5 ) ;
}

void keyPressed() { 
  if ( key == 8 ) ss.get(ss.size()-1).remove(); 
  if ( keyCode== ENTER ) for ( int i = 0; i < 38; i++ ) {
      ss.get(ss.size()-1).add(' ');
    }
  if ( key == 126 ) saveWork() ;       
  if ( keyCode == 112 ) { 
    String t = (String) getFromClipboard(DataFlavor.stringFlavor); 
    for ( int i = 0; i < t.length(); i++ ) {
      ss.get(ss.size()-1).add(t.charAt(i)) ;
    }
  }
  if ( key == '`' ) {
    zoomscale = 1 ; 
    panning = false; 
    panx = pany = panedx = panedy = 0 ; 
    loadpage(backgroundPageOriginal) ; 
    refreshpage() ; 
    return;
  } 
  if ( key == TAB ) showui = !showui ;
  if ( key > 8 && key < 126 && !pasting ) ss.get(ss.size()-1).add(key);
}
