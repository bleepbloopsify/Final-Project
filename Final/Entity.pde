
class Entity{
  //Instance
  boolean dies;
  int lifespan;//How long the object appears for
  
  int rX, rY;//The coordinates in the room
  
  String type;//Enemy? Object? Neither?
  boolean solid;//Can I walk through you?
  
  int[] colorScheme = {0,100,150};
  int RED = 0;
  int GREEN = 1;
  int BLUE = 2;
  
  void display(){
  }
}
