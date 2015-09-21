/* MAP LAYOUTS */
// A layout is defined by an x size and a y size, as well coordinates for the walls and goals
Point xyA = new Point(10, 10);

Point[] wallsA = {
  new Point(6, 9),
  new Point(4, 2)
};

Point[] goalsA = {
  new Point(4, 3)
};

Point xySelect; // Add dimension checks later
Point[] wallSelect;
Point[] goalSelect;

ArrayList<Point> myWalls = new ArrayList<Point>();
ArrayList<Point> myGoals = new ArrayList<Point>();

float mapX, mapY; // top left corner of the map

color baseColor;
color tileColor;
color goalColor;
color wallColor;

void setup () {
  mapX = width*0.05;
  mapY = height*0.05;
  baseColor = color(255);
  tileColor = color(255);
  goalColor = color(69);
  wallColor = color(117);
  
  // Select layout parameters here
  xySelect = xyA;
  wallSelect = wallsA;
  goalSelect = goalsA;
  
  for (Point p : wallSelect) {
    myWalls.add(p);
  }
  
  for (Point p : goalSelect) {
    myGoals.add(p);
  }
  println("height: " + height + ", width: " + width);
  println("mapX: " + mapX + ", mapY: " + mapY);
  Map m = new Map(xySelect.x, xySelect.y, myWalls, myGoals);
}

void draw () {
  
}