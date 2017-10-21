// This is a simple game made from the components in the SparkFun Guide to Processing
// Painting program.  You can see the original sketch here: http://bit.ly/1OPoIso
// 
// The goal of this challenge was to create a game from the same components as
// another sketch that have been repurposed.  
//
// 
// I was inspired by this.  I used this authors gameOver idea and brought it 
// into this sketch:
// http://www.123mylist.com/2013/12/basic-pong-game-using-processing.html





// This is where I'm declaring variables I'll use in the game
int x, y = 1;  // keep track of the (x,y) position of the falling ball
int yChange = 4;  // a way to manage the speed of the ball
int boxSpeed = 6; 
int boxX, boxY = 1;  // (x,y) position of the "box"
int boxWidth = 60; 
int boxHeight = 20;
int gameOver = 0;  // keeps track of if the game is still going. 
int score = 0; // keeps track of the player's score


void setup()
{
  background(255);
  rectMode(CENTER);
  size(400, 600);
  frameRate(60);  // default is 30.  This makes it smoother on my machine

  x = int(random(0, width));  // make the ball drop from a differnt location each time
}


void draw()
{
  
  
    
  if(gameOver == 0)  // run this chunk while the game is still going
  {
  background(255);
  
  // print the current score to the screen
  fill(0);
  textSize(20);
  text("Score: "+score, width - 100, 30);
  
  // This creates the solid black band.
  // I created a visual trick here to make it look like there is a 
  // rectangular "hole" in the black band.  In reality there is a 
  // white rectangle on top of a black rectangle.  The black one
  // stretches across the width of the screen and doesn't move.
  // The white one is smaller and moves left and right as the user
  // presses the arrow keys.
  fill(0);
  rect(width/2, 0.75*height, width, boxHeight);
  
  // draw first "hole"
  // we so it here so that it looks like there is a hole in the black band
  // before the user presses the left or right arrow.
  fill(255);
    noStroke();
    rect(boxX,0.75*height,boxWidth,boxHeight);
  
  
  // right arrow, move "hole"
  if (keyCode == 39)
  {
    fill(255);
    noStroke();
    rect(boxX,0.75*height,boxWidth,boxHeight);
    
    // this moves the box by changing its horizontal position.  It's a shortcut
    // version of: boxX = boxX + boxSpeed
    //
    // the word "speed" is confusing here because its actually not a speed, its a 
    // change in x.  Perhaps a better name would have been boxChangeInX or 
    // something like that.
    boxX += boxSpeed;
  
  }
  
  // left arrow, move "hole"
  if (keyCode == 37)
  {
    fill(255);
    noStroke();
    rect(boxX,0.75*height,boxWidth,boxHeight);
    boxX -= boxSpeed;
  }
  
  // keep rectangular hole from going off screen.
   if(boxX <= (0+boxWidth/2))
   {
     boxX = boxWidth/2; 
   }
 
   if(boxX >= (width-boxWidth/2))
   {
     boxX = width - boxWidth/2; 
   }

  // draw falling circle
  fill(0, 255, 0);
  ellipse(x, y, 30, 30);
  // this moves the circle down.  **Remember** that in Processing as you move down
  // the y-values get bigger and more positive not smaller and more negative.
  // see this for more information: https://processing.org/tutorials/drawing/
  y += yChange;  
  

  // if the circle falls all the way to the bottom...
  if (y >= height)
  {
    y = 0;  // reset y=0 so the next ball starts at the top of the screen
    x = int(random(0, width));  // pick a new random x position for new ball
    score++;  // add one to the score
  }
  

  // this checks to see if the ball's height is the same height is between
  // the top of the "hole" and the bottom of it.  If it is then...
  if(y+10 >= int(0.75*height-boxHeight/2) && y <= int(0.75*height+boxHeight/2))
  {
    // if its also either to the left or right of the "hole" then end the game
    // essentially this "nested if statement" first checks to see if the ball
    // is close to the hole and if it makes it through the hole or not.
    
    if(x < boxX-boxWidth/2 | x > boxX+boxWidth/2)
    {
     gameOver = 1;  // now the next condition can run...
    }
  }
  
  }
  
  else  // this only happens when gameOver doesn't equal 0
  {
    background(0,255,0);
    fill(255);
    textSize(32);
    text("Game Over!",width/2-90,height/2-180);
    text("Score: " + score,width/2-60,height/2);
    text("Press R to Restart",width/2-130,height/2+80);
  }
  
}

// this resets the game.  It works at anytime during the game
void keyPressed()
{
  if(key == 'r' | key == 'R')
  {
    gameOver=0;
    score = 0;
    y = 1;
    x = int(random(0, width));
 }
  
}