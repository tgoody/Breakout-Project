class Ball {
  //Declare position, velocity, diameter, speed, score

  Ball(float x_, float y_, float d_){
    //Initialize position, velocity, diameter, speed
  }
  
  void update(){
    //update the position
  }
  
  void collide_circle(Paddle pad){
    //Check that the distance between the centers 
    //  is less than the sum of the radii.
    //if so
      //Calculate the reflection vector R where n is the normal
      //Reflection_n(v) = v - 2(dot(v,n))n
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
  }
  
  void draw (){
    //draw an ellipse, or draw with the shader via GameState
  }
}
