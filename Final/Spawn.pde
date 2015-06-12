
class Spawn extends Room{
 
  String ROOM_LOC = Final.PROJ_LOC + "/Special/Empty.txt";

  Spawn(int rX, int rY){
    type = "Spawn";
    this.rX = rX;
    this.rY = rY;
    room = new Entity[ROOM_SIZE][ROOM_SIZE]; 
  }
  void load(){
     
  }
 
}

