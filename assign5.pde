

Ball myball;
Bar bar;
Brick brick;
Brick []aList;
Ball [] bList;

//Game Status
final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;

int status;              //Game Status



void setup(){
  size(640,480);
  bar=new Bar();
  myball= new Ball(width/2,bar.barY-5,3);
  bList= new Ball[100];
  aList = new Brick[51];
}



void drawLife() {
  fill(230, 74, 96);
  text("LIFE:", 36, 455);
  for(int cx=78;cx<198;cx+=40){
  ellipse(cx,450,15,15);
  fill(230, 74, 96); 
  noStroke(); 
  }
}


void brickMaker(int total,int numInRow) {

  int ox = 80; 
  int oy = 40; 
  int xSpacing = 50; 
  int ySpacing = 40; 

  for (int i=0; i <=total; i++) {

    int x = ox + (xSpacing*(i % numInRow));
    int y = oy + (ySpacing*int(i / numInRow));

    //aList[0]= new Alien(ox,oy);
    aList[i]= new Brick(x, y);
  }
}

void keyPressed() {
 
  statusCtrl();
}

void printText(int s){
  if(s==0){
    textSize(60);
    textAlign(CENTER);
    text("PONG",width/2,height/2);
    fill(95,194,226);
  
    textSize(20);
    textAlign(CENTER);
    text("Press ENTER to Start",width/2,height/2+60);
    fill(95,194,226);
    }
 
  if(s==3){
    textSize(40);
    textAlign(CENTER);
    text("WIN",width/2,height/2);
    fill(95,194,226);
    
    textSize(20);
    textAlign(CENTER);
    text("Press ENTER to Restart",width/2,height/2+40);
    fill(95,194,226); 
   
  
    }
  if(s==4){
    textSize(40);
    textAlign(CENTER);
    text("LOSE",width/2,height/2);
    fill(95,194,226); 
    
    textSize(20);
    textAlign(CENTER);
    text("Press ENTER to Restart",width/2,height/2+40);
    fill(95,194,226);  
  
    }
    
}


void draw() {
  
  background(50,50,50);
  noStroke();
  

 
  switch(status) {

  case GAME_START:
    printText(0);
  break;

  case GAME_PLAYING:
    background(50, 50, 50);
    drawLife();
    drawBrick();
    ballShoot();
    checkWin();
    checkBrickHit(); /*finish this function*/
    
    break;

  case GAME_WIN:
     printText(3);
  
    break;

  case GAME_LOSE:
    printText(4);
 
      
    break;
  }
}

void ballShoot(){
  bar.display();
  myball.display();
   bar.barMoving();
   myball.ballMoving();
 
}




void checkBrickHit() {
  for (int i=0; i<bList.length-1; i++) {
    Ball balls = bList[i];
    for (int j=0; j<aList.length-1; j++) {
      Brick brick = aList[j];
      if (myball != null&& brick!=null && brick.die // Check Array isn't empty and bullet / alien still exist
      && myball.ballX < brick.bX + brick.w/2 && myball.ballX > brick.bX - brick.w/2 && myball.ballY < brick.bY + brick.h/2 && myball.ballY > brick.bY + brick.h/2) {
     
        removeBrick(brick);
      }
    }
  }
}



void checkWin() {

  boolean leftBrick = false; 

  for (int i=0; i<aList.length-1; i++) {
    Brick brick = aList[i]; 
    if (brick!=null && !brick.die) { 
    leftBrick = true;
      break ;
    }
  }
  if(!leftBrick){
  status = GAME_WIN;
  }
 
}

void drawBrick(){
for (int i=0; i<aList.length-1; i++) {
    Brick brick = aList[i];
    if (brick!=null && !brick.die) { // Check Array isn't empty and bricks still exist
      brick.display(); //Draw 

      }else{
        
      status=GAME_WIN;
      
     }  
   }
}


void removeBrick(Brick obj) {
  obj.die = true;
  obj.bX = 1000;
  obj.bY = 1000;
}

void reset() {
  for (int i=0; i<bList.length-1; i++) {
    bList[i] = null;

  }

  for (int i=0; i<aList.length-1; i++) {
    aList[i] = null;
  }

  myball.life = 3;
  brickMaker(50, 10);

  myball.ballX = bar.barX;
  myball.ballY = 460;

}


void mouseClicked(){
  if(mouseButton==RIGHT){
  status = GAME_PLAYING;
  
  }
}

void statusCtrl() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      reset();
      myball.life = 3;
      break;

    case GAME_WIN:
      status = GAME_PLAYING;
      reset();
      break;

    case GAME_LOSE:
      status = GAME_PLAYING;
      reset();
      break;
    }
  }
}
