// This is a special data type.  It is a special array.  Arrays are data types like int or float but instead of
// holding onto just one number at a time they can hold multiple different numbers.  Think of them like a data table,
// or mabye like a shelf with numbers on it to keep everything organized.  Or some people think of them like a 
// digital filing cabinet.  
//
// This one is special in another way... its not just holding lots of ints or floats... 
// its hodling lots of "balls" or objects created by the Ball class I define below.
// In the following line I'm just setting up the array, but I haven't put anything in it yet.
ArrayList<Ball> balls = new ArrayList<Ball>();

// this is a single variable that will hold onto just one ball object at a time... I use it below
// to make the conditionals more readable and easier to understand.
Ball currentBall;

// moving rectangle data
float rectangleX;
float rectangleY;
float rectangleWidth;
float rectangleHeight;
float radius = 20;
int boxSpeed = 6;

boolean gameOver = false;
int score = 0;

void setup()
{
   noStroke();
   size(400,600);
   background(255);
   rectMode(CENTER);
   frameRate(60);
   
   rectangleX = width/2;
   rectangleY = height*0.75;
   rectangleWidth = 60;
   rectangleHeight = 20;
 
   // make, show, and drop new ball
   balls.add(new Ball(random(0,width), 1, radius, rectangleX, rectangleY, rectangleWidth, rectangleHeight));
   int lastBall = balls.size()-1;
   balls.get(lastBall).display();
   balls.get(lastBall).fall();
}

void draw()
{
  if(!gameOver)
  {
      background(255);  
      noStroke();
      
      // print the current score to the screen
      fill(0);
      textSize(20);
      text("Score: "+score, width - 100, 30);
      
      // draw black rectangular band
      fill(0);
      rect(width/2, 0.75*height, width, rectangleHeight);
      
      //  Move the white rectangular "hole"
      fill(255);
    
    
      if(keyCode == 37)  // move left
      {
        if(rectangleX <= 0+rectangleWidth/2)
        {
          rectangleX = 0+rectangleWidth/2-1;
        }
        else
        {
          rectangleX -= boxSpeed;
        }
      }
    
    
      if(keyCode == 39)  // move right
      {
        if(rectangleX >= width-rectangleWidth/2)
        {
           rectangleX = width-rectangleWidth/2; 
        }
        else
        {
          rectangleX += boxSpeed;
        }
      }
     
      // draw the white rectangular "hole"
      rect(rectangleX, rectangleY, rectangleWidth, rectangleHeight);
    
     
     // just show the ball most recently created
     if(balls.size() != 0)  // make sure a ball has been created before you try to show it...
     {
       currentBall = balls.get(balls.size()-1);
       currentBall.display();
       currentBall.fall();
       
       // if the ball isn't colliding with the "hole" and is at the height of the black rectangle then...
       if(!currentBall.isColliding(rectangleX, rectangleY)
           && currentBall.ballHeight()>= 0.75*height
           && currentBall.ballHeight()< 0.75*height+rectangleHeight)
       {
         println("collision detected");   // turn the shapes red if there is a collision.  This is where you'd end the game
         //fill(255,0,0);
         //rect(rectangleX, rectangleY, rectangleWidth, rectangleHeight);
         gameOver = true;
       }
     }
  }
  
  else
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
    gameOver = false;
    score = 0;
     // make, show, and drop new ball
   balls.add(new Ball(random(0,width), 1, radius, rectangleX, rectangleY, rectangleWidth, rectangleHeight));
   int lastBall = balls.size()-1;
   balls.get(lastBall).display();
   balls.get(lastBall).fall();
 }
}

class Ball
{
 // data
   float circleX;
   float circleY;
   float radius;
   float rectangleX;
   float rectangleY;
   float rectangleWidth;
   float rectangleHeight;
   
 // constructor
 Ball(
   float _circleX,
   float _circleY,
   float _radius,
   float _rectangleX,
   float _rectangleY,
   float _rectangleWidth,
   float _rectangleHeight)
 {
   circleX = _circleX;
   circleY = _circleY;
   radius = _radius;
   rectangleX = _rectangleX;
   rectangleY = _rectangleY;
   rectangleWidth = _rectangleWidth;
   rectangleHeight = _rectangleHeight;
 }
 
 // methods
 void display()
 {
   fill(0,255,0);
   ellipseMode(CENTER);
   ellipse(circleX, circleY, radius*2, radius*2);
 }
 
 void fall()
 {
   circleY += 5;
   if(circleY >= height)
   {
     circleY = 0;
     balls.add(new Ball(random(0,width), 0, radius, rectangleX, rectangleY, rectangleWidth, rectangleHeight));
     score++;
   }
 }
 
 
  boolean isColliding(float _rectangleX, float _rectangleY)
  {
    float circleDistanceX = abs(circleX - _rectangleX - rectangleWidth/2);
    float circleDistanceY = abs(circleY - _rectangleY - rectangleHeight/2);
   
    if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
    if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
    if (circleDistanceX <= (rectangleWidth/2)) { return true; }
    if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
    float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                         pow(circleDistanceY - rectangleHeight/2, 2);
   
    return (cornerDistance_sq <= pow(radius,2));
  }
  
  float ballHeight()
  {
   return circleY; 
  }
 
}