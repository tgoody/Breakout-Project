class GameState {
  //create a PShader (fragment shader) and PImage (texture)
  //create some helper variables (s,w,h)
  //time variable
  
  //Declare a: Ball, Paddle, Box[] walls, and Box[] level

  GameState(int w_, int h_, String glsl, String texture){
    //set variables
    //create ball, paddle, walls, level
  }

  Box[] level0(){
    //Create a grid of boxes
  }

  void update(){
    //update ball and paddle, call collisions, increase time, and draw
  }
  
  void collisions(){
    //collide walls, levels, and ball-paddle
  }
  
  void draw(){
    //draw shader, draw boxes, check/print score/win
  }
  
  Box[] makeWalls(PImage img){
    //Make 3 boxes (left, top, right) as walls
  }
  

  void ballBoxCollisions(Box[] boxes){
    //collide for each in an array of boxes
  }

  void boxArrDraw(Box[] boxes){
    //draw for each in an array of boxes
  }

  void doShaderStuff(){
    //Update the time, pass the relevant uniform variables
  }
  
  void checkWin(){
    //if there aren't any boxes left, print "You Win"
    //otherwise print the current score
  }
  
  boolean hasAlive(Box[] boxes){
    //Check to see if the level has a box left
  }
  
  void keyPressed(){
    //call the paddle's keyPressed command
  }
  void keyReleased(){
    //call the paddle's keyReleased command
  }
}
