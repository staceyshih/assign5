class Brick{

  float bX;
  float bY;
  boolean die = false; 
  int w;
  int h;
 
  Brick(int x,int y) {
    bX = x;
    bY = y;
    
  }



void display(){
  
    noStroke();
    fill(220);
    rectMode(CENTER);
    rect(bX,bY,40,30);
}

}
