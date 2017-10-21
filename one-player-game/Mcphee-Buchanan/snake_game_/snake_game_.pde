//Emerson and Tevah's snake solo player game.
ArrayList<Integer> X = new ArrayList<Integer>(), y = new ArrayList<Integer>();
int W  = 30, h = 30, bs = 20, dir = 2, applex =12, appley =10; //integer also know as control
int [] dx = {0,0,1,-1},dy = {1,-1,0,0};// makes the snake randomly appear on screen
boolean gameover = false; // added so we can have game over.
void setup() {//settings for the game 
  size (600,600);// screen size
  //size (W*bs, h*bs);
  X.add(6);
  y.add(6); //how fast you start at first round
}
void draw() {
  background(5);// background color black
  for (int i = 0 ; i < W; i++) line (i*bs, 0, i*bs, height);
  for (int i = 0 ; i < h; i++) line (0, i*bs, width,i*bs); // line 
  for (int i = 0 ; i < X.size(); i++) {
    fill( 0,255,0);
    rect( X.get(i)*bs, y.get(i)*bs, bs, bs);
  }
  if(!gameover) 
  {
  fill(605,50,70);
  rect(applex*bs,appley*bs, bs, bs);
  if (frameCount%5==0) { //frame 
    X.add(0,X.get(0) + dx[dir]); //new directions y,x axis
    y.add(0,y.get(0) + dy[dir]);
    if(X.get (0) < 0 || y.get(0) <0 || X.get(0) >= W || y.get (0) >= h) gameover = true; // code that make make the game over is you go out of bound.
    for(int i = 1; i < X.size(); i++) if (X.get(0)==X.get(i) && y.get(0) ==y.get (i)) gameover =true; // if the snakes touches it's own body then game over is true
    if(X.get(0)==applex && y.get (0)==appley) {
      applex= (int)random(0,W);
      appley= (int)random(0,h); //code thar makes the apples appear at random places on the screen.
    }else {
     X.remove(X.size()-1);
     y.remove(y.size()-1);// it moves the apple when the snake passes through it and a new applerandomly appears
    }
   }
  }else {
    fill(200); // color of the text
    textSize(30); //size of the text
    textAlign(CENTER); // align the txt in the center of the screen.
    text(" TRY AGAIN -> PRESS SPACE", width/2, height/2);// game over words in the center of the screen
    if (keyPressed&&key==' ') {//press space to reset the game
      X.clear();
      y.clear();//clears the previous game
      X.add(5);
      y.add(5);//restart a new and fresh game.
      gameover = false;
    }
  }
 }
void keyPressed() { // direction use to control the snake. such as a,w,d,s. or up down right and left.
  int newdir = key=='s' ? 0 : (key=='w' ? 1 : (key=='d' ? 2 : (key=='a' ? 3 : -1))); //these are the keys used to move the snake
  if (newdir != -1) dir = newdir;//game controls
} 