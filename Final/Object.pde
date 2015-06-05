
class Object extends Entity{
 
  
  Object(String name){
    type = "Object";
    load(name);
    
    
  }
  
  void load(String name){
    this.name = name;
  }
  
  void display(){
     fill(colorScheme[RED], colorScheme[GREEN], colorScheme[BLUE]);
     rect(x, y, Room.BOX_SIZE, Room.BOX_SIZE);
  }
}
