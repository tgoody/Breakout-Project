import controlP5.*;

ControlP5 controlP5;
controlP5.Button playButton;
GameState gs;
int w, h;
boolean playing;

void setup(){
  size(800,800);
  doinit();
}

void doinit(){
  rectMode(CORNERS);
  w = 800;
  h = 800;
  gs = new GameState(w, h);
  controlP5 = new ControlP5(this);
  playing = true;
}

void draw() {
  
  background(150);
  
  if(playing){
    gs.update();
    gs.draw();
  }
  //reset background
  //if the game is playing, update and draw, otherwise just draw 
  //if the ball position exceeds the window height, call init() (to reset)
  
  if(gs.ball.position.y > height){
    
    doinit();
    
  }
  
}

Button playButton(){
  //Create a Button, return it.
  //Use createFont, ControlFont, and setFont 
  //Center the font by subtracting half of the size from the position
  
  
    PFont pfont = createFont("Arial",20,true); // use true/false for smooth/no-smooth
    ControlFont font = new ControlFont(pfont,241);
    
    playButton = controlP5.addButton("PLAY")
                                  .setSize(100,50)
                                  .setPosition(5,20)
                                  .setColorBackground(color(0,153,0))
                                  .setColorForeground(color(0,0,250))
                                  .setFont(font);
    return playButton;
  
  
  
  
}

void toggle(){
  //Flip the value of the boolean

  playing = !playing;

  //If the game is playing, hide the button, otherwise show it
  //use the button's hide and show functions
}

void keyPressed(){
  //call the GameState's keyPressed command
  //press 'p' to pause/unpause (via toggle())
  //if(key == '`') saveFrame("screenshots/screenshot-####.png");

  gs.keyPressed();
  
  
  println(keyCode);
  
}
void keyReleased(){
  //call the GameState's keyReleased command
  gs.keyReleased();
}
