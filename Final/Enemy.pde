import java.util.*;
import java.io.*;
class Enemy extends Entity{
  final static String FILES = "/Enemies/";
  final static String FILE_END = ".txt";
  
  final static int NAME_POS = 0;
  final static int VALUE_POS = 1;
  
  int hp;//health = base hp * floor * modifier
  int cx, cy;//center in px
  int radius;//radius of the guy in px
  
  float i, j;//vector in the form ai + bj, where i = <1,0> and j = <0,1>
  
  int seq;//Sequence of movement; for animation
  
  Enemy(String name){
    type = "Enemy";
    seq = int(random(3)) + 1;
    load(name);
  }
  
  void load(String name){
    try{
      BufferedReader file = new BufferedReader(new FileReader(Final.PROJ_LOC + FILES + name + FILE_END)); 
      String line = file.readLine(); 
      while(line != null){
        String[] key = line.split("=");
        if(key[NAME_POS].equals("hp")){hp = Integer.parseInt(key[VALUE_POS]);}
        if(key[NAME_POS].equals("name")){this.name = key[VALUE_POS];}
        if(key[NAME_POS].equals("radius")){radius = Integer.parseInt(key[VALUE_POS]);}
        line = file.readLine();
      }
      file.close();
      println(name);
    }catch(IOException e){println(e);} 
  }
  
  void setLoc(int x, int y){
    this.cx = x + Room.BOX_SIZE / 2;
    this.cy = y + Room.BOX_SIZE / 2;
  }
  
  void display(){

    if(name == null || name.equals("null")) {println("NAME IS NULL");return;}
    PImage img = loadImage(Final.IMG_LOC + name + "_" + seq + Final.IMG_END);
    image(img, cx - Room.BOX_SIZE / 2, cy - Room.BOX_SIZE / 2, Room.BOX_SIZE - 10, Room.BOX_SIZE - 10);
    seq = (seq + 1) % 3 + 1;
  }
}
