GenMaze maze; //holds our maze
character dude;
int level;
int levelsPassed;
boolean chosen;

//time vars
int time;
int wait = 30000;
int clockCenterX;
int clockCenterY;
float angleIncrement = (40 * PI) / wait;
float timeAngle = 3 * PI / 2;
int radius = 16;



void setup() {
  background(0, 0, 0);
  size(336, 336);
  
  dude = new character();
  chosen = false;
  level = 1;
  levelsPassed = 0;
  
  clockCenterX = width / 2;
  clockCenterY = 16;
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
    
    if ( !maze.generated() ) { //run while maze is generating
      maze.generate(); //further generate
      if ( maze.generated() ) { //if done generating
        maze.makeExit(); //add a lil exit
        
        time = millis(); //start timer for character
      }
    }
    
    else {
      //background(0);
      maze.displayMaze();
      drawClock();
      dude.printChar();
      
      //System.out.println( (dude.getX() - 8) + " , " + (dude.getY() - 8) );
      //System.out.println( (maze.getExit().getX()) + " , " + (maze.getExit().getY()) );
      
      if ( (dude.getY() - 8) == maze.getExit().getY()  && (dude.getX() - 8) == maze.getExit().getX() ) {
        clear();
        chosen = false;
        //level += 1;
        dude.reset();
        levelsPassed += 1;
      }
      
      else if ( millis() - time >= wait ) { //if run out of time ( currently 30 seconds )
        dude.die(); //dude dies
        time = millis(); //restart timer
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
  
  void drawClock() {
    stroke(256, 256, 256);
    line( clockCenterX, clockCenterY, clockCenterX + (radius * cos(timeAngle)), clockCenterY + (radius * sin(timeAngle)) );
    timeAngle += angleIncrement;
  }
    