class Bar{
int h;
float w;
float barX=width/2;
float barY;

void barMoving(){
  barX=width/2;
  barX=mouseX;
  barY=height-h/2-10;
}

  void display(){
  
  rectMode(CENTER);
  rect(barX,barY,w,h);
  }
  
 
  
   Bar(){//constructor
   barX=mouseX;
   barY=height-h/2-10;
   w=100;
   h=20;
  }
  
}
