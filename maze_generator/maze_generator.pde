GenMaze maze; //holds our maze
character dude;
int level;


void setup() {
  background(0, 0, 0);
  size(336, 336);
  
  maze = new MazeDepth(width, height);
  dude = new character();
}



void draw() {  
  if ( !maze.generated() ) {
    maze.generate();
    if ( maze.generated() ) {
      maze.makeExit();
    }
  }
  
  else {
    background(0);
    maze.displayMaze();
    dude.printChar();
    
    //System.out.println( (dude.getX() - 8) + " , " + (dude.getY() - 8) );
    //System.out.println( (maze.getExit().getX()) + " , " + (maze.getExit().getY()) );
    
    if ( (dude.getY() - 8) == maze.getExit().getY()  && (dude.getX() - 8) == maze.getExit().getX() ) {
      exit();
    }
  }
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
    else {
      if (key == 'w') { 
         dude.validDirection(0, maze.getMaze());
       } 
       else if (key == 's') { 
         dude.validDirection(1, maze.getMaze());
       }
       else if (key == 'a') { 
         dude.validDirection(2, maze.getMaze()); 
       }
       else if (key == 'd') { 
         dude.validDirection(3, maze.getMaze()); 
       } 
    }
  } 