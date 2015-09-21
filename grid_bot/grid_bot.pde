import java.util.ArrayList;
import java.awt.Point;


class Tile {
  int xPos, yPos;           // Coordinates of the tile
  Map map;                  // The map the tile belongs to
  boolean is_goal = false;  // Whether or not the tile is a goal  
  boolean is_wall = false;  // Whether or not the tile is a wall
  boolean is_occupied = false; // Occupation by a robot
  
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
    this.is_wall = e;
    fill(wallColor);
    rect(dispX, dispY, xSize, ySize);
    fill(baseColor);
  }
  
  void setGoal (boolean e) {
    this.is_goal = e;
    fill(goalColor);
    rect(dispX, dispY, xSize, ySize);
    fill(baseColor);
  }
}

class Robot {
  Tile currTile;  // The tile the robot is on
  Map currMap; // The map the robot is on
  int id;
  int facing = 0;
  color paint;
  
  Point getGPS() {
    return new Point(this.currTile.xPos, this.currTile.yPos);
  }
  
  boolean senseIfBlocked() {
    Tile[] neighbors = this.currMap.getTileNeighbors(this.currTile);
    switch (this.facing) {
      case 0: return (neighbors[0] == null || neighbors[0].is_wall || neighbors[0].is_occupied);
      case 1: return (neighbors[1] == null || neighbors[1].is_wall || neighbors[1].is_occupied);
      case 2: return (neighbors[2] == null || neighbors[2].is_wall || neighbors[2].is_occupied);
      case 3: return (neighbors[3] == null || neighbors[3].is_wall || neighbors[3].is_occupied);
    }
    return false;
  }
  
  void goForward() {
    if (senseIfBlocked()) {
      this.currMap.removeRobot(this.id); // You broke your robot!
    } else {
      this.currTile.is_occupied = false;
      this.currTile = this.currMap.getTileNeighbors(this.currTile)[this.facing];
      this.currTile.is_occupied = true;
    }
  }
  
  void turnLeft() {
    this.facing = (this.facing + 1) % 4;
  }
  
  void turnRight() {
    this.facing = (this.facing + 3) % 4;
  }
}

class Map {
  float tileX, tileY; // Tile dimensions

  int xSize, ySize;
  ArrayList<Robot> robots = new ArrayList<Robot>();
  ArrayList <Tile> goalTiles = new ArrayList<Tile>();
  Tile[][] tileArray;

  Map (int x, int y, ArrayList<Point> walls, ArrayList<Point> goals) {
    this.xSize = x;
    this.ySize = y;

    this.tileX = 0.90*width/x;
    this.tileY = this.tileX;

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
  }
  
  /* BEGIN TILE METHODS */
  
  // Sets tile t's is_wall value to boolean e
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
      return getXYTile(t.getX()-1, t.getY()+1);
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

  /* BEGIN ROBOT METHODS */

  // Add a robot with the given parameters to the map
  void addRobot () {
  }
  
  // Returns the specified robot
 // Robot getRobot() {
 // }
  void removeRobot (int id) {
  }
  
  /* END ROBOT METHODS */
  
  // Returns true if a robot is occupying a goal tile
  boolean endRun () {
    for (Tile t : goalTiles) {
      if (t.is_occupied) {
        println("Your robot reached the goal!");
        return true;
      }
    }
    if (robots.size() == 0) {
      println("All your robots crashed :(");
      return true;
    }
    return false;
  }  
}