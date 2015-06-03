import java.io.*;
class Room{
  
  //CONSTANT
  int ROOM_SIZE = 15;//In terms of availible space one one edge for a single object, i.e. 1 = space for one object
  int BOX_SIZE = 70;//Pixel size of one edge of an object
  
  int ROOM_RED_HUE = 30;
  int ROOM_GRE_HUE = 100;
  int ROOM_BLU_HUE = 50;
  
  String ROOM_LOCATION = "/Rooms/";//File location of a room
  
  //Instance
  int rX, rY;//Location of room on the Map
  
  Entity[][] room;//A 2d map of the room
  
  Room(int rX, int rY, String fileloc){
    this.rX = rX;
    this.rY = rY;
    
    room = new Entity[ROOM_SIZE][ROOM_SIZE]; 
    load(fileloc);
  }
  
  void load(String fileloc){
    File folder = new File(fileloc + ROOM_LOCATION);
    File[] files = folder.listFiles();
    try{
      BufferedReader file = new BufferedReader(new FileReader(files[int(random(files.length))]));
      for(Entity[] line : room){
        String[] fileline = file.readLine().split(" ");
        for(int i = 0; i < line.length; i++){
          if(fileline[i] == "null"){  
            line[i] = null;
          }else if(fileline[i].charAt(0) > 'z'){
           //line[i] = new Entity(fileline[i]); 
          }else{
            //line[i] = new Object(fileline[i]);
          }
        }
      }
    }catch(Exception e){println(e);}
  }
 
  void display(){
     
  }
  
  //Distance between two rooms, calculated as a sum of horizontal and vertical distance
  int roomDistance(Room other){
    return abs(this.rX - other.rX) + abs(this.rY - other.rY);
  }
  
  int roomDistance(int x, int y){
    return abs(this.rX - x) + abs(this.rY - y); 
  }
}
