class GameState {
  //create a PShader (fragment shader) and PImage (texture)
  //create some helper variables (s,w,h)
  //time variable
  int time;
  //Declare a: Ball, Paddle, Box[] walls, and Box[] level
  
  PShader shader;
  PImage pimg;
  Paddle paddle;
  Ball ball;
  Box[] walls;
  Box[] level;
  float w;
  float h;
  

  GameState(int w_, int h_, String glsl, String texture){
    //set variables
    //create ball, paddle, walls, level
    w = w_;
    h = h_;
    ball = new Ball(w/2, h/2, 10);
    PVector starting = new PVector(w/2, 20);
    paddle = new Paddle(starting, 200);
    walls = makeWalls(pimg);
    level = level0();
  }

  Box[] level0(){
    //Create a grid of boxes
    //6 x 10 boxes
    
    level = new Box[60];
    int i = 0;
    
    for(int vert = 0; vert < 6; vert++){
      for(int horiz = 0; horiz < 10; horiz++){
        
        float x = horiz*12;
        float y = vert*12;
        
        level[i] = new Box(x,y,x+10,y+10,false,pimg);
      
      
      
        i++;
      } 
    }
    
    return level;
  }

  void update(){
    //update ball and paddle, call collisions, increase time, and draw
    
    ball.update();
    paddle.update(ball);
    collisions();
  }
  
  void collisions(){
    //collide walls, levels, and ball-paddle
  }
  
  void draw(){
    //draw shader, draw boxes, check/print score/win
  }
  
  Box[] makeWalls(PImage img){
    
     walls = new Box[3];
    
     walls[0] = new Box(0, 0, 20, h, true, img);
     walls[1] = new Box(20, 0, w-20, 20, true, img);
     walls[2] = new Box(w-20, 0, w, h, true, img);


    return walls;
  }
  

  void ballBoxCollisions(Box[] boxes){
    //collide for each in an array of boxes
  }

  void boxArrDraw(Box[] boxes){
    
    for(Box box : boxes){
      box.draw(pimg);
    }
    
  }

  void doShaderStuff(){
    //Update the time, pass the relevant uniform variables
    
    if(millis()%1000 == 0){
     time++; 
    }
    
    
  }
  
  void checkWin(){
    

    if(!hasAlive(level)){
     //print you win 
     return;
    }
    
    else{
      //print scoore
      return;
    }
    
    
    
    
    //if there aren't any boxes left, print "You Win"
    //otherwise print the current score
  }
  
  boolean hasAlive(Box[] boxes){
    boolean leftover = false;
    
    for(Box box : boxes){
      if(box.alive){
        leftover = true;
        break;
      }
    }
    
    return leftover;
    
    
  }
  
  void keyPressed(){
    paddle.keyPressed();
  }
  void keyReleased(){
    paddle.keyReleased();
  }
}
