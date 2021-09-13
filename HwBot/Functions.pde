float correctedtext(char s, float x, float y) {  
  if ( s == '0' ) {
    text('O', x, y) ;
  } else if ( s == '\n' ) text( "", x, y ) ; 
  else if( s == ',' ) text("" , x , y ) ; 
  else if( s == '\'' ) text(" " , x , y) ; 
  else text(s, x, y) ;
  return textWidth(s) ;
}
void correctedtext(String s, float x, float y) {
  float ii = 0 ;
  for ( int i = 0; i < s.length(); i++) {
    ii += correctedtext(s.charAt(i), x + ii, y) ;
  }
}

void changeFont() {
  nextFontIndex = (int)random(fonts.length) ;
  nextSize = random(5) ; //buttons.get(0).sliders.get(0).val  ; // random(33, 36) ;
  nextTheta = random(-1, 1)/50 ;
  ss.get(ss.size()-1).theta = buttons.get(0).sliders.get(1).val*PI/180 ;
  ss.get(ss.size()-1).size = buttons.get(0).sliders.get(0).val ;
}

void colorBlue() { // fill(#2500FF) ; // 23 82 152 > 38 75 143 >> 34 60 117
  sliders.get(0).val = 23 ; 
  sliders.get(1).val = 82 ; 
  sliders.get(2).val = 152 ;
  sliders.get(3).val = 255 ;
}

void colorJetBlue() {
  sliders.get(0).val = 0 ; 
  sliders.get(1).val = 22 ; 
  sliders.get(2).val = 255 ;
  sliders.get(3).val = 130 ;
}

void colorBlack() { 
  sliders.get(0).val = 15 ; 
  sliders.get(1).val = 15 ; 
  sliders.get(2).val = 13 ;
  sliders.get(3).val = 220 ;
}

void type() {
  textAlign(LEFT, CENTER); 
  textSize(16); 
  for ( stringing s : ss ) {
    float ii = 0; 
    float tempx = s.x ; 
    float tempy = s.y ;
    pushMatrix() ; 
    translate(tempx, tempy) ;
    rotate(s.theta) ; 
    for ( int i = 0; i < s.s.length(); i++ ) {
      //textFont( createFont("Chinmaynormal1" , 64) ) ; //fonts[s.fontIndex.get(i)], 64) ) ;
      textFont( fonts[s.fontIndex.get(i)] ); 
      fill( s.c ) ; //sliders.get(0).val, sliders.get(1).val, sliders.get(2).val ); 
      if ( ii + tempx > rightborder ) {     
        ii = 0 ; 
        tempx = leftborder ; 
        tempy += linegap ; 
        popMatrix() ; 
        pushMatrix() ; 
        translate( tempx, tempy ) ;
      } 
      pushMatrix(); 
      translate(ii, 0); 
      rotate(s.thetas.get(i)); 
      textSize(s.size + s.sizes.get(i)); 
      ii += correctedtext( s.s.charAt(i), 0, 0 ); 
      popMatrix(); 
      //ii += textWidth(s.s.charAt(i)); // + s.fontIndex[i]/100 ;
    }
    popMatrix() ;
  }
  for( lining l : ll ) {
    l.display() ;   
  }
}

int fileNumber = 0 ;
void saveWork() { 
  PImage savingWork = get(int((backgroundPagex)*zoomscale+panx), int((backgroundPagey)*zoomscale+pany), int(backgroundPage.width), int(backgroundPage.height) ) ; 
  savingWork.save(System.getProperty("user.home") + "\\Desktop\\HWbot done work\\Workdone " + hour() + "-" + minute() + " " + day() + "-" + month() + "    " + str(savedimages) + ".png") ;
  //fileNumber++ ;
  savedimages++ ; 
}
void refreshpage() {
  backgroundPage = backgroundPageOriginal.get(0, 0, backgroundPageOriginal.width, backgroundPageOriginal.height) ;
  backgroundPage.resize( int(backgroundPageOriginal.width*zoomscale), int(backgroundPageOriginal.height*zoomscale )) ;
}
void loadpage(PImage i) { 
  backgroundPageOriginal = i.get(0, 0, i.width, i.height) ; 
  float x = backgroundPageOriginal.width ; 
  float y = backgroundPageOriginal.height ; 
  if ( x > 700 ) { 
    y = 700*y/x ;
    x = 700 ;
  }
  backgroundPageOriginal.resize(int(x), int(y));
  refreshpage() ;
}

/////////////////////////////////////
import drop.* ; 
SDrop dropingobject ;  
void dropEvent(DropEvent dropevent) {
  if ( dropevent.isImage() ) {
    backgroundPageOriginal = dropevent.loadImage() ;
  }
}

import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.Toolkit;
Object getFromClipboard (DataFlavor flavor) {
  Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard(); 
  Transferable contents = clipboard.getContents(null);
  Object object = null;
  if (contents != null && contents.isDataFlavorSupported(flavor))
  {
    try
    {
      object = contents.getTransferData(flavor);
    }
    catch (UnsupportedFlavorException e1) {
    } 
    catch (java.io.IOException e2) {
    }
  }
  return object;
}
