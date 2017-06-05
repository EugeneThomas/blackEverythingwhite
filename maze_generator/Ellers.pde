class Ellers implements GenMaze {
  
  int row; 
  int col; 
  int rowMaze; 
  int colMaze; 
  boolean generated; 
  cell exit; 
  cell[][] Maze; 
  cell[] currentRow; 
  cell[] nextRow; 
  int greenType; 
  int track; 
  
  public Ellers (int w, int h) { 
    row = h; 
    col = w; 
    generated = false; 
    Maze = new cell[row][col]; 
    currentRow = new cell[row]; 
    nextRow = new cell[row]; 
    greenType = 2; 
    track = 0; 
    
    // F I L L  I T  U P 
    
    for ( int i = 0; i < row; i++ ) {
      for ( int j = 0; j < col; j++ ) {
        Maze[i][j] = new wall(j*16, i*16); //generates matrix of walls
      }
    }
    
    // The next row is in limbo. 
    
    for(int i=0; i<nextRow.length; i++){
        nextRow[i] = new color(track*16, i*16, false, 1);
    }
    
    // Random sets are made to the first row...
    
   for(int i = 0; i < currentRow.length; i+=2) {
        currentRow[i] = new cell(track*16, i*16, false, 1);
        greenType += 1; 
        if(i != currentRow.length-1) { 
          currentRow[i+1] = new wall(track*16, i*16);
        } 
   }
  } // Close Constructor
  
  // M A Z E   G E N E R A T I O N   T I M E... 
  // ======================================================================
  
   public void generate() { 
     for (int i = 0; i < rowMaze-1; i++) { 
       if (i != 0) { 
         for (int j = 0; j < currentRow.length; i++) {
           currentRow[j] = nextRow[j];
           nextRow[j] = new cell(j*16, i*16, false, 1); 
           track++; 
         } 
       } 
       
     joinPaths(); 
     cut(); 
     
     for (int k = 0; k < currentRow.length; k+=2) { 
         if (green(nextRow[k].getColor()) == 1) { 
             nextRow[k].setColor(color(0,greenType+1,0)); 
             greenType++; 
         } 
         else if (k != currentRow.length-1) { 
           nextRow[k+1] = new wall(track*16, k*16); 
         } 
     } 
     
     for (int l = 0; l < currentRow.length; l++) { 
       if (currentRow[l] instanceof wall) { 
         Maze[2*i+1][l+1] = new wall((2*i+1)*16,(l+1)*16); 
         Maze[2*i+2][l+1] = new wall((2*i+2)*16,(l+1)*16);
       } 
       else { 
         Maze[2*i+1][l+1] = new cell((2*i+1)*16,(l+1)*16,true); 
         if (currentRow[l].equals(nextRow[l])) { 
           Maze[2*i+2][l+1] = new cell((2*i+2)*16,(l+1)*16,true); 
         } 
       } 
     } 
     makeLast();  
     } 
   }
   
   public void joinPaths() { 
     float f = random(1); 
     for (int i = 1; i < currentRow.length-1; i+=2) { 
       if (currentRow[1] instanceof wall && !currentRow[i-1].equals(currentRow[i+1]) && f < .5) { 
           currentRow[i] = new cell(track*16, i*16, true); 
           cell nextToGo = currentRow[i-1].minGreen(currentRow[i+1]); 
           cell afterThat = currentRow[i-1].maxGreen(currentRow[i+1]); 
           for (int j = 0; j < currentRow.length; j++) { 
             if (currentRow[j].equals(afterThat)) { 
               currentRow[j] = nextToGo; 
             } 
           } 
       } 
     } 
   } 
   
   public void cut() { 
     
        int b;    
        int end;          
        boolean vertical; 
        int i;
        b = 0;
        
        while(end != currentRow.length-1)
        { 
            /* find the end of this section */
            i=b;
            while(i<currentRow.length-1 && currentRow[i].equals(currentRow[i+2])){
                i+=2;
            }
            end = i;
            vertical = false;
            while(!vertical){
                for(int j=b; j<=end; j+=2){

                    if(){
                        nextRow[j] = currentRow[j];
                        vertical = true;
                    }
                }
            }
            b = end+2;  //go to the next section in the row
        }
   } 
   
   public void makeLast() { 
      for(int i=0; i<currentRow.length; i++){
            currentRow[i] = nextRow[i];
        }

        for(int i=1; i<currentRow.length-1; i+=2){

            if(currentRow[i] instanceof wall && !(currentRow[i-1].equals(currentRow[i+1]))){
                currentRow[i] = new cell(track*16, i*16, false, greenType); // check 
                cell nextToGo = currentRow[i-1].minGreen(currentRow[i+1]); 
                cell afterThat = currentRow[i-1].maxGreen(currentRow[i+1]); 
                for(int j=0; j<currentRow.length; j++){
                    if(currentRow[j].equals(afterThat))
                        currentRow[j] = nextToGo;
                }
            }
        }


        /* add the last row to the feild */
        for(int k=0; k<currentRow.length; k++){
            if(currentRow[k] instanceof wall){
                Maze[row-2][k+1] = new wall(k+1, row-2);  
            }
            else{
               Maze[row-2][k+1] = new cell(k+1, row-2, true);  
            }
        }
   } 
   
  // ======================================================================
    
  // From the MazeDepth Code...
  // ======================================================================
  
  void displayMaze() {
    for ( int i = 0; i < Maze.length; i++ ) {
      for ( int j = 0; j < Maze[0].length; j++ ) {
        Maze[i][j].displayCell();
      }
    }
  }
  
  void makeExit() { 
    int randX = (int) ( Math.random() * ( (colMaze - 4) / 2 ) ) * 2 + 2;
    int randY = (int) ( Math.random() * ( (rowMaze - 4) / 2 ) ) * 2 + 2;
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