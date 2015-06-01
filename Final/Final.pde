//CONSTANTS
int BG_COLOR_GREYSCALE = 255;

//Instance
Map currFloor;
int floor;
void setup(){
  size(displayWidth / 2, displayHeight / 2);
  background(BG_COLOR_GREYSCALE);
  
  floor = 1;
  currFloor = new Map(floor);
  println(currFloor.map);
}

void draw(){
  
}

void keyPressed(){
  
  
}

void keyReleased(){
  
  
}


