class Ball {
  //Declare position, velocity, diameter, speed, score

  PVector position;
  PVector velocity;
  float diameter;
  float speed;
  float score;
  boolean hateCollisions;

  Ball(float x_, float y_, float d_){
    position = new PVector(x_,y_);
    diameter = d_;
    velocity = new PVector(1, -3);
    speed = 4;
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
        
        //println("n before normalize: " + n.x + ", " + n.y);
        n.normalize();
        //println("n after normalize: " + n.x + ", " + n.y);
        println();
        
        float temp = 2 * PVector.dot(velocity,n);
        n.mult(temp);
        //println("n after mult: " + n.x + ", " + n.y);
        r = PVector.sub(velocity, n);
        //println("r: " + r.x + ", " + r.y);
        r.normalize();
        velocity = PVector.mult(r,speed);
        //println("velocity: " + velocity.x + ", " + velocity.y);

      
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
          
    hateCollisions = false;      
          
    if(b.alive){
      
      PVector temp;
      temp = PVector.add(position,velocity);
      
      float DeltaX = position.x - max(b.tl.x, min(position.x, b.tl.x + b.wh.x));
      float DeltaY = position.y - max(b.tl.y, min(position.y, b.tl.y + b.wh.y));
      boolean colliding = (DeltaX * DeltaX + DeltaY * DeltaY) < (diameter/2 * diameter/2);
        
      colliding = position.x + (int)diameter/2 > b.tl.x &&
            position.y + (int)diameter/2 > b.tl.y &&
            position.x - (int)diameter/2 < b.wh.x &&
            position.y - (int)diameter/2 < b.wh.y;
        
        
      if(colliding){
        
         //println(b.tl.x + ", " + b.tl.y + " - " + b.wh.x + ", " + b.wh.y);
        hateCollisions = true;
        if(!b.wall){
         b.alive = false; 
         score++;
        }
        
        if(temp.x <= b.wh.x && temp.x >= b.tl.x){
         velocity.set(velocity.x, -velocity.y);
         //println("velocity: " + velocity.x + ", " + velocity.y);
        }
        
        else if(temp.y <= b.wh.y && temp.y >= b.tl.y){
         velocity.set(-velocity.x, velocity.y);
         //println("velocity: " + velocity.x + ", " + velocity.y);
        }
        
        else{velocity.set(-velocity.x, velocity.y);}
        
      }
    }      
  }
  
  void draw (){
    //draw an ellipse, or draw with the shader via GameState
    
    //ellipse(p.x, p.y, d,d);
    
    ellipse(position.x, position.y, diameter, diameter);
  }
}
