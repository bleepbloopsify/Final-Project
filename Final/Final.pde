//CONSTANTS
int BG_COLOR_GREYSCALE = 255;
String PROJ_LOC = "C:/Users/Leon/Desktop/Final-Project";


//Instance
Map currFloor;
int floor;
void setup(){
  size(displayWidth / 2, displayHeight / 2);
  background(BG_COLOR_GREYSCALE);
  
  floor = 1;
  currFloor = new Map(floor, PROJ_LOC);
  println(currFloor.map);
}

void draw(){
  
}

void keyPressed(){
  
  
}

void keyReleased(){
  
  
}


