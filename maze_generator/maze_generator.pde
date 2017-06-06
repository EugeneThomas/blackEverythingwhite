GenMaze maze; //holds our maze
character dude;
int level;
boolean chosen;


void setup() {
  background(0, 0, 0);
  size(336, 336);
  
  maze = new MazeDepth(width, height);
  maze = new MazeDepth(width, height);
  dude = new character();
  chosen = false;
  level = 1;
}



void draw() {  
  if ( dude.getLives() < 1 ) {
    clear();
    //youLose function print
  }
  
  else if ( !chosen ) {
    
    if ( level == 1 ) {
      maze = new MazeDepth(width, height);
    }
    
    else if ( level == 2 ) {
      //maze = new MazeEllers(width, height);
    }
    
    else if ( level == 3 ) {
      //maze = new MazePrim(width, height);
    }
    
    chosen = true;
  }
  
  else {
    
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
        clear();
        chosen = false;
        //level += 1;
        dude.reset();
      }
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