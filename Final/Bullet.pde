
class Bullet extends Entity{
  
  int BULLET_SPEED = 20;
  int hp;
  
  Bullet(int x, int y, int tX, int tY){
    float angle = atan( ( tY - y) / (tX - x) );
    this.x = x;
    this.y = y;
    
    this.i = BULLET_SPEED * sin(angle);
    this.j = BULLET_SPEED * cos(angle);
    
    this.hp = 100;
  }
  
  void display(){
    if(hitEnemy(int(x + i), int(y + j))){
      this.hp = 0;
    }
    strokeWeight(1);
    stroke(0);
    line(x, y, x + i, y + j);
    x += i;
    y += j;
    
  }
  
  
  boolean hitEnemy(int x, int y ){
    ArrayList<Enemy> e = Final.currFloor.currRoom.enemyList;
    for(int i = 0; i < e.size(); i++){
      Enemy here = e.get(i);
      if( pow(x - here.x, 2) + pow( y - here.y, 2) < pow(here.radius, 2) ){
        here.hit();
        if(here.hp <= 0){
          e.remove(i);
        }
        return true;       
      }
    }
    return false;
  }
  
  
}
