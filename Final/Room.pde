import java.io.*;
class Room{
  
  //CONSTANT
  final static int ROOM_SIZE = 15;//In terms of availible space one one edge for a single object, i.e. 1 = space for one object
  final static int BOX_SIZE = 40;//Pixel size of one edge of an object
  final static int PADDING = 50;
  int ROOM_RED_HUE = 30;
  int ROOM_GRE_HUE = 100;
  int ROOM_BLU_HUE = 50;
  
  String ROOM_LOCATION = "/Rooms/";//File location of a room
  
  //Instance
  int rX, rY;//Location of room on the Map
  boolean cleared = false;
  ArrayList<Enemy> enemyList = new ArrayList<Enemy>();
  
  Entity[][] room;//A 2d map of the room
  
  Room(int rX, int rY){
    this.rX = rX;
    this.rY = rY;
    
    room = new Entity[ROOM_SIZE][ROOM_SIZE]; 
    load();
  }
  
  void load(){
    File folder = new File(Final.PROJ_LOC + ROOM_LOCATION);
    File[] files = folder.listFiles();
    try{
      BufferedReader file = new BufferedReader(new FileReader(files[int(random(files.length))]));
      for(Entity[] line : room){
        String[] fileline = file.readLine().split(" ");
        for(int i = 0; i < fileline.length; i++){
          if(fileline[i] == "null" || fileline[i].equals("floor")){  
            line[i] = null;
          }else if('A' - 1 < fileline[i].charAt(0) && fileline[i].charAt(0) < 'Z' + 1){
            Enemy spawn = new Enemy(fileline[i]);
            line[i] = spawn;
            enemyList.add(spawn);
          }else{
            line[i] = new Object(fileline[i]);
          }
        }
      }
    }catch(Exception e){println(e);}
    for(int row = 0; row < ROOM_SIZE; row++){
      for(int col = 0; col < ROOM_SIZE; col++){
        if(room[row][col] != null){
          room[row][col].setLoc(PADDING + row * BOX_SIZE, PADDING + col * BOX_SIZE); 
        }
      }
    }
  }
 
  void display(){
   for(int row = 0; row < ROOM_SIZE; row++){
     for(int col = 0; col < ROOM_SIZE; col++){
       if(room[row][col] != null && room[row][col].type.equals("Object")){
          room[row][col].display();
        }
     }
    }
    for(Enemy e : enemyList){
     e.display();
    }
  }
  
  //Distance between two rooms, calculated as a sum of horizontal and vertical distance
  int roomDistance(Room other){
    return abs(this.rX - other.rX) + abs(this.rY - other.rY);
  }
  
  int roomDistance(int x, int y){
    return abs(this.rX - x) + abs(this.rY - y); 
  }
}
