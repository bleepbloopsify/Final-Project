//CONSTANTS
int BG_COLOR_GREYSCALE = 255;
//String PROJ_LOC = "C:/Users/Leon/Desktop/Final-Project";
static String PROJ_LOC = "/home/students/2016/leon.chou/Final-Project";

//Instance
Map currFloor;
int floor;
void setup(){
  size(displayWidth / 2, displayHeight / 2);
  background(BG_COLOR_GREYSCALE);
  
  floor = 1;
  currFloor = new Map(floor);
}

void draw(){
  currFloor.currRoom.display();
}

void keyPressed(){
  
  
}

void keyReleased(){
  
  
}


