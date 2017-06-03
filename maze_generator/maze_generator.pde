MazeDepth maze; //holds our maze
character dude;


void setup() {
  background(0, 0, 0);
  size(880, 880);
  
  maze = new MazeDepth();
  maze.generate();
  dude = new character();
}



void draw() {  
  background(0);
  maze.displayMaze();
  dude.printChar();
}

/*
void keyPressed() { //PAUSES GENERATION
  final int k = keyCode;
  if (k == 'S')
    if (looping)  noLoop();
    else          loop();
}
*/

  void keyPressed() { 
    if (key == CODED) { 
       if (keyCode == UP) { 
         dude.validDirection(0, maze.getMaze());
       } 
       else if (keyCode == DOWN) { 
         dude.validDirection(1, maze.getMaze());
       }
       else if (keyCode == LEFT) { 
         dude.validDirection(2, maze.getMaze()); 
       }
       else if (keyCode == RIGHT) { 
         dude.validDirection(3, maze.getMaze()); 
       } 
    }
  } 