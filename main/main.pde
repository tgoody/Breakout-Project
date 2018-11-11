import controlP5.*;

ControlP5 controlP5;
controlP5.Button playButton;
GameState gs;
int w, h;
boolean playing;
String message;
PShader background;

void setup(){
  frameRate(60);
  size(800,800,P2D);
  
  controlP5 = new ControlP5(this);
  playButton = playButton(); /*controlP5.addButton("PLAY")
                                  .setSize(100,50)
                                  .setPosition(width/2,height/2)
                                  .setColorBackground(color(0,153,0))
                                  .setColorForeground(color(0,0,250));*/


 
 //message = controlP5.addTextlabel("message").setText("You win!") //Max steps slider
                          //.setPosition(350,400).setSize(50,50);

  doinit();
}

void doinit(){
  rectMode(CORNERS);
  imageMode(CORNERS);
  w = 800;
  h = 800;
  gs = new GameState(w, h);
  background = new PShader();
  background = loadShader("background.glsl"); //http://glslsandbox.com/e#50147.1
  
  
  toggle();
}

void draw() {
  
  background(0);
  
  
  background.set("mouse",gs.ball.position.x/250, gs.ball.position.y/250);
  background.set("time", millis()/1000.0);
  background.set("resolution", (float)width, (float)height);
  filter(background);
  
  
  
  
  if(playing){
    gs.update();
    gs.draw();
    fill(255);
  }
  
  else if(!playing){
    message = "Press P or click play to continue";
    textSize(30);
    text(message, 170, 200);
    gs.draw();
    
    if(playButton.isPressed()){
      toggle();
    }
    
  }
    
  
  //reset background
  //if the game is playing, update and draw, otherwise just draw 
  //if the ball position exceeds the window height, call init() (to reset)
  
  if(gs.ball.position.y > height){
    
    doinit();
    
  }
  
}

controlP5.Button playButton(){
  //Create a Button, return it.
  //Use createFont, ControlFont, and setFont 
  //Center the font by subtracting half of the size from the position
  

    
    playButton = controlP5.addButton("PLAY")
                                  .setSize(400,100)
                                  .setPosition(200,350)
                                  
                                  .setColorBackground(color(255,0,0));
                                  
    return playButton;
  
  
  
  
}

void toggle(){
  //Flip the value of the boolean

  
  playing = !playing;
  if(playing){
    playButton.hide();
  }
  
  else{playButton.show();}

  //If the game is playing, hide the button, otherwise show it
  //use the button's hide and show functions
}

void keyPressed(){
  //call the GameState's keyPressed command
  //press 'p' to pause/unpause (via toggle())
  //if(key == '`') saveFrame("screenshots/screenshot-####.png");

  if(key == 'p'){
    toggle(); 
    return;
  }

  if(key == '`'){
    
    saveFrame("screenshots/screenshot-####.png");
    return;
  }
  
  gs.keyPressed();
  
  
  
}
void keyReleased(){
  //call the GameState's keyReleased command
  gs.keyReleased();
}
