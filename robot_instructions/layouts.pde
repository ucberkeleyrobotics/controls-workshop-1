/* MAP LAYOUTS */
// A layout is defined by an x size and a y size, as well coordinates for the walls and goals

void addStrip(ArrayList<Point> walls, int x1, int y1, int x2, int y2) {
  for (int x = x1; x <= x2; x++) {
    for (int y = y1; y <= y2; y++) {
      walls.add(new Point(x, y));
    }
  }
}

void loadLayout(int layoutChoice) {
  Point xy;
  ArrayList<Point> walls;
  ArrayList<Point> goals;
  
  if(layoutChoice == 0) {
    // LAYOUT 0
    xy = new Point (8, 8);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls, 0, 0, 0, 7);
    addStrip(walls, 1, 0, 7, 0);
    addStrip(walls, 7, 1, 7, 6);
    addStrip(walls, 1, 7, 7, 7);
    //addStrip(walls, 1, 9, 9, 9);
    goals.add(new Point (6,6));

  }
  else if(layoutChoice == 1) {
    // LAYOUT 1
    xy = new Point (100, 100);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls, 2, 3, 3, 99);
    addStrip(walls, 5, 97, 99, 97);
    goals.add(new Point (98,98));
  }
  else {
    xy = new Point (1, 1);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
  }
    
    xySelect = xy;
    wallSelect = walls;
    goalSelect = goals;
    redraw();
}