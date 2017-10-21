//global variables
snake test;
food food1;
int highScore;
int rect;
PImage bg;


// when program is launched, the game sets up the window and what it looks like
// window is 650 pixels, by 650pixele, etc.
void setup()
{
  size(650, 650);
  bg = loadImage("BlueBackground.jpg");
  frameRate(12);
  // spawns new snake 
  test = new snake();
  //spawns a new food
  food1 = new food();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  highScore = 0;
  bg = loadImage("BlueBackground.jpg");
}

void draw()
{
  image(bg, 0, 0);
  drawScoreboard();
  test.move();
  test.display();
  food1.display();

  if ( dist(food1.xpos, food1.ypos, test.xpos.get(0), test.ypos.get(0)) < test.sidelen ) {
  food1.reset();
  test.addLink();
}

  if (test.len > highScore) 
  {
  highScore= test.len;
  }
}





void keyPressed()//sets actual movment as some the code can refer back too. Using keycode commands under the if statements
{
    if (key == CODED) 
    {
  if (keyCode == LEFT) 
  {
    test.dir = "left";
  }
  if (keyCode == RIGHT) 
  {
    test.dir = "right";
  }
  if (keyCode == UP) 
  {
    test.dir = "up";
  }
  if (keyCode == DOWN) 
  {
    test.dir = "down";
    }
  }
}


void drawScoreboard()// draws scoreboard, which is two sets of text the say "score" and "high score"
{
  fill( 255,255, 255);
  textSize(35);
  text( "THE SNAKE", width/2, 80);

  fill(255, 255, 255);
  textSize(17);
  text( "Score: " + test.len, 70, 20);
  fill(255, 255, 255);
  textSize(17);
  text( "High Score: " + highScore, 70, 40);
}

class food // class that is for "food" to feed the snake. In this code it randomly generates a food circle after snake eats one. 
{
  float xpos, ypos;



//where the food spawns in at.
food() 
{
  xpos = random(100, width - 100);
  ypos = random(100, height - 100);
}


// what the food looks like
// blue circle with white stroke
void display()
{
  stroke(255, 255, 255);
  fill(0,0, 255);
  ellipse(xpos, ypos, 15, 15);
}


void reset()
{
    xpos = random(100, width - 100);
    ypos = random(100, height - 100);
  }
}

class snake
{
 
  int len;
  float sidelen;
  String dir;
  ArrayList <Float> xpos, ypos;

snake() //creates snake length and which way it moves from the start
{
  len = 1;
  sidelen = 17;
  dir = "right";
  xpos = new ArrayList();
  ypos = new ArrayList();
  xpos.add( random(width) );
  ypos.add( random(height) );
}



void move()// allows the snake to move around the screen when keys pressed (left, right, up and down)
{
  for (int i = len - 1; i > 0; i = i -1 ) 
{
  xpos.set(i, xpos.get(i - 1));
  ypos.set(i, ypos.get(i - 1));
}
    if (dir == "left")
  {
      xpos.set(0, xpos.get(0) - sidelen);
    }
    if (dir == "right")
  {
      xpos.set(0, xpos.get(0) + sidelen);
    }

    if (dir == "up")
  {
      ypos.set(0, ypos.get(0) - sidelen);
    }

    if (dir == "down")
  {
      ypos.set(0, ypos.get(0) + sidelen);
}
  xpos.set(0, (xpos.get(0) + width) % width);
  ypos.set(0, (ypos.get(0) + height) % height);

if ( checkHit() == true) // creates length of snake after resetting
  {
    len = 1;
    float xtemp = xpos.get(0);
    float ytemp = ypos.get(0);
    xpos.clear();
    ypos.clear();
    xpos.add(xtemp);
    ypos.add(ytemp);
  }
}



void display() // creates initial snake box and position  
{
  for (int i = 0; i <len; i++)
  {
    stroke(255, 255, 255);
    fill(0, 0, 255, map(i-1, 0, len-1, 250, 50));
    rect(xpos.get(i), ypos.get(i), sidelen, sidelen);
  }
}


void addLink()
{
  xpos.add( xpos.get(len-1) + sidelen);
  ypos.add( ypos.get(len-1) + sidelen);
  len++;
}

boolean checkHit() // code to reset game when snake goes back on its self or runs into its self
{
  for (int i = 2; i < len; i++)
  {
    if ( dist(xpos.get(0), ypos.get(0), xpos.get(i), ypos.get(i)) < sidelen) 
  {
    return true;// return statements to make sure game resets
  }
}
  return false;
    }
}
void screen()// draws background image we pulled from google
{
  bg = loadImage("BlueBackground.jpg");
  background(bg);
}