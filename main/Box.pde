class Box {
 //top left corner
 //width and height
 //bools for alive and wall
 //vector for image's source location
 
 PVector tl;
 PVector wh;
 boolean alive;
 boolean wall;
 
 Box(float x1, float y1, float x2, float y2, boolean wall_, PImage pimg){
   //Set the vectors for the top right, and the width and height
   //Set the wall boolean
   //Set the src x and y positions from the pimage
   //  Make sure to subtract the pimg's width and height to stay within the image
   
   tl.set(x1,y1);
   wh.set(x2,y2);
   wall = wall_;
   alive = true;
 }

 void draw(PImage pimg){
   
   if(!alive){return;}
   
   rect(tl.x, tl.y, wh.x, wh.y);
   
   //If it's alive, draw the rect
     //Draw a box
     //rect(tl.x, tl.y, wh.x, wh.y);
     //Use copy to crop part of the pimage
 }
}
