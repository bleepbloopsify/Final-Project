
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
  
  Map(){
    map = new Room[MAX_RHEIGHT][MAX_RWIDTH];
    setStart();
    setBoss();
    fillIn();
  }

  //Is a room outside of the map?
  boolean outOfBounds(Room r){
    return  0 > r.rX || r.rX >= MAX_RWIDTH || 0 > r.rY || r.rY >= MAX_HEIGHT;
  }
  
  boolean outOfBounds(int rX, int rY){
    return  0 > rX || rX >= MAX_RWIDTH || 0 > rY || rY >= MAX_HEIGHT;
  }


  // Will set the spawn room for the floor
  void setStart(){
    spawn = new Room(int(random(MAX_RWIDTH)), int(random(MAX_RHEIGHT)));
    Room[spawn.rY][spawn.rX] = spawn;
  }
  
  //Creates a trail and sets a boss Room
  //PREREQUISITES- SPAWN MUST BE SET
  void setBoss(){
    if(spawn == null) return;
    setBoss(spawn.rX, spawn.rY, 0);
  }
  
  boolean setBoss(int x, int y, int trail){
    if( outOfBounds(x,y) )
     return false; 
    if( trail > floor * SPRAWL){
       boss = new Room(x , y);
       map[y][x] = boss;
       return true;
    }
    
  }
  
  //Fills in the path between the spawn and the boss room, as well as other paths
  void fillin(){
    
  }
  
}
