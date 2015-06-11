
class Object extends Entity{
  String FILES = "/Objects/";
  String FILE_END = ".txt";
  
  Object(String name){
    type = "Object";
    load(name);
  }
  
  void load(String name){
    this.name = name;
    try{
      BufferedReader file = new BufferedReader(new FileReader(Final.PROJ_LOC + FILES + name + FILE_END)); 
      String line = file.readLine(); 
      while(line != null){
        String[] key = line.split("=");
        if(key[0].equals("solid")){solid = boolean(key[1]);}
        line = file.readLine();
      }
      file.close();
      
    }catch(IOException e){println(e);}
  }
  
  void display(){
     fill(colorScheme[RED], colorScheme[GREEN], colorScheme[BLUE]);
     rect(x, y, Room.BOX_SIZE, Room.BOX_SIZE);
  }
}
