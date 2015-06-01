
class Room{
  
  //CONSTANT
  int ROOM_SIZE = 20;//In terms of availible space one one edge for a single object, i.e. 1 = space for one object
  int BOX_SIZE = 5;//Pixel size of one edge of an object
  
  int ROOM_RED_HUE = 30;
  int ROOM_GRE_HUE = 100;
  int ROOM_BLU_HUE = 50;
  
  String ROOM_LOCATION = "/Rooms/Room";//File location of a room
  
  //Instance
  int rX, rY;//Location of room on the Map
  
  Entity[][] room;//A 2d map of the room
  
  Room(int rX, int rY){
    this.rX = rX;
    this.rY = rY;
    
    room = new Entity[ROOM_SIZE][ROOM_SIZE]; 
   
  }
  
  //Distance between two rooms, calculated as a sum of horizontal and vertical distance
  int roomDistance(Room other){
    return abs(this.rX - other.rX) + abs(this.rY - other.rY);
  }
  
  int roomDistance(int x, int y){
    return abs(this.rX - x) + abs(this.rY - y); 
  }
}
