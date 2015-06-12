
class Bullet extends Entity{
  
  int BULLET_SPEED = 20;
  int hp;
  
  Bullet(int x, int y, float tX, float tY){
    
    this.x = x;
    this.y = y;
    
    i = tX - x;
    j = tY - y;
    
    int quad = 0;
    if( i >= 0 && j >= 0) quad = 1;
    if( i < 0 && j >= 0) quad = 2;
    if( i < 0 && j < 0) quad = 3;
    if( i >= 0 && j < 0) quad = 4;
    
    float angle = 0.0;
    if(i != 0){
      angle = atan( j / i );
    }else{ angle = atan(1); }
    
    if(quad != 0){
      if(quad == 1){
        i = BULLET_SPEED * cos(angle); 
        j = BULLET_SPEED * sin(angle);
      }
      if(quad == 2){
        i = BULLET_SPEED * (cos(angle) - 1);
        j = BULLET_SPEED * sin(angle);
      }
      if(quad == 3){
        i = BULLET_SPEED * (cos(angle) - 1);
        j = BULLET_SPEED * (sin(angle) - 1);
      }
      if(quad == 4){
        i = BULLET_SPEED * cos(angle);
        j = BULLET_SPEED * (sin(angle) - 1);
      }
      
      
    }
    
    
    
    this.hp = 100;
  }
  
  void display(){
    if(hitEnemy(int(x + i), int(y + j))){
      this.hp = 0;
    }
    strokeWeight(1.5);
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
