import java.util.ArrayList;
import java.awt.Point;


class Tile {
  int xPos, yPos;           // Coordinates of the tile
  Map map;                  // The map the tile belongs to
  boolean is_goal = false;  // Whether or not the tile is a goal  
  boolean is_wall = false;  // Whether or not the tile is a wall
  boolean occupied = false; // Occupation by a robot
  
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
    //dispY = height-mapY-((this.yPos+1)*ySize);
    //println(dispY);
  }
  
  int getX () {
    return this.xPos;
  }
  
  int getY () {
    return this.yPos;
  }
  
  void setWall (boolean e) {
    this.is_wall = e;
    println("setting wall");
    fill(wallColor);
    rect(dispX, dispY, xSize, ySize);
    fill(baseColor);
    println(dispX);
    println(dispY);
    println();
  }
  
  void setGoal (boolean e) {
    this.is_goal = e;
    println("setting goal");
    fill(goalColor);
    rect(dispX, dispY, xSize, ySize);
    fill(baseColor);
    println(dispX);
    println(dispY);
    println();
  }
}

class Robot {
  Tile loc;  // The tile the robot is on
  

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
          println("Point(" + xc + ", " + yc + ") is in myWalls");
          setTileWall(t, true);
        }
        if (myGoals.contains(new Point(xc, yc))) {
          println("Point(" + xc + ", " + yc + ") is in myGoals");
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

  // Returns an array of tiles adjacent to Tile t in the form [up, down, left, right]
  Tile[] getTileNeighbors(Tile t) {
    Tile[] neighbors = {getAboveTile(t), getBelowTile(t), getLeftTile(t), getRightTile(t)};
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
  
  /* END ROBOT METHODS */
  
  // Returns true if a robot is occupying a goal tile
  boolean success () {
    for (Tile t : goalTiles) {
      if (t.occupied) {
        return true;
      }
    }
    return false;
  }  
}