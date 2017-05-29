class cell {  
  protected color c;
  protected boolean unvisited;
  protected int x;
  protected int y;
  
  cell() {
    
  }
  
  cell( int xpos, int ypos ) {
    x = xpos;
    y = ypos;
    unvisited = true;
    c = color(256, 256, 256);
    fill(c);
    noStroke();
    rect(x, y, 16, 16);
  }
  
  cell( int xpos, int ypos, boolean v ) {
    x = xpos;
    y = ypos;
    unvisited = v;
    c = color(0, 0, 256);
    fill(c);
    noStroke();
    rect(x, y, 16, 16);
  }
  
  private void setColor(color col) {
    c = col;
    fill(c);
    noStroke();
    rect( getX(), getY(), 16, 16);
  }
  
  protected int getX() {
    return x;
  }
  
  protected int getY() {
    return y;
  }
  
  private void visit() {
    unvisited = false;
    setColor( color(0,0,256) );
  }
  
  private void backTrack() {
    setColor( color(0,256,0) );
  }
  
  protected boolean unvisited() {
    return unvisited;
  }
  
}