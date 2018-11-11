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
  String message;
  

  GameState(int w_, int h_){
    //set variables
    //create ball, paddle, walls, level
    w = w_;
    h = h_;
    ball = new Ball(200, height-100, 15);
    PVector starting = new PVector(w/2, h+40);
    paddle = new Paddle(starting, 200);
    walls = makeWalls(pimg);
    level = level0();
  }

  Box[] level0(){
    //Create a grid of boxes
    //6 x 10 boxes
    
    level = new Box[60];
    int i = 0;
    float x = 0;
    float y = 0;
    
    for(int vert = 0; vert < 6; vert++){
      for(int horiz = 0; horiz < 10; horiz++){
        
        x = (horiz*45) + 175;
        y = (vert*45) + 225;
        
        
        
        level[i] = new Box(x,y,x+40,y+40,false,pimg);
      
      
      
        i++;
      } 
    }
    
    
    //for(Box box : level){
     
    //  println(box.tl.x + ", " + box.tl.y + " - " + box.wh.x + ", " + box.wh.y); //<>//
      
    //}
    
    return level;
  }

  void update(){
    //update ball and paddle, call collisions, increase time, and draw
    
    ball.update();
    paddle.update(ball);
    collisions();
    checkWin();
    draw();
  }
  
  void collisions(){
    //collide walls, levels, and ball-paddle
    
    ballBoxCollisions(walls);
    ballBoxCollisions(level);
    ball.collide_circle(paddle);
    
  }
  
  void draw(){
    //draw shader, draw boxes, check/print score/win
    
    
    boxArrDraw(walls);
    boxArrDraw(level);
    ball.draw();
    
  }
  
  Box[] makeWalls(PImage img){
    
     walls = new Box[3];
    
     walls[0] = new Box(0, 0, 100, h, true, img);
     walls[1] = new Box(100, 0, w-100, 100, true, img);
     walls[2] = new Box(w-100, 0, w, h, true, img);


    return walls;
  }
  

  void ballBoxCollisions(Box[] boxes){
    for(Box box : boxes){
      ball.collide_box(box);
      if(ball.hateCollisions){
        return;
      }
      
    }
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
      message = ("You win!");
      textSize(30);
      fill(255,255,0);
      text(message, 345, 200);
      fill(255);
      return;
    }
    
    else{
      message = ("Score = " + (int)gs.ball.score);
      textSize(30);
      fill(255,255,0);
      text(message, 345, 200);
      fill(255);
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
