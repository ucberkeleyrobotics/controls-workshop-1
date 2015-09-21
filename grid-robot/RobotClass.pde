class Robot {
  Tile currTile;  // The tile the robot is on
  Map currMap; // The map the robot is on
  int id;
  int facing = 0;
  color paint = color(0);
  
  Robot (int n, int x, int y, Map m) throws IllegalArgumentException {
    this.currMap = m;
    try {
      Tile destination = m.getXYTile(x, y);
      if (destination.isOccupied || destination.isWall) {
        throw new IllegalArgumentException("The tile you are trying to put your robot at is blocked");
      }
      this.id = n;
      this.currTile = destination;
      destination.setOccupied(true, this);
    } catch (ArrayIndexOutOfBoundsException e) {
      throw new IllegalArgumentException("You tried to place the robot out of bounds");
    }
  }
  

  
  void setPaint(color c) {
    this.paint = c;
  }
  
  Point getGPS() {
    return new Point(this.currTile.xPos, this.currTile.yPos);
  }
  
  int getCompass() {
    return this.facing;
  }
  
  boolean senseIfBlocked() {
    Tile[] neighbors = this.currMap.getTileNeighbors(this.currTile);
    return (neighbors[this.facing] == null || neighbors[this.facing].isWall || neighbors[this.facing].isOccupied);
  }
  
  void goForward() {
    if (senseIfBlocked()) {
      println("Your robot hit a wall!");
      this.currMap.endRun();
    } else {
      this.currTile.setOccupied(false, this);
      this.currTile = this.currMap.getTileNeighbors(this.currTile)[this.facing];
      this.currTile.setOccupied(true, this);
    }
    //redraw();
    //delay(executionSpeed);
  }
  
  void turnLeft() {
    this.facing = (this.facing + 1) % 4;
    this.currTile.setOccupied(this.currTile.isOccupied, this);
    //redraw();
    //delay(executionSpeed);
  }
  
  void turnRight() {
    this.facing = (this.facing + 3) % 4;
    this.currTile.setOccupied(this.currTile.isOccupied, this);
    //redraw();
    //delay(executionSpeed);
  }
  

}