PImage bg;
int y;
int keyPresses;

void setup() {
size(640, 360);
introScreen();
}

void draw() {
 // background(bg);
  if(key == '3')
  {
   thirdSlide(); 
  }
  
  if(key == '1')
  {
   introScreen(); 
  }
  
  if(key == '2')
  {
    secondSlide();
  }
  if(key == '4')
  {
    firstChoice();
  }
  stroke(226, 204, 0);
  
  y++;
  if (y > height) {
    y = 0;
  }
}


void keyPressed()
{
 if(keyCode == 39) 
{
  keyPresses++;
    println("Number of key presses: " + keyPresses);
    if(keyPresses == 1)
    {
      secondSlide();
    }
    if(keyPresses == 2)
    {
      thirdSlide();
    }
    if(keyPresses == 3)
    {
      firstChoice();
    }
    if(keyPresses == 6)
    {
     ankleChoice(); 
    }
    if(keyPresses == 7)
    {
     arnoldEncounter(); 
    }
    if(keyPresses == 8)
    {
     choice4(); 
    }
   if(keyPresses ==   9)
   {
     explanationP2();
   }
   if(keyPresses == 10)
   {
    aBeginningToAnEnd(); 
   }
   if(keyPresses == 11)
   {
    toBeContinued(); 
   }
   
}
   {
   if(key == 'a')
   {
     keyPresses++;
       println("Number of key presses: " + keyPresses);
       if(keyPresses == 4)
       {
         choiceA();
       }
       if(keyPresses == 5)
       {
           ankleTrans();    
   }
   if(keyPresses == 9)
   {
     gameOver2();
   }
   if(keyPresses == 7)
   {
    whereAmI(); 
   }
   if(keyPresses == 8)
      {
       explanationP1(); 
      }
      if(keyPresses == 10)
      {
       toBeContinued(); 
      }
   }
   }
   {
    if(key == 'b')
   {
     keyPresses++;
      println("Number of key presses: " + keyPresses);
      if(keyPresses == 4)
      {
        gameOver1();
      }
      if(keyPresses == 5)
      {
       passOut();     
      }
      if(keyPresses == 6)
      {
       wakeUp1(); 
      }
      if(keyPresses == 9)
      {
       arnoldBeingTamed(); 
      }
      if(keyPresses == 7)
      {
        fallingOver();
      } 
      if(keyPresses == 8)
      {
       explanationP1(); 
      }
       if(keyPresses ==   10)
    {
     dublinArnold(); 
    }
     if(keyPresses == 11)
      {
       toBeContinued(); 
      }
   }
     }
}

void introScreen()
{
  bg = loadImage("http://cache4.asset-cache.net/xd/491968778.jpg?v=1&c=IWSAsset&k=2&d=DF8D445051B40C743F37857AAD8FD6BADD9BE2D9A1DB104C06D48456890DC1699396529B3C57E914");
background(bg);
  PFont font;
  fill(0);
//how to create a font, however its not working for some reason.
font = createFont("Harrington-48.vlw", 48);
textFont(font);
text("Start",260, 180);
fill(0);
textSize(60);
 size(640, 360);
}
void secondSlide()
{
bg = loadImage("Untitled-2.jpg");
background(bg);
}
void thirdSlide()
{
  bg=loadImage("Untitled-1.jpg");
  background(bg);
  }
void firstChoice()
{
  bg = loadImage("FirstChoice.jpg");
  background(bg);
  }
void choiceA()
{
 bg = loadImage("SecondChoice.jpg");
 background(bg);
  }
void gameOver1()
{
  bg = loadImage("GameoverOne.jpg");
  background(bg);
  }
void ankleTrans()
{
  bg = loadImage("ankleTransition.jpg");
  background(bg);
  }
void ankleChoice()
{
  bg = loadImage("ankleChoice.jpg");
  background(bg);
  }
void passOut()
{
  bg = loadImage("PassOut2.jpg");
  background(bg);
}
void wakeUp1()
{
  bg = loadImage("wakeUp1.jpg");
  background (bg);
}
void arnoldEncounter()
{
  bg = loadImage("arnoldEncounter.jpg");
  background (bg);
}
void choice4()
{
  bg = loadImage("Choice4.jpg");
  background(bg);
}
void arnoldBeingTamed()
{
  bg = loadImage("ArnoldBeingTamed.jpg");
  background(bg);
}
void gameOver2()
{
  bg = loadImage("gameOver2.jpg");
  background(bg);
}
void whereAmI()
{
  bg = loadImage("whereAmI.jpg");
  background(bg);
}
void fallingOver()
{
  bg = loadImage("fallingOver.jpg");
  background(bg);
}
void explanationP1()
{
 bg = loadImage("ExplanationP1.jpg");
background(bg);
}
void explanationP2()
{
  bg = loadImage("explanationP2.jpg");
  background(bg);
}
void dublinArnold()
{
 bg = loadImage("dublinArnold.jpg");
background(bg); 
}
void aBeginningToAnEnd()
{
 bg = loadImage("aBeginningToAnEnd.jpg"); 
 background(bg);
}
void toBeContinued()
{
 bg = loadImage("toBeContinued.jpg");
 background(bg);
}