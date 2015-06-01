
String FILE = "./Rooms/";
String ROOM = "Room_";
String BOSS = "Boss_";
String FILE_END = ".txt";

int ROOM_SIZE = 21;
int BOX_SIZE = 20;

String[][] map;
int x, y;//saves mouse variables

void setup(){
  size(ROOM_SIZE * BOX_SIZE + 100, ROOM_SIZE * BOX_SIZE + 100);
  background(0);
  
  map = new String[ROOM_SIZE][ROOM_SIZE];
}

void mouseClicked(){
   x = mouseX;
   y = mouseY;
}
