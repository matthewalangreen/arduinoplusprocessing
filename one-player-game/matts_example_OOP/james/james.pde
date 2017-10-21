// This is a special data type.  It is a special array.  Arrays are data types like int or float but instead of
// holding onto just one number at a time they can hold multiple different numbers.  Think of them like a data table,
// or mabye like a shelf with numbers on it to keep everything organized.  Or some people think of them like a 
// digital filing cabinet.  
//
// This one is special in another way... its not just holding lots of ints or floats... 
// its hodling lots of "balls" or objects created by the Ball class I define below.
// In the following line I'm just setting up the array, but I haven't put anything in it yet.
ArrayList<Ball> balls = new ArrayList<Ball>();

// moving rectangle data
float rectangleX;
float rectangleY;
float rectangleWidth;
float rectangleHeight;
float radius = 20;

void setup()
{
 size(400,600);
 background(0);
 rectMode(CENTER);
 
 rectangleX = width/2;
 rectangleY = height/2;
 rectangleWidth = 50;
 rectangleHeight = 50;
}

void draw()
{
  background(0);  
  
  // move square down
  if(keyCode == 40)
  {
    if(rectangleY >= height-rectangleHeight/2)
    {
      rectangleY = height-rectangleHeight/2;
    }
    else
    {
      rectangleY += 5;
    }
  }
  
  // move square up
  if(keyCode == 38)
  {
    if(rectangleY <= 0+rectangleHeight/2)
    {
      rectangleY = 0+rectangleHeight/2;
    }
    else
    {
      rectangleY -= 5;
    }
  }
  
  // move square left
  if(keyCode == 37)
  {
    if(rectangleX <= 0+rectangleWidth/2)
    {
      rectangleX = 0+rectangleWidth/2-1;
    }
    else
    {
      rectangleX -= 5;
    }
  }
  
  // move square right
  if(keyCode == 39)
  {
    if(rectangleX >= width-rectangleWidth/2)
    {
       rectangleX = width-rectangleWidth/2; 
    }
    else
    {
      rectangleX += 5;
    }
  }
  
  // draw the square
  rect(rectangleX, rectangleY, rectangleWidth, rectangleHeight);
  
 // I've commented out the following lines but I think they will be helpful to you becuase it show
 // how you can have lots of balls moving at the same time...
  
 // draw all the balls again at the start... & make sure they fall
 //for(int i = 0; i < balls.size(); i++)
 //{
 //   balls.get(i).display();
 //   balls.get(i).fall();
 //   if(balls.get(i).isColliding(rectangleX, rectangleY))
 //   {
 //    println("collision detected"); 
 //    fill(255,0,0);
 //    rect(rectangleX, rectangleY, rectangleWidth, rectangleHeight);
 //   }
 //}
 
 
 // just show the ball most recently created
 if(balls.size() != 0)  // make sure a ball has been created before you try to show it...
 {
   balls.get(balls.size()-1).display();  // get the last ball in the list and show it
   balls.get(balls.size()-1).fall();     // get the last ball in the list and make it fall
 
 
   // check to see if the ball is colliding with the sqaure the player is moving around the screen
   if(balls.get(balls.size()-1).isColliding(rectangleX, rectangleY))
   {
     println("collision detected");   // turn the shapes red if there is a collision.  This is where you'd end the game
     fill(255,0,0);
     rect(rectangleX, rectangleY, rectangleWidth, rectangleHeight);
   }
 }
 
 
}

// this is how you make another ball, or a "new" ball depending on how many balls you'd like to show at one time...
void keyPressed()
{
   if(key == 'b')
   {
     fill(255);
     //noStroke();
     balls.add(new Ball(random(0,width), 0, radius, rectangleX, rectangleY, rectangleWidth, rectangleHeight));
     int lastBall = balls.size()-1;
     balls.get(lastBall).display();
     balls.get(lastBall).fall();
   }
}

// Here is the class.  The reason I think it makes sense to use Object Oriented Programming here (Classes & Objects)
// is because it allows us to make the Ball objects smart.  We can create them in such a way that they can 
// keep track of their own collisions instead of me having to write infinite if statements to manage them
// there are three basic sections to the following class definition:  data, constructor(s), & methods.
class Ball
{
 // data  - this is where I declare the properties and variables I'll use to do stuff with each Ball object.
   float circleX;
   float circleY;
   float radius;
   float rectangleX;
   float rectangleY;
   float rectangleWidth;
   float rectangleHeight;
   
   
 // constructor -- this is how I create a ball.  Notice that there is nothing in the constructor about making
 // the ball show up on screen.  I handle that stuff with the methods below.  So what's really being "constructed"
 // in the constuctor is the stuff that will be true about the ball once it's shown on screen.
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
 
 // methods  -- these are all pretty different so I'll explain each one.
 
 // this is how we make the Ball oject you just constructed show up on the screen.
 // notice how simple this method is.  This is the kind of stuff we'd normally do in the void draw()
 // loop but we can do it here and think of the ball being drawn once we call this method on an object.
 // the way we make it work is to use a method call something like: "currentBall.display()" inside void draw()
 // or like I do above in void keyPressed().
 void display()
 {
   ellipseMode(CENTER);
   ellipse(circleX, circleY, radius*2, radius*2);
 }
 
 // this handles making the ball's height change and creating a new ball if the current one falls off the screen.
 // notice that we aren't moving the old ball back to the top but rather making a brand new one at a random x position
 // at the top of the screen.  This is different thinking than what we used when we coded without Objects.
 void fall()
 {
   circleY += 5;
   if(circleY >= height)
   {
     circleY = 0;
     balls.add(new Ball(random(0,width), 0, radius, rectangleX, rectangleY, rectangleWidth, rectangleHeight));
   }
 }
 
 // this I took from the sketch we found here: http://www.openprocessing.org/sketch/20795
 // you call this by using "currentBall.isColliding(x,y)" in a conditional statement... remember this is a check
 // to see if this is happening or not... notice the return type of "boolean"
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
  
  // this can be used to share the value of a private variable with the rest of the sketch.
  // you can't access variables we create inside the Class if you aren't an object created by that class.
  // So what we do is teach the object to share specific information about itself when asked.
  float height()
  {
   return circleY; 
  }
 
 
}