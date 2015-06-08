import java.io.*;
import java.util.*;
String FILE = "/Rooms/";
String ROOM = "Room_";
String BOSS = "Boss_";
String FILE_END = ".txt";
//String PROJ_LOC = "/home/students/2016/leon.chou/Final-Project";
String PROJ_LOC = "C:/Users/Leon/Desktop/Final-Project";

String ENEMY_NAMES = "/Enemy_Names.txt";
ArrayList<String> enemyList;

String[] things = {"wall", "hole", "item"};
int[][] thingColorSeq = {{255,255,255},{100,100,100},{0,255,0}, {200,0,0}};


int SELECT_SIZE;

//Separator Chars
char colsep = ' ';
char rowsep = '\n';


//Screen Constants
int ROOM_SIZE = 15;//boxes
int BOX_SIZE = 40;//px
int PADDING = 100;//px

//Instance
String[][] map;//created map
int x, y;//saves mouse variables
String select;

boolean boss = false;
boolean grid = true;

void setup(){
  size(ROOM_SIZE * BOX_SIZE + PADDING*2, ROOM_SIZE * BOX_SIZE + PADDING*2);
  background(0);
  select = null;
  map = new String[ROOM_SIZE][ROOM_SIZE];
  SELECT_SIZE = PADDING;
  enemyList = loadList(PROJ_LOC +ENEMY_NAMES);
}

ArrayList<String> loadList(String fileName){
  ArrayList<String> list = new ArrayList<String>();
  try{
    BufferedReader file = new BufferedReader(new FileReader(fileName));
    String line = file.readLine();
    while(line != null){
      list.add(line);
      line = file.readLine();
    }
  }catch(IOException e){ println(e);}
    
  return list;
  
}

void mouseMoved(){
  x = mouseX;
  y = mouseY;
}

void mouseReleased(){
  if( onBoard(mouseX, mouseY)){
    map[room(mouseY)][room(mouseX)] = select;
  }else{
    select = mouseOn(mouseX, mouseY);
  } 
}

void mouseDragged(){
  if( onBoard(mouseX, mouseY)){
    map[room(mouseY)][room(mouseX)] = select;
  }
  
}
void keyPressed(){
  for(String[] line : map)
   println(line);
  println(System.getProperty("user.dir"));
}

void draw(){
  background(0);
  displaySidebars();
  displayMap();
  if( grid ){
    displayGrid();
  }
}

void displaySidebars(){
  strokeWeight(6);
  stroke(255);
  for(int i = 0; i < things.length; i++){
    int[] colorSeq = thingColorSeq[i];
    fill(colorSeq[0], colorSeq[1], colorSeq[2]);
    rect(0, PADDING * (i + 1), PADDING, PADDING);
  }
  stroke(100,0,0);
  for(int i = 0; i <= enemyList.size(); i++){
    if(i < enemyList.size()){
      fill(255);
      rect(PADDING + BOX_SIZE * ROOM_SIZE, PADDING * (i + 1), PADDING, PADDING);
      fill(0);
      textSize(12);
      text( enemyList.get(i),PADDING + BOX_SIZE * ROOM_SIZE + PADDING / 5, PADDING * (i + 1.5));
    }else{
      fill(255);
      rect(PADDING + BOX_SIZE * ROOM_SIZE, PADDING * (i + 1), PADDING, PADDING);
      fill(0);
      textSize(12);
      text( "Export",PADDING + BOX_SIZE * ROOM_SIZE + PADDING / 5, PADDING * (i + 1.5));
    }
  }
  
}

void displayMap(){
  strokeWeight(3);
  stroke(0);
  for(int mY = 0; mY < ROOM_SIZE; mY++){
    for(int mX = 0; mX < ROOM_SIZE; mX++){
      if(map[mY][mX] != null){
        int[] colorSeq = getColorSeq(map[mY][mX]);
        fill(colorSeq[0], colorSeq[1], colorSeq[2]);
        rect(board(mX), board(mY), BOX_SIZE, BOX_SIZE); 
      }
    } 
  }
  noFill();
  strokeWeight(6);
  stroke(255);
  rect(PADDING,PADDING, ROOM_SIZE * BOX_SIZE, ROOM_SIZE * BOX_SIZE);
  noStroke();
}

int[] getColorSeq(String thing){
  return thingColorSeq[index(things, thing)];
}

int index(String[] stuff, String thing){
  for(int i = 0; i < stuff.length; i++){
    if(stuff[i].equals(thing)){
      return i;
    }
  }
  return stuff.length;
}

int board(int coord){
  return PADDING + coord * BOX_SIZE; 
}

void displayGrid(){
  noFill();
  strokeWeight(2);
  stroke(200);
  for(int i = 0; i < ROOM_SIZE; i++){
     line(board(i), PADDING, board(i), board(ROOM_SIZE));
     line(PADDING, board(i), board(ROOM_SIZE), board(i));
  }
}

int room(int coord){
  return (coord - PADDING) / BOX_SIZE;  
}

String mouseOn(int x, int y){
   if(x < PADDING){
     if(0 <= (y - PADDING) / SELECT_SIZE && (y - PADDING) / SELECT_SIZE < things.length){
       return things[(y - PADDING) / SELECT_SIZE];
     }else{
       return null;
     }
   }else{
     if(0 > (y-PADDING) / SELECT_SIZE || (y - PADDING) / SELECT_SIZE > enemyList.size()){
       return null;
     }
     if((y - PADDING) / SELECT_SIZE == enemyList.size()){
       export();
       println("Export!");
       return null;
     }
     return enemyList.get((y - PADDING)/SELECT_SIZE);
   }   
}

boolean onBoard(int x, int y){
  return PADDING < x && x < width - PADDING && PADDING < y && y < height - PADDING;
}

void export(){
  for(int i = 0; i < ROOM_SIZE * ROOM_SIZE; i++){
    if(map[i / ROOM_SIZE][i % ROOM_SIZE] == null)
     map[i / ROOM_SIZE][i % ROOM_SIZE] = "floor"; 
  }
  
  
  String newfile = PROJ_LOC + FILE;
  try{
    File folder = new File(newfile);
    File[] files = folder.listFiles();
    if(boss){
      newfile += BOSS + files.length;
    }else{
      newfile += ROOM + files.length;
    }
    newfile += FILE_END;
  }catch(Exception e){println(e);}
    
  try{
    PrintWriter writer = new PrintWriter(newfile, "UTF-8");
    for(String[] line : map){
      String l = "";
      for(String s : line)
        l += s + " ";
      writer.println(l);
    }
    writer.close();
  }catch(IOException e){println(e);}
  map = new String[ROOM_SIZE][ROOM_SIZE];
  
  
  
}
