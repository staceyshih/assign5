class Ball
{
float r;
float ballX=width/2; 
float ballY;

float speedX;
float speedY;

int life;



  Ball(float x, float y,  int l) {
    this.ballX = x;
    this.ballY = y;
    life = l;
    this.speedX=random(3);
    this.speedY=random(3);
    this.r=15;
  } 

  void ballMoving(){
    
    ballX+=speedX;
    ballY+=speedY;
    
    if(ballX<r||ballX>width-r){
    speedX*=-1;
    }
    if(ballY<r){
    speedY*=-1;
    }
    if (ballY>height-r){
      ballX=bar.barX;
      ballY=bar.barY-20;
    }
    
    float bottom = ballY+r;
    float bl = bar.barY - 5;
    float bLeft = bar.barX-50;
    float bRight = bar.barX+50;
    if (bottom >= bl && ballX >bLeft && ballX<bRight){
        speedY *= -1;
      
    }

  }
  
   void display(){
    noStroke();
    fill(255);
    ellipse(ballX,ballY,r,r);
  }

  }
