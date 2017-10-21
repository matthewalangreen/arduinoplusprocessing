PImage img;
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
  img = loadImage("http://cache4.asset-cache.net/xd/491968778.jpg?v=1&c=IWSAsset&k=2&d=DF8D445051B40C743F37857AAD8FD6BADD9BE2D9A1DB104C06D48456890DC1699396529B3C57E914");
background(img);
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
img = loadImage("Untitled-2.jpg");
background(img);
}
void thirdSlide()
{
  img =loadImage("Untitled-1.jpg");
  background(img);
  }
void firstChoice()
{
  img = loadImage("FirstChoice.jpg");
  background(img);
  }
void choiceA()
{
 img  = loadImage("choice2.jpg");
 background(img);
  }
void gameOver1()
{
  img = loadImage("FirstGAMEOVERScreen.jpg");
  background(img);
  }
void ankleTrans()
{
  img = loadImage("ankletransition.jpg");
  background(img);
  }
void ankleChoice()
{
  img = loadImage("ankleChoice.jpg");
  background(img);
  }
void passOut()
{
  img = loadImage("PassOut2.jpg");
  background(img);
}
void wakeUp1()
{
  img = loadImage("wakeUp1.jpg");
  background (img);
}
void arnoldEncounter()
{
  img = loadImage("arnoldEncounter.jpg");
  background (img);
}
void choice4()
{
  img = loadImage("Choice4.jpg");
  background(img);
}
void arnoldBeingTamed()
{
  img = loadImage("ArnoldBeingTamed.jpg");
  background(img);
}
void gameOver2()
{
  img = loadImage("gameOver2.jpg");
  background(img);
}
void whereAmI()
{
  img = loadImage("whereAmI.jpg");
  background(img);
}
void fallingOver()
{
  img = loadImage("fallingOver.jpg");
  background(img);
}
void explanationP1()
{
 img = loadImage("ExplanationP1.jpg");
background(img);
}
void explanationP2()
{
  img = loadImage("explanationP2.jpg");
  background(img);
}
void dublinArnold()
{
 img = loadImage("dublinArnold.jpg");
background(img); 
}
void aBeginningToAnEnd()
{
 img = loadImage("aBeginningToAnEnd.jpg"); 
 background(img);
}
void toBeContinued()
{
 img = loadImage("toBeContinued.jpg");
 background(img);
}