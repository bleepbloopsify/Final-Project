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
  
  Enemy(String name){
    type = "Enemy";
    try{
      BufferedReader file = new BufferedReader(new FileReader(Final.PROJ_LOC + FILES + name + FILE_END)); 
      String line = file.readLine();
      while(line != null){
        String[] key = line.split("=");
        if(key[NAME_POS].equals("hp")){hp = Integer.parseInt(key[VALUE_POS]);}
        if(key[NAME_POS].equals("name")){name = key[VALUE_POS];}
        if(key[NAME_POS].equals("radius")){radius = Integer.parseInt(key[VALUE_POS]);}
      }
    }catch(IOException e){println(e);}
    
  }
  
}
