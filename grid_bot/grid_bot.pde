import java.util.ArrayList;

void setup() {
}


void draw() {
}

class Tile {
  int xPos, yPos;  // Coordinates of the tile
  boolean is_wall; // Whether or not the tile is a wall
  boolean is_goal; // Whether or not the tile is a goal
  Map map;         // The map the tile belongs to
  
  boolean occupied = false; // Occupation by a robot
  
  Tile (int x, int y, Map m, boolean wall, boolean goal) {
    xPos = x;
    yPos = y;
    map = m;
    is_wall = wall;
    is_goal = goal;
  }
  
  int getX () {
    return this.xPos;
  }
  
  int getY () {
    return this.yPos;
  }
  
  void setGoal (boolean e) {
    this.is_goal = e;
  }
}

class Robot {
  Tile loc;  // The tile the robot is on
  

}

class Map {
  Tile[][] tileArray;
  Robot[] robots;
  int xSize, ySize;
  int numRobots;
  ArrayList <Tile> goalTiles = new ArrayList<Tile>();

  Map (int x, int y, int r) {
    xSize = x;
    ySize = y;
    numRobots = r;

    tileArray = new Tile[xSize][ySize];
    robots = new Robot[numRobots];
  }
  
  /* BEGIN TILE METHODS */

  // Add a tile with the given parameters to the map
  void addTile (int x, int y, boolean wall, boolean goal) {
    tileArray[x-1][y-1] = new Tile(x, y, this, wall, goal);
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
    return this.tileArray[x-1][y-1];
  }
  
  Tile getAboveTile (Tile t) {
    try {
      return getXYTile(t.getX(), t.getY()+1);
    } catch (IndexOutOfBoundsException e) {
      return null;
    }
  }
  
  Tile getBelowTile (Tile t) {
    try {
      return getXYTile(t.getX(), t.getY()-1);
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

  // Returns an array of tiles adjacent to Tile t in the form [up, down, left, right]
  Tile[] getTileNeighbors(Tile t) {
    Tile[] neighbors = {getAboveTile(t), getBelowTile(t), getLeftTile(t), getRightTile(t)};
    return neighbors;
  }
  
  // Returns true if a robot is occupying a goal tile
  boolean success () {
    for (Tile t : goalTiles) {
      if (t.occupied) {
        return true;
      } else {
        return false;
      }
    }
  }

/* END TILE METHODS */

/* BEGIN ROBOT METHODS */

  // Add a robot with the given parameters to the map
  void addRobot () {
  }
  
  // Returns the specified robot
  Robot getRobot() {
  }
}