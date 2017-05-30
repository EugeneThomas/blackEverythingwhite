import java.util.Stack;

cell[][] maze; //holds our maze
Stack<cell> path; //holds the current path we have taken
cell current; //current cell we are on in maze
int x; //current xcor within array [y][x]
int y; //current ycor within array [y][x]

void setup() {
  background(0, 0, 0);
  size(416, 416);
  maze = new cell[13][13];
  for ( int i = 0; i < 13; i++ ) {
    for ( int j = 0; j < 13; j++ ) {
      maze[i][j] = new wall(j*32, i*32); //generates matrix of walls
    }
  }
  for ( int i = 2; i < 12; i += 2 ) {
    for ( int j = 2; j < 12; j += 2 ) {
      maze[i][j] = new cell(j*32, i*32);
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
  path = new Stack();
  current.visit();
}



void draw() {  
  //delay(1000) //stops 1 second each frame for better visualization
  
  //System.out.println("has neighbors: " + hasNeighbors());
  //System.out.println("bot (" + x + "," + (y+2) +"): " + maze[y+2][x].unvisited());
  //System.out.println("top: " + maze[y-2][x].unvisited());
  //System.out.println("right: " + maze[y][x+2].unvisited());
  //System.out.println("left: " + maze[y][x-2].unvisited());
  
  //if current cell has neighbors
  if ( hasNeighbors() ) {
    //choose a path
    getNext();
  }
  
  //otherwise if we can backtrack
  else if ( !path.isEmpty() ) {
    //get last placement and go through draw again
    //current.backTrack(); //shows backtracking process
    current = path.pop();
    x = current.getX() / 32;
    y = current.getY() / 32;
    
    //System.out.println("current popped");
    //System.out.println(x);
    //System.out.println(y);
    
  }
  
  //otherwise we're done
  else {
    delay(10000); //view ten seconds then...
    exit();//bye bye window
  }
}

//returns if a cell in the array has unvisited neighbors 
//to travel to
boolean hasNeighbors() {
  return maze[y+2][x].unvisited() || maze[y-2][x].unvisited() || maze[y][x-2].unvisited() || maze[y][x+2].unvisited();
}

//updates current and moves to next cell
//as well as removes wall by converting it to
//a visited cell
void getNext() {
  double rand;
  cell ret;
  path.push(current);//add our last location to the stack
  //System.out.println("current pushed");
  ret = current;//give ret an init value that passes first case
  
  while ( !ret.unvisited() ) {
    //while our new current has been visited
    //look for another
    rand = Math.random();
    
    if ( rand < .25 ) {
      ret = maze[y+2][x];
    }
    else if ( rand < 0.5 ) {
      ret = maze[y-2][x];
    }
    else if ( rand < 0.75 ) {
      ret = maze[y][x-2];
    }
    else {
      ret = maze[y][x+2];
    }
  }
  
  int newX = ret.getX() / 32;//new array xcor
  int newY = ret.getY() / 32;//new array ycor
  
  //System.out.println(newX);
  //System.out.println(newY);
  
  int midX = (newX+x)/2;//wall array xcor
  int midY = (newY+y)/2;//wall array ycor
  
  //System.out.println(midX);
  //System.out.println(midY);
  
  maze[midY][midX] = (cell) maze[midY][midX];//typecast wall to cell
  maze[midY][midX].visit();//turn wall to visited cell
  
  //update vars
  x = newX;
  y = newY;
  current = ret;
  current.visit();
} 

void keyPressed() { //PAUSES GENERATION
  final int k eyCode;
  if (k == 'S')
    if (looping)  noLoop();
    else          loop();
}