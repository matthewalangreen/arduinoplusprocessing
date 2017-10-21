void setup()
{
 size(200,200); 
}

void draw()
{
  background(150);
  textSize(50);
  fill(255,0,0);
  
  if(key == CODED)
  {
    text(keyCode, 50, 100);
  }
  
  else
  {
   text(int(key),50,100);
   text(key,150,100);
  }
}