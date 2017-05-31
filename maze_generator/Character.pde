class Character { 
  
  color col; 
  int lives; 
  int xpos = 80;
  int ypos = 80; 
  int xperm = 80;  
  int yperm = 80; 
  
  Character() { 
    /* 
    while ( maze[xperm/13][yperm/13].getColor() == color(0,0,0) ) { 
      xperm = (int) (random(0, 417)); 
      yperm = (int) (random(0, 417)); 
     } 
     */  
    lives = 3;
    /* 
    int rand1 = (int) (random(0,256)); // Red Input
    int rand2 = (int) (random(0,256)); // Green Input
    int rand3 = (int) (random(0,256)); // Blue Input
    */ 
    col = color(256, 0, 0); // Uses RGB Input for a new color 
  } 
  
  void printCircle() { 
    // If alive... 
    if (isAlive()) { 
      fill(col); // Sets color
      ellipse(x,y,10,10); // Creates a circle
    } 
  } 
  
  boolean isAlive() {
    return lives != 0;   
  } 
  
  // Temp: NOT GRADUAL MOVEMENT
  
  void moveKey(int i) {
    // Up: 0 
    if (i == 0) { 
      ypos -= 2; 
    } 
    // Down: 1
    else if (i == 1) { 
      ypos += 2; 
    } 
    // Left: 2
    else if (i == 2) { 
      xpos -= 2; 
    } 
    // Right: 3
    else if (i == 3) { 
      xpos += 2; 
    } 
  } 

  void interact() { 
    if (maze[xpos/13][ypos/13].getColor() != color(0,0,256)) { 
      lives -= 1; 
      xpos = xperm; 
      ypos = yperm; 
    } 
  } 

  void run (int i) { 
    moveKey(i); 
    interact(); 
    printCircle(); 
  } 
  
  void keyPressed() { 
    if (key == CODED) { 
       if (keyCode == UP) { 
         run(0); 
       } 
       else if (keyCode == DOWN) { 
         run(1); 
       }
       else if (keyCode == LEFT) { 
         run(2); 
       }
       else if (keyCode == RIGHT) { 
         run(3); 
       } 
    }  
    // ELSE FOR WASD
  } 
  
  
}