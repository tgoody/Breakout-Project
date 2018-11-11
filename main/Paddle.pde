class Paddle {
  //position vector
  //diameter
  //flags for moving left or right
  //set the speed
  //set the yoffset
  
  PVector position;
  float diameter;
  boolean movingRight;
  boolean movingLeft;
  float speed = 5;
  float yoffset;
  
  Paddle(PVector p_, float d_){
    position = p_;
    diameter = d_;
  }
  void update(Ball b){
    //If the flag is set, update that direction
    //this.draw();
    position.set(position.x + this.move(), position.y);
    this.draw();
    
    
    
  }
  
  float move(){
    if(movingRight && !movingLeft){
      //position.add(5,0);
      return 5.0f;
    }
    
    if(movingLeft && !movingRight){
      //position.add(-5,0);
      return -5.0f;
    }
    
    return 0.0f;
    
  }

  boolean moveable(Ball b){
    //Check that the distance between the centers 
    //  is less than the sum of the radii.
    
    return true;
  }


  void draw(){
    //Draw an arc using the CHORD parameter from theta past PI to theta shy of 2*PI
    //Add the radius to the y position and subtract the y offset. 
    //ellipse(p.x, p.y, d,d);
    
    arc(position.x,position.y,diameter,diameter, PI, TWO_PI, CHORD);
  }
  void keyPressed(){
    if(key == CODED){
      if(keyCode == 39){
        movingRight = true;
      }
      if(keyCode == 37){
        movingLeft = true;
      }
    }
  }
  void keyReleased(){
    if(key == CODED){
      if(keyCode == 39){
        movingRight = false;
      }
      if(keyCode == 37){
        movingLeft = false;
      }
    }
  }
}
