//CONSTANTS
int BG_COLOR_GREYSCALE = 255;
//static String PROJ_LOC = "C:/Users/Leon/Desktop/Final-Project";
static String PROJ_LOC = "/home/students/2016/leon.chou/Final-Project";

static String IMG_LOC = "";//"/Images/";
static String IMG_END = ".png";

//Instance
static Map currFloor;
int floor;

boolean[] keyDown = new boolean[256];

int x, y;//for mouse

Player player;

void setup(){
  size(Room.BOX_SIZE * Room.ROOM_SIZE + Room.PADDING * 2, Room.BOX_SIZE * Room.ROOM_SIZE + Room.PADDING * 2);
  background(BG_COLOR_GREYSCALE);
  Enemy p1 = new Enemy("Blob");
  
  floor = 1;
  currFloor = new Map(floor);
  
  player = new Player();
}

void draw(){
  background(255);
  currFloor.display();
  player.display(keyDown);
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

void mouseClicked(){
  //player.fireAt(x,y); 
}


