import java.util.Stack;

cell[][] maze;
Stack<cell> path;
cell current;
int x;
int y;

void setup() {
  background(0, 0, 0);
  size(416, 416);
  maze = new cell[13][13];
  for ( int i = 0; i < 13; i++ ) {
    for ( int j = 0; j < 13; j++ ) {
      maze[i][j] = new wall(j*32, i*32);
    }
  }
  for ( int i = 2; i < 12; i += 2 ) {
    for ( int j = 2; j < 12; j += 2 ) {
      maze[i][j] = new cell(j*32, i*32);
    }
  }
  x = 2;
  y = 2;
  current = maze[2][2];
  path = new Stack();
  current.visit();
}



void draw() {  
  System.out.println("has neighbors: " + hasNeighbors());
  System.out.println("bot: " + maze[y+2][x].unvisited());
  System.out.println("top: " + maze[y-2][x].unvisited());
  System.out.println("right: " + maze[y][x+2].unvisited());
  System.out.println("left: " + maze[y][x-2].unvisited());
  if ( hasNeighbors() ) {
    getNext();
  }
  
  else if ( !path.isEmpty() ) {
    current = path.pop();
    //current.backTrack();
    x = current.getX() / 32;
    y = current.getY() / 32;
    System.out.println("current popped");
    System.out.println(x);
    System.out.println(y);
  }
}

boolean hasNeighbors() {
  return maze[y+2][x].unvisited() || maze[y-2][x].unvisited() || maze[y][x-2].unvisited() || maze[y][x+2].unvisited();
}

void getNext() {
  double rand;
  cell ret;
  path.push(current);
  System.out.println("current pushed");
  ret = current;
  
  while ( !ret.unvisited() ) {
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
  
  int newX = ret.getX() / 32;
  int newY = ret.getY() / 32;
  System.out.println(newX);
  System.out.println(newY);
  
  maze[(newY + y)/2][(newX + X)/2] = new cell((ret.getX() + current.getX())/2, (ret.getY() + current.getY())/2, false);
  
  x = newX;
  y = newY;
  current = ret;
  current.visit();
}

void keyPressed() {
  final int k = keyCode;

  if (k == 'S')
    if (looping)  noLoop();
    else          loop();
}