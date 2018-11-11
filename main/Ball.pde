class Ball {
  //Declare position, velocity, diameter, speed, score

  PVector position;
  PVector velocity;
  float diameter;
  float speed;
  float score;


  Ball(float x_, float y_, float d_){
    position.set(x_,y_);
    diameter = d_;
  }
  
  void update(){
    position.add(velocity);
  }
  
  void collide_circle(Paddle pad){
    //Check that the distance between the centers 
    //  is less than the sum of the radii.
    //if so
      //Calculate the reflection vector R where n is the normal
      //Reflection_n(v) = v - 2(dot(v,n))n
      
      
      
      float d = pad.position.dist(position);
      if((d) < ((diameter/2)+(pad.diameter/2))){
        
        PVector r;
        PVector n;
        n = PVector.sub(position, pad.position);
        n.normalize();
        
        float temp = 2 * PVector.dot(velocity,n);
        PVector.mult(n,temp);
        r = PVector.sub(velocity, n);
      
        velocity = PVector.mult(r,speed);
      
      }
  }

  void collide_box(Box b){
    //Is the box "alive"?
      //Make a new position vector which is the position plus the velocity (using new PVector)
      //Why do we do this?
      //So that we don't update that way if we were going to collide.

      //Use the following site to determine if the box collides
      //https://yal.cc/rectangle-circle-intersection-test/
  
      //Check if the circle and box are colliding
        //If they are
        //If it's not a wall, make it not alive, increase score
        //If it's on the left or right, flip the x velocity
        //If it's on the top or bottom, flip the y velocity
        //calculate bools
        //is the position between the y or x bounds of the box?
        //if so, flip the direction 
          //(ex, between x bounds means it's above or below)
        //otherwise
          //Use the same reflection, assume the box is a square
          //then treat the box as a circle
          
          
          
    if(b.alive){
      
      PVector temp;
      temp = PVector.add(position,velocity);
      
      float DeltaX = position.x - max(b.tl.x, min(position.x, b.tl.x + b.wh.x));
      float DeltaY = position.y - max(b.tl.y, min(position.y, b.tl.y + b.wh.y));
      boolean colliding = (DeltaX * DeltaX + DeltaY * DeltaY) < (diameter/2 * diameter/2);
        
      if(colliding){
        
        if(!b.wall){
         b.alive = false; 
         score++;
        }
        
      }
    }      
  }
  
  void draw (){
    //draw an ellipse, or draw with the shader via GameState
    
    //ellipse(p.x, p.y, d,d);
    
    ellipse(position.x, position.y, diameter, diameter);
  }
}
