
class Spawn extends Room{
 
  String ROOM_LOC = Final.PROJ_LOC + "/Special/Spawn.txt";

  Spawn(int rX, int rY){
    println("yes??");
    type = "Spawn";
    this.rX = rX;
    this.rY = rY;
    room = new Entity[ROOM_SIZE][ROOM_SIZE]; 
  }  
}

