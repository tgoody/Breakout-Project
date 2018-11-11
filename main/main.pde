import controlP5.*;

ControlP5 cp5;
GameState gs;
int w, h;
boolean playing;
Button play;

void setup(){
  size(800,800);
  init();
}

void init(){
  w = 800;
  h = 800;
  gs = new GameState(w, h, "glsl", "texture");
}

void draw() {
  //reset background
  //if the game is playing, update and draw, otherwise just draw 
  //if the ball position exceeds the window height, call init() (to reset)
}

Button playButton(){
  //Create a Button, return it.
  //Use createFont, ControlFont, and setFont 
  //Center the font by subtracting half of the size from the position
}

void toggle(){
  //Flip the value of the boolean

  //If the game is playing, hide the button, otherwise show it
  //use the button's hide and show functions
}

void keyPressed(){
  //call the GameState's keyPressed command
  //press 'p' to pause/unpause (via toggle())
  //if(key == '`') saveFrame("screenshots/screenshot-####.png");
  
  gs.keyPressed();
  
}
void keyReleased(){
  //call the GameState's keyReleased command
  gs.keyReleased();
}
