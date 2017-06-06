class MazeEllers implements GenMaze {
  
  int row; 
  int col; 
  int rowMaze; 
  int colMaze; 
  boolean generated; 
  cell exit; 
  cell[][] Maze;
  
  public MazeEllers (int w, int h) { 
    row = h/16-1; 
    col = w/16-1; 
    generated = false; 
    Maze = new cell[row][col]; 
    
    // FILL IT UP 
    
    for ( int i = 0; i < row; i++ ) {
      for ( int j = 0; j < col; j++ ) {
        Maze[i][j] = new wall(j*16, i*16); //generates matrix of walls
      }
    }
    
    for ( int i = 2; i < row; i+=2 ) {
      for ( int j = 2; j < col; j+=2 ) {
        Maze[i][j] = new cell(j*16,i*16,true); 
      }
    }
  } 
  
  void randomlyJoinHorizontal() {
    for (int i = 2; i < row; i+= 2) { 
      for (int j = 3;  j < col-1; j+=2) { 
         if (random(1)<.5) { 
           Maze[i][j] = new cell(j*16,i*16,true);
         } 
      }
    } 
  } 
  
  void randomlyJoinVertical() { 
    for (int i = 3; i < row-1; i+=2) { 
     for (int j = 2; j < col; j+=2) { 
        if (Maze[i+1][j] instanceof cell && Maze[i-1][j] instanceof cell) { 
           Maze[i][j] = new cell(j*16,i*16,true);
        } 
     } 
    }
  } 
  
  // From the MazeDepth Code...
  // ======================================================================
  void generate() { 
    randomlyJoinHorizontal();
    randomlyJoinVertical(); 
    displayMaze(); 
    generated = true; 
  } 
  
  void displayMaze() {
    for ( int i = 0; i < Maze.length; i++ ) {
      for ( int j = 0; j < Maze[0].length; j++ ) {
        Maze[i][j].displayCell();
      }
    }
  }
  
  void makeExit() { 
    int randX = (int) ( Math.random() * ( (col - 4) / 2 ) ) * 2 + 2;
    int randY = (int) ( Math.random() * ( (row - 4) / 2 ) ) * 2 + 2;
    Maze[randY][randX].setColor( color(0,256,256) );
    exit = Maze[randY][randX];
  } 
  
  boolean generated() { 
    return generated;   
  } 
  
  cell[][] getMaze() { 
    return Maze; 
  } 
  
  cell getExit() {
    return exit; 
  } 
  
  // ======================================================================
  
  
} 