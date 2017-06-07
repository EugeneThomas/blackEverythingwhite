import java.util.ArrayList;

class MazePrim implements GenMaze {
  
  cell[][] maze; //holds our maze
  ArrayList<cell> path; //holds the current path we have taken
  cell current; //current cell we are on in maze
  character dude;
  int x; //current xcor within array [y][x]
  int y; //current ycor within array [y][x]
  int newX; //used for transitions with midX
  int newY; //used for transitions with midY
  int midX; //used for walls in between cells
  int midY; //used for walls in between cells
  int numRow;
  int numCol;
  cell exit;

 MazePrim(int w, int h) {
  //start at upperleft hand corner
  //init vars
  numRow = h / 16;
  numCol = w / 16;
  maze = new cell[numRow][numCol];
  for ( int i = 0; i < numRow; i++ ) {
    for ( int j = 0; j < numCol; j++ ) {
      maze[i][j] = new wall(j*16, i*16); //generates matrix of walls
    }
  }
  for ( int i = 2; i < numRow-1; i += 2 ) {
    for ( int j = 2; j < numCol-1; j += 2 ) {
      maze[i][j] = new cell(j*16, i*16);
      //creates cells 2 spaces apart with a 2 cell
      //buffer zone around the edges, helps with out of bounds
      //exceptions
    }
  }
  //start at upperleft hand corner
  //init vars
  x = 2;
  y = 2;
  current = maze[2][2];
  path = new ArrayList<cell>();
  current.visit();
  dude = new character();
  }

void generate() {  
  //delay(100); //stops .1 second each frame for better visualization
 
  //if current cell has neighbors
  if ( hasNeighbors() ) {
    //choose a path
    getNext();
  }
  
  //otherwise if we can backtrack
  else if ( !path.isEmpty() ) {
    //get last placement and go through draw again
    current.backTrack(); //shows backtracking process
    
    current = path.pop();
    
    newX = current.getX() / 16;
    newY = current.getY() / 16;
    
    midX = (newX + x)/2;
    midY = (newY + y)/2;
    
    maze[midY][midX].backTrack();
    
    x = newX;
    y = newY;
    
    //System.out.println("current popped");
    //System.out.println(x);
    //System.out.println(y);
    
    current.backTrack();

    }
}
  
boolean hasNeighbors() {
  return maze[y+2][x].unvisited() || maze[y-2][x].unvisited() || maze[y][x-2].unvisited() || maze[y][x+2].unvisited();
}


  
}