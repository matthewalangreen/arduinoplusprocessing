int gameOver = 0;
int score = 0;
int boxSpeed = 4; 
int boxX, boxY = 1; 
int boxWidth = 20; 
int boxHeight = 20;

Bullet firstBullet;
Bullet secondBullet;
Bullet thirdBullet;
Bullet fourthBullet;

void setup() {
  size(500, 500);
  // Arguments go inside the parentheses when the object is constructed.  
  firstBullet = new Bullet(color(51), 0, 100, 1,1); 
  secondBullet = new Bullet(color(51), 0, 100, 4,4);
  thirdBullet = new Bullet(color(51), 0, 100, 2,4);
  fourthBullet = new Bullet(color(51), 0, 100, 4,5);

  
  rectMode(CENTER);
  size(500, 500);
  boxX = width/2;
  boxY = height/2;
  frameRate(60);
}

void draw() {
  background(255);
  firstBullet.moveX(true);
  firstBullet.display();
  secondBullet.moveX(false);
  secondBullet.display();
  
  thirdBullet.moveY(true);
  thirdBullet.display();
  fourthBullet.moveY(false);
  fourthBullet.display();
  
  if(gameOver == 0)  // run this chunk while the game is still going
  {
    
    fill(0);
    textSize(20);
    text("Score: "+score, width - 100, 30);
  }
  
  fill(0);
  noStroke();
  rect(boxX,boxY,boxWidth,boxHeight);
  
  if (keyCode == 39)
  {
    fill(0);
    noStroke();
   
    boxX += boxSpeed;
  
  }
  
  // left arrow, move "hole"
  if (keyCode == 37)
  {
    fill(0);
    noStroke();
    
    boxX -= boxSpeed;
  }
    if (keyCode == 38)
  {
    fill(0);
    noStroke();
   
    boxY -= boxSpeed;
  }
    if (keyCode == 40)
  {
    fill(0);
    noStroke();
    
    boxY += boxSpeed;
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
   
   if(boxX <= (0+boxWidth/2))
   {
     boxX = boxWidth/2; 
   }
   
   if(boxY >= (height-boxWidth/2))
   {
     boxY = height - boxWidth/2; 
   }
  
}

class Bullet
{ 
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
 

  // The Constructor is defined with parameters.  
  Bullet(
    color tempC, 
    float tempXpos, 
    float tempYpos, 
    float tempXspeed,
    float tempYspeed)
    
    
  { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  void display() 
  {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 30, 30);
  }

  void moveX(boolean fromLeft) // if true comes from top, if false comes from bottom
  {
      if(fromLeft)
      {
        xpos = xpos + xspeed;
        if (xpos > width) 
        {
          xpos = 0;
          ypos = int(random(0, width));
          score++;
        }
      }
      else
      {
         xpos = xpos - xspeed;
        if (xpos < 0) 
        {
          xpos = width;
          ypos = int(random(0, width));
          score++;
        }
      }
   }
  
  
  void moveY(boolean fromTop)
  {
    if(fromTop)
    {
      ypos = ypos + yspeed;
      if (ypos > height) 
      {
        ypos = 0;
        xpos = int(random(0, height));
        score++;
      }
    }
    
    else
    {
       ypos = ypos - yspeed;
      if (ypos < 0) 
      {
        ypos = height;
        xpos = int(random(0, height));
        score++;
      }
    }
  }
}


// Even though there are multiple objects, only  one class is needed. 
// No matter how many cookies you make, only one cookie cutter is needed.
class leftCircle 
{ 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with parameters.  
  leftCircle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() 
  {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 30, 30);
  }

  void move() 
  {
    xpos = xpos + xspeed;
    if (xpos > width) 
    {
      xpos = 0;
      ypos = int(random(0, width));
      score++;
    }
  }
}
class rightCircle
{ 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with parameters.  
  rightCircle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
  }

  void display() 
  {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 30, 30);
    
  }

  void move() 
  {
    xpos = xpos - xspeed;
    if (xpos < 0) 
    {
      xpos = width;
      ypos = int(random(0, width));
      score++;
    }
  }
}
class topCircle 
{ 
  color c;
  float xpos;
  float ypos;
  float yspeed;

  // The Constructor is defined with parameters.  
  topCircle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempXspeed;
  }

  void display() 
  {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 30, 30);
  }

  void move() 
  {
    ypos = ypos + yspeed;
    if (ypos > width) 
    {
      ypos = 0;
      xpos = int(random(0, height));
      score++;
    }
  }
}
class bottomCircle 
{ 
  color c;
  float xpos;
  float ypos;
  float yspeed;

  // The Constructor is defined with parameters.  
  bottomCircle(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    yspeed = tempXspeed;
  }

  void display() 
  {
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 30, 30);
  }

  void move() 
  {
    ypos = ypos - yspeed;
    if (ypos < 0) 
    {
      ypos = width;
      xpos = int(random(0, height));
      score++;
    }
  }
}