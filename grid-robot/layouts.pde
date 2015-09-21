/* MAP LAYOUTS */
// A layout is defined by an x size and a y size, as well coordinates for the walls and goals

void addStrip(ArrayList<Point> walls, int x1, int y1, int x2, int y2) {
  for (int x = x1; x <= x2; x++) {
    for (int y = y1; y <= y2; y++) {
      walls.add(new Point(x, y));
    }
  }
}

void loadLayout() {
  ///* Comment out everything except the layout you want */
  //// LAYOUT A
  //Point xyA = new Point(10, 10);
  
  //Point[] wallsA = {
  // new Point(6, 9),
  // new Point(4, 2)
  //};
  
  //Point[] goalsA = {
  // new Point(4, 3),
  // new Point(9, 5)
  //};
  
  // LAYOUT B
  Point xyB = new Point (100, 100);
  ArrayList<Point> wallsB = new ArrayList<Point>();
  ArrayList<Point> goalsB = new ArrayList<Point>();
  
  addStrip(wallsB, 2, 3, 3, 99);
  addStrip(wallsB, 5, 97, 99, 97);
  goalsB.add(new Point (98,98));
  
  xySelect = xyB;
  wallSelect = wallsB;
  goalSelect = goalsB;
}