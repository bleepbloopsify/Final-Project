
class Map{
  //CONSTANTS
  int MAX_RHEIGHT = 10;
  int MAX_RWIDTH = 10;
  
  int DOOR_LENGTH = 20;
  
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
  }

  void display(){
    currRoom.display();
    drawDoors();
  }

  void drawDoors(){
    int p = Room.PADDING;
    int r = Room.ROOM_SIZE;
    int b = Room.BOX_SIZE;
      
    noStroke();
    fill(0);
    for(float i = 0; i <= TWO_PI; i += HALF_PI){
      if(true || 0 < currRoom.rY + int(cos(i)) && currRoom.rY + int(cos(i)) <  MAX_RHEIGHT && 0 < currRoom.rX + int(sin(i)) && currRoom.rX + int(sin(i)) < MAX_RWIDTH && map[currRoom.rY + int(cos(i))][currRoom.rX + int(sin(i))] != null){
        beginShape();
        println(int(cos(i + PI)) + " " + int(sin(i)));
        vertex(p + (r * b / 2 + b / 2) * (1 + cos(i + PI)), p + (r * b / 2 - b / 2) * (1 + sin(i)));
        vertex(p + (r * b / 2 - b / 2) * (1 + cos(i + PI)), p + (r * b / 2 - b / 2) * (1 + sin(i)));
        vertex(p + (r * b / 2 - b / 2) * (1 + cos(i + PI)) + DOOR_LENGTH * cos(i + PI), p + (r * b / 2 + b / 2) * (1 + sin(i)) + DOOR_LENGTH * sin(i));
        vertex(p + (r * b / 2 + b / 2) * (1 + cos(i + PI)) + DOOR_LENGTH * cos(i + PI), p + (r * b / 2 + b / 2) * (1 + sin(i)) + DOOR_LENGTH * sin(i));
        endShape();
      }
      
    }
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
    spawn = new Spawn(int(random(MAX_RWIDTH)), int(random(MAX_RHEIGHT)));
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
       boss = new Room(x , y);
       map[y][x] = boss;
       return true;
    }
    int bX = int(pow(-1, int(random(2))));
    int bY = int(pow(-1, int(random(2))));
    
    if(boolean(int(random(2)))){
      if(setRooms(x + bX, y, trail++) || setRooms(x - bX, y, trail) || setRooms(x, y + bY, trail) || setRooms(x, y - bY, trail)){
        map[y][x] = new Room(x , y);
        return true;
      }
      return false;
    }else if(setRooms(x, y + bY, trail) || setRooms(x, y - bY, trail) || setRooms(x + bX, y, trail++) || setRooms(x - bX, y, trail) ){
        map[y][x] = new Room(x , y);
        return true;
      }
      return false;
  }
 
}
