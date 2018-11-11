class Paddle {
  //position vector
  //diameter
  //flags for moving left or right
  //set the speed
  //set the yoffset
  
  PVector position;
  int diameter;
  boolean movingRight;
  boolean movingLeft;
  float speed;
  float yoffset;
  
  Paddle(PVector p_, float d_){
    position = p_;
    diameter = d_;
  }
  void update(Ball b){
    //If the flag is set, update that direction
    //this.draw();
  }
  
  float move(){
    //return the change in x based off of movement flags
  }

  boolean moveable(Ball b){
    //Check that the distance between the centers 
    //  is less than the sum of the radii.
  }


  void draw(){
    //Draw an arc using the CHORD parameter from theta past PI to theta shy of 2*PI
    //Add the radius to the y position and subtract the y offset. 
    //ellipse(p.x, p.y, d,d);
    
    arc(400,0,100,50, PI, TWO_PI, CHORD);
  }
  void keyPressed(){
    if(key == CODED){
      if(keyCode == RIGHT){
        movingRight = true;
      }
      if(keyCode == LEFT){
        movingLeft = true;
      }
    }
  }
  void keyReleased(){
    if(key == CODED){
      if(keyCode == RIGHT){
        movingRight = false;
      }
      if(keyCode == LEFT){
        movingLeft = false;
      }
    }
  }
}
