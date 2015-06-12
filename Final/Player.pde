
class Player extends Entity{
  
  int PLAY_R = Room.BOX_SIZE;
  
  int hp;
  int ammo;
  String name;
  int damage;
  //Weapon weapon;
  
  int speed;
  
  Player(){
    type = "Player";
    x = width / 2;
    y = height / 2;
    speed = 5;
    ammo = 100;
  }
  
  void display(boolean[] keys){
    
    Room loaded = Final.currFloor.currRoom;
   
   if(keys[int('w')] || keys[int('W')] && loaded.canMove(x, y - speed)) y -= speed;
   if(keys[int('a')] || keys[int('A')] && loaded.canMove(x - speed, y)) x -= speed;
   if(keys[int('s')] || keys[int('S')] && loaded.canMove(x, y + speed)) y += speed;
   if(keys[int('d')] || keys[int('D')] && loaded.canMove(x + speed, y)) x += speed;
   fill(255,0,0);
   rect(x - PLAY_R / 2 , y - PLAY_R / 2, PLAY_R, PLAY_R);
  }
  
  void fireAt(float x, float y){
    if(ammo > 0){
      Final.currFloor.currRoom.bullets.add(new Bullet(this.x, this.y, x, y));
    } 
  }
  
}
