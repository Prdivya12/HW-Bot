ArrayList<stringing> ss ; //<>//
ArrayList<lining> ll ; 
float cursorx = 0, cursory = 0 ; 
PFont[] fonts ; 
PImage backgroundPage, backgroundPageOriginal ; 
int backgroundPagex = 0, backgroundPagey = 0 ; 
float panedx = 0, panedy = 0, panx, pany ; 
boolean panning = false ; 

ArrayList<Slider> sliders ; 
ArrayList<Button> buttons ; 
int leftborder = 55, rightborder = 675 ;
float linegap = 25 ; 
int savedimages = 0 ; 


////////// TO DO : NEXT LINE THING

void settingup() {
  sliders = new ArrayList<Slider>() ; 
  buttons = new ArrayList<Button>() ; 
  sliders.add( new Slider( "Red", 64, height - 100, 255) ) ; 
  sliders.add( new Slider( "Green", 64, height - 70, 255) ) ;
  sliders.add( new Slider( "Blue", 64, height - 40, 255) ) ;
  sliders.add( new Slider( "Alpha", 64, height - 10, 255) ) ;
  
  buttons.add( new Button( "Text", 50, 50, 30, 15) ) ; 
  buttons.get(0).sliders.add( new Slider( "Size", 64, 110, 210, 28)) ;
  buttons.get(0).sliders.add( new Slider( "Theta", 64, 150, 360)) ;
  buttons.add( new Button( "Line", 130, 50, 30, 15) );
  buttons.get(1).sliders.add( new Slider( "Width", 64, 110, 200 , 10)) ;
  buttons.add( new Button( "Clear", 220, 50, 40, 15) );
  buttons.add( new Button( "Black", 320, 50, 40, 15) );
  buttons.add( new Button( "Blue", 400, 50, 40, 15) );
  dropingobject = new SDrop(this) ;
  fonts = new PFont[] { 
    createFont(System.getProperty("user.home") + "\\Desktop\\Homeworkbot Files\\Hand Fonts\\1.ttf", 128)  
    //createFont("C:\\Users\\Chinmay\\Desktop\\Homeworkbot\\HAND FONTS\\FINAL1.ttf", 128 ), 
    //createFont("C:\\Users\\Chinmay\\Desktop\\Homeworkbot\\HAND FONTS\\Omega1-Regular.ttf", 128 )
  } ; // PFont.list() ; 
  ss = new ArrayList<stringing>(); 
  ss.add( new stringing(-1000, -1000) );
  ll = new ArrayList<lining>() ; 
}

void setup() { 
  size(700, 900) ; //
  //fullScreen() ; 
  settingup() ; 


  loadpage(loadImage(System.getProperty("user.home") + "\\Desktop\\Homeworkbot Files\\Background Pages\\Labpage_Lines1.jpg")); 

  //backgroundPageOriginal.resize(int(backgroundPageOriginal.width/3.5), int(backgroundPageOriginal.height/3.5));



  frameRate(1000); 
  colorJetBlue(); 
  changeFont();
}

void draw() {
  background(20); 
  //println(frameRate) ; 
  ss.get(ss.size()-1).c = color( sliders.get(0).val, sliders.get(1).val, sliders.get(2).val, sliders.get(3).val  ) ;

  //if ( panhold ) translate( - panholdx + mouseX, - panholdy + mouseY ); 
  //else translate( -panholdx, -panholdy );
  translate(panx, pany) ; 

  if ( backgroundPage != null ) {
    image(backgroundPage, backgroundPagex, backgroundPagey ) ; //, (backgroundPage.width)*zoomscale, (backgroundPage.height)*zoomscale ) ; 
  }
  scale(zoomscale) ;
  
  UI() ; 
  type(); 
  scopezoom() ;
}
