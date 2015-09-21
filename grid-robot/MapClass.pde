



class Map {
  float tileX, tileY; // Tile dimensions

  int xSize, ySize;
  ArrayList <Tile> goalTiles = new ArrayList<Tile>();
  Tile[][] tileArray;

  Map (int x, int y, ArrayList<Point> walls, ArrayList<Point> goals) {
    this.xSize = x;
    this.ySize = y;

    this.tileX = 0.90*width/x;
    this.tileY = 0.90*height/y;

    this.tileArray = new Tile[xSize][ySize];
    
    // Initialize the map with tiles
    for (int yc = 0; yc < this.ySize; yc++) {
      for (int xc = 0; xc < this.xSize; xc++) {
        Tile t = new Tile(xc, yc, this);
        this.tileArray[xc][yc] = t;
        rect(mapX+(xc*tileX), mapY+(yc*tileY), tileX, tileY);
        if (myWalls.contains(new Point(xc, yc))) {
          setTileWall(t, true);
        }
        if (myGoals.contains(new Point(xc, yc))) {
          setTileGoal(t, true);
        }
      }
    }
    //redraw();
  }
  
  /* BEGIN TILE METHODS */
  
  // Sets tile t's isWall value to boolean e
  void setTileWall (Tile t, boolean e) {
    t.setWall(e);
  }    
  
  // Sets Tile t's goal value to boolean e
  void setTileGoal (Tile t, boolean e) {
    t.setGoal(e);
    if (e) {
      goalTiles.add(t);
    } else {
      goalTiles.remove(t);
    }
  }

  // Returns the tile at (x, y)
  Tile getXYTile (int x, int y) {
    return this.tileArray[x][y];
  }
  
  Tile getAboveTile (Tile t) {
    try {
      return getXYTile(t.getX(), t.getY()-1);
    } catch (IndexOutOfBoundsException e) {
      return null;
    }
  }
  
  Tile getBelowTile (Tile t) {
    try {
      return getXYTile(t.getX(), t.getY()+1);
    } catch (IndexOutOfBoundsException e) {
      return null;
    }
  }
  
  Tile getRightTile (Tile t) {
    try {
      return getXYTile(t.getX()+1, t.getY());
    } catch (IndexOutOfBoundsException e) {
      return null;
    }
  }
  
  Tile getLeftTile (Tile t) {
    try {
      return getXYTile(t.getX()-1, t.getY());
    } catch (IndexOutOfBoundsException e) {
      return null;
    }
  }

  // Returns an array of tiles adjacent to Tile t in the form [down, right, up, left]
  Tile[] getTileNeighbors(Tile t) {
    Tile[] neighbors = {getBelowTile(t), getRightTile(t), getAboveTile(t), getLeftTile(t)};
    return neighbors;
  }
  /* END TILE METHODS */
  
  // Ends the robot simulation
  void endRun () {
    delay(5000);
    exit();
  }  
}