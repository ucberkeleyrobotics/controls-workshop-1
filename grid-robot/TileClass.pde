class Tile {
  int xPos, yPos;           // Coordinates of the tile
  Map map;                  // The map the tile belongs to
  boolean isGoal = false;  // Whether or not the tile is a goal  
  boolean isWall = false;  // Whether or not the tile is a wall
  boolean isOccupied = false; // Occupation by a robot
  
  float xSize, ySize;
  float dispX, dispY;
  
  Tile (int x, int y, Map m) {
    xPos = x;
    yPos = y;
    map = m;
    xSize = m.tileX;
    ySize = m.tileY;
    
    dispX = mapX+(this.xPos*xSize);
    dispY = mapY+((this.yPos*ySize));
  }
  
  int getX () {
    return this.xPos;
  }
  
  int getY () {
    return this.yPos;
  }
  
  void setWall (boolean e) {
    this.isWall = e;
    if (this.isWall) {
     fill(wallColor);
     rect(dispX, dispY, xSize, ySize);
     fill(baseColor);
    }
    redraw();
  }
  
  void setGoal (boolean e) {
    this.isGoal = e;
    if (this.isGoal) {
     fill(goalColor);
     rect(dispX, dispY, xSize, ySize);
     fill(baseColor);
    }
    redraw();
  }
  
  void setOccupied (boolean e, Robot r) {
    this.isOccupied = e;
    redraw();
    if (this.isOccupied) {
      if (this.isGoal) {
        println("Your robot reached the goal!");
        this.map.endRun();
      }
      fill(r.paint);
      rect(dispX, dispY, xSize, ySize);
      fill(baseColor);
      switch (r.facing) {
       case 0:
         triangle(dispX, dispY, dispX+xSize, dispY, dispX+xSize/2, dispY+ySize);
         break;
       case 1:
         triangle(dispX, dispY, dispX, dispY+ySize, dispX+xSize, dispY+ySize/2);
         break;
       case 2:
         triangle(dispX+xSize/2, dispY, dispX+xSize, dispY+ySize, dispX, dispY+ySize);
         break;
       case 3:
         triangle(dispX, dispY+ySize/2, dispX+xSize, dispY, dispX+xSize, dispY+ySize);
         break;
      }
    } else {
      if (this.isGoal) {
       fill(goalColor);
      }
      rect(dispX, dispY, xSize, ySize);
      fill(baseColor);
    }
  }
}