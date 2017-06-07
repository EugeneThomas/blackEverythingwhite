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
  
  void joinVertical() { 
    for (int i = 3; i < row-1; i+=2) { 
     for (int j = 2; j < col; j+=2) { 
        if (!(Maze[i+1][j] instanceof wall) && !(Maze[i-1][j] instanceof wall)) { 
           Maze[i][j] = new cell(j*16,i*16,true);
        } 
     } 
    }
  } 
  
  void removeOutliersEight() { 
     for (int i = 3; i < row-2; i++) { 
       for (int j = 3; j < col-2; j++) { 
         float f = random(1); 
         boolean bool = !(Maze[i][j-1] instanceof wall) && !(Maze[i][j+1] instanceof wall);
         bool = bool && !(Maze[i+1][j+1] instanceof wall) && !(Maze[i+1][j-1] instanceof wall);
         bool = bool && !(Maze[i+1][j] instanceof wall) && !(Maze[i-1][j-1] instanceof wall);
         bool = bool && !(Maze[i-1][j] instanceof wall) && !(Maze[i-1][j+1] instanceof wall);
         if (bool) { 
           if (i < row/2 && j < col/2) { 
             if (f < .17) { 
               Maze[i-1][j] = new wall(j*16, i*16-16); 
             }
             else if (f < .34) { 
               Maze[i][j-1] = new wall(j*16-16, i*16); 
             }
             else if (f < .66) { 
               Maze[i][j+1] = new wall(j*16+16, i*16);
             } 
             else { 
               Maze[i+1][j] = new wall(j*16, i*16+16);
             }
           } 
           else if (!(i < row/2) && j < col/2) { 
             if (f < .17) { 
               Maze[i][j-1] = new wall(j*16-16, i*16);
             }
             else if (f < .34) { 
               Maze[i+1][j] = new wall(j*16, i*16+16);
             }
             else if (f < .66) { 
               Maze[i-1][j] = new wall(j*16, i*16-16);
             } 
             else { 
               Maze[i][j+1] = new wall(j*16+16, i*16);
             }
           }
           else if (i < row/2 && !(j < col/2)) { 
             if (f < .17) { 
               Maze[i-1][j] = new wall(j*16, i*16-16);
             }
             else if (f < .34) { 
               Maze[i][j+1] = new wall(j*16+16, i*16);
             }
             else if (f < .66) { 
               Maze[i][j-1] = new wall(j*16-16, i*16);
             } 
             else { 
               Maze[i+1][j] = new wall(j*16, i*16+16);
             }
           }
           else { 
             if (f < .17) { 
               Maze[i+1][j] = new wall(j*16, i*16+16);
             }
             else if (f < .34) { 
               Maze[i][j+1] = new wall(j*16+16, i*16);
             }
             else if (f < .66) { 
               Maze[i-1][j] = new wall(j*16, i*16-16);
             } 
             else { 
               Maze[i][j-1] = new wall(j*16-16, i*16);
             }
           }
         }
       }    
     } 
  } 
  
  void removeOutliers() { 
     for (int i = 3; i < row-2; i++) { 
       for (int j = 3; j < col-2; j++) { 
         boolean bool = (Maze[i][j-1] instanceof wall) && (Maze[i][j+1] instanceof wall);
         bool = bool && (Maze[i+1][j+1] instanceof wall) && (Maze[i+1][j-1] instanceof wall);
         bool = bool && (Maze[i+1][j] instanceof wall) && (Maze[i-1][j-1] instanceof wall);
         bool = bool && (Maze[i-1][j] instanceof wall) && (Maze[i-1][j+1] instanceof wall);
         bool = bool && !(Maze[i][j] instanceof wall);
         if (bool) { 
           Maze[i][j] = new wall(16*j, 16*i); 
         } 
       } 
     } 
  } 
  
  // From the MazeDepth Code...
  // ======================================================================
  void generate() {
    randomlyJoinHorizontal();
    joinVertical();
    removeOutliersEight(); 
    removeOutliers(); 
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
    boolean bool = true; 
    while (bool) { 
      int rand1 = (int) (random(row/2) + row/2); 
      int rand2 = (int) (random(col/2) + col/2); 
      if (!(Maze[rand1][rand2] instanceof wall)) { 
        Maze[rand1][rand2].setColor(color(0,256,256)); 
        bool = false; 
        exit = Maze[rand1][rand2];
      } 
    }
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