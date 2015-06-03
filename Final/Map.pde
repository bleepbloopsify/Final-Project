
class Map{
  //CONSTANTS
  int MAX_RHEIGHT = 10;
  int MAX_RWIDTH = 10;
  
  int SPRAWL = 5;//How many rooms the floor has
  
  //Instance
  int rLength, rWidth;//Dimensions in terms of number of rooms
  int floor;//What floor are we on?
  Room[][] map; 
  Room spawn;
  Room boss;
  
  Room currRoom;
  
  Map(int floor){
    map = new Room[MAX_RHEIGHT][MAX_RWIDTH];
    this.floor = floor;
    setStart();
    setRooms();
    for(Room[] line : map){
      for(Room r : line){
        print(r);
      }
      println();
    }
    println();
  }

  //Is a room outside of the map?
  boolean outOfBounds(Room r){
    return  0 > r.rX || r.rX >= MAX_RWIDTH || 0 > r.rY || r.rY >= MAX_RHEIGHT;
  }
  
  boolean outOfBounds(int rX, int rY){
    return  0 > rX || rX >= MAX_RWIDTH || 0 > rY || rY >= MAX_RHEIGHT;
  }


  // Will set the spawn room for the floor
  void setStart(){
    spawn = new Room (int(random(MAX_RWIDTH)), int(random(MAX_RHEIGHT)), Final.PROJ_LOC);
    map[spawn.rY][spawn.rX] = spawn;
    currRoom = spawn;
  }
  
  //Creates a set path of rooms
  //PREREQUISITES- SPAWN MUST BE SET
  void setRooms(){
    if(spawn == null) return;
    while(!setRooms(spawn.rX, spawn.rY, 0)){}
  }
  
  boolean setRooms(int x, int y, int trail){
    if( outOfBounds(x,y) )
     return false; 
    if( trail > floor * SPRAWL){
       boss = new Room(x , y, PROJ_LOC);
       map[y][x] = boss;
       return true;
    }
    int bX = int(pow(-1, int(random(2))));
    int bY = int(pow(-1, int(random(2))));
    
    if(boolean(int(random(2)))){
      if(setRooms(x + bX, y, trail++) || setRooms(x - bX, y, trail) || setRooms(x, y + bY, trail) || setRooms(x, y - bY, trail)){
        map[y][x] = new Room(x , y, PROJ_LOC);
        return true;
      }
      return false;
    }else if(setRooms(x, y + bY, trail) || setRooms(x, y - bY, trail) || setRooms(x + bX, y, trail++) || setRooms(x - bX, y, trail) ){
        map[y][x] = new Room(x , y, PROJ_LOC);
        return true;
      }
      return false;
  }
 
}
