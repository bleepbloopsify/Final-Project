//CONSTANTS
int BG_COLOR_GREYSCALE = 255;
static String PROJ_LOC = "C:/Users/Leon/Desktop/Final-Project";
//static String PROJ_LOC = "/home/students/2016/leon.chou/Final-Project";

static String IMG_LOC = "";//"/Images/";
static String IMG_END = ".png";

//Instance
static Map currFloor;
int floor;

int sightSize = 15;

boolean[] keyDown = new boolean[256];

float x, y;//for mouse

PImage bg;
static Player player;

void setup(){
  size(Room.BOX_SIZE * Room.ROOM_SIZE + Room.PADDING * 2, Room.BOX_SIZE * Room.ROOM_SIZE + Room.PADDING * 2);
  background(BG_COLOR_GREYSCALE);
  
  bg = loadImage("Room_Bg.png");
  floor = 1;
  currFloor = new Map(floor);
  
  player = new Player();
}

void draw(){
  background(100);
  //image(bg, Room.PADDING, Room.PADDING, Room.BOX_SIZE * Room.ROOM_SIZE, Room.BOX_SIZE * Room.ROOM_SIZE);
  fill(150);
  rect(Room.PADDING, Room.PADDING, Room.BOX_SIZE * Room.ROOM_SIZE, Room.BOX_SIZE * Room.ROOM_SIZE);
  currFloor.display();
  player.display(keyDown);
  displayCursor();
}

void keyPressed(){
  keyDown[keyCode] = true;
}

void keyReleased(){
  keyDown[keyCode] = false;
}

void mouseMoved(){
   this.x = mouseX;
   this.y = mouseY;
}

void mouseDragged(){
  this.x = mouseX;
  this.y = mouseY;
}

void mouseClicked(){
  player.fireAt(400,25); 
}


void displayCursor(){
  strokeWeight(2);
  if (mousePressed){
   stroke(255, 0, 0);
  }else{
   stroke(0,0,0);
  }
  line(x + 3, y, x + 3 + sightSize, y);
  line(x - 3, y, x - 3 - sightSize, y);
  line(x, y + 3, x, y + 3 + sightSize);
  line(x, y - 3, x, y - 3 - sightSize);
  stroke(0);
  
}
