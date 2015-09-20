void setup() {
  
}


void draw() {

}

class Tile {
}
  
class Robot {
}

class Map {
  Tile[][] tileArray;
  Robot[] robots;
  int xSize;
  int ySize;
  int numRobots;
  
  Map (int x, int y, int r) {
    xSize = x;
    ySize = y;
    numRobots = r;

    tileArray = new Tile[xSize][ySize];
    robots = new Robot[numRobots];
  }
  
  // Add a tile with the given parameters to the map
  // returns 1 on success, 0 on failure
  int addTile () {
  }
  
  // Add a robot with the given parameters to the map
  // returns 1 on success, 0 on failure
  int addRobot () {
  }
  
  // Returns the specified tile
  Tile getTile () {
  }
  
  // Sets Tile t's end value to boolean e
  int setTileEnd (Tile t, boolean e) {
  }
  
  // Returns an array of tiles adjacent to Tile t in the form [up, down, left, right]
  Tile[] getTileNeighbors(Tile t) {
  }
  
  // Returns the specified robot
  Robot getRobot() {
  }
  
}