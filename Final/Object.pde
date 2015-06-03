
class Object extends Entity{
 
  
  Object(String name){
    type = "Object";
    load(name);
    
    
  }
  
  void load(String name){
    
  }
  
  void display(){
     fill(colorScheme[RED], colorScheme[GREEN], colorScheme[BLUE]);
     rect(Room.PADDING + rX * Room.BOX_SIZE, Room.PADDING + rY * Room.BOX_SIZE, Room.BOX_SIZE, Room.BOX_SIZE);
  }
}
