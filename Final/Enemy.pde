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
  int speed;
  
  PImage img;
  int seq;//Sequence of movement; for animation
  
  Enemy(String name){
    type = "Enemy";
    seq = int(random(3)) + 1;
    load(name);
    img = loadImage(Final.IMG_LOC + name + "_" + seq + Final.IMG_END);
    speed = 5;
  }
  
  void hit(){
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
      
    }catch(IOException e){println(e);} 
  }
  
  void setLoc(int x, int y){
    this.cx = x + Room.BOX_SIZE / 2;
    this.cy = y + Room.BOX_SIZE / 2;
  }
  
  void display(){
    int pX = Final.player.x;
    int pY = Final.player.y;
    
    Room loaded = Final.currFloor.currRoom;
    int check = -1;
    boolean direct = false;
    if(seq % 10 == 0){
      check = int(pow(-1,int(random(2))));
      direct = boolean(int(random(2)));
      seq = 0;
    }
    seq++;
    
    
    
    int XD = abs(pX - cx);
    int YD = abs(pY - cy);
    
    
    if(direct){
       if(loaded.canMove(cx + check * speed, cy, radius)){cx += check * speed;}
       else if(loaded.canMove(cx - check * speed, cy, radius)){ cx -= check * speed;}
    }else{
      if(loaded.canMove(cx, cy + check * speed, radius)){ cy += check * speed;}
      else if( loaded.canMove(cx, cy - check * speed, radius)){ cy -= check * speed;}
      
    }
    
    image(img, cx - Room.BOX_SIZE / 2, cy - Room.BOX_SIZE / 2, Room.BOX_SIZE - 10, Room.BOX_SIZE - 10);
  }
}
