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
  if(layoutChoice == 0){
    xy = new Point (8,8);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls, 0, 0, 0, 7);
    addStrip(walls, 1, 0, 7, 0);
    addStrip(walls, 7, 1, 7, 6);
    addStrip(walls, 1, 7, 7, 7);
  }
  else if(layoutChoice == 1){
    xy = new Point (8,8);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls, 0, 0, 0, 7);
    addStrip(walls, 1, 0, 7, 0);
    addStrip(walls, 7, 1, 7, 6);
    addStrip(walls, 1, 7, 7, 7);
    
    goals.add(new Point (5,5));
  }
  else if(layoutChoice == 4){
    xy = new Point(15,15);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,14);
    addStrip(walls,0,0,14,0);
    addStrip(walls,14,0,14,14);
    addStrip(walls,0,14,14,14);
    
    int shift1 = int(random(-1,2));
    int shift2 = int(random(-1,2));
    int shift3 = int(random(-1,2));
    addStrip(walls,1,3+shift1,10,3+shift1);
    addStrip(walls,4,7+shift2,13,7+shift2);
    addStrip(walls,1,11+shift3,10,11+shift3);
    goals.add(new Point (1,13));
  }
 else if(layoutChoice == 2){
    xy = new Point(5,5);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,4);
    addStrip(walls,0,0,4,0);
    addStrip(walls,4,0,4,4);
    addStrip(walls,0,4,4,4);
    
    int rand1 = int(random(1,4));
    int rand2 = int(random(1,4));
    while(rand1 == rand2){
      rand2 = int(random(1,4));
    }
    addStrip(walls,2,rand1,2,rand1);
    addStrip(walls,2,rand2,2,rand2);
    
    goals.add(new Point(3,3));
  }
  else if(layoutChoice == 3){
    xy = new Point(11,11);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,10);
    addStrip(walls,0,0,10,0);
    addStrip(walls,10,0,10,10);
    addStrip(walls,0,10,10,10);
    addStrip(walls,1,2,4,9);
    addStrip(walls,6,1,9,8);
    goals.add(new Point (9,9));
  }
  else if(layoutChoice == 5){
    xy = new Point(4,4);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,3);
    addStrip(walls,0,0,3,0);
    addStrip(walls,3,0,3,3);
    addStrip(walls,0,3,3,3);
  }
  else if(layoutChoice == 6){
    xy = new Point(20,20);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,19);
    addStrip(walls,0,0,19,0);
    addStrip(walls,19,0,19,19);
    addStrip(walls,0,19,19,19);
    goals.add(new Point(13,17));
  }
  else if(layoutChoice == 7){
    xy = new Point(20,20);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,19);
    addStrip(walls,0,0,19,0);
    addStrip(walls,19,0,19,19);
    addStrip(walls,0,19,19,19);
    
    int goal1 = int(random(16,19));
    int goal2 = int(random(16,19));
    
    goals.add(new Point(goal1,goal2));
    
    for (int i = 1; i <= 80; i = i+1){
      int rand1 = int(random(1,19));
      int rand2 = int(random(1,19));
      while ((rand1 == 1 && rand2 == 1) && (rand1 == goal1 && rand2 == goal2)){
        rand1 = int(random(1,19));
        rand2 = int(random(1,19));
      }
      addStrip(walls,rand1,rand2,rand1,rand2);
    }
  }
  else if (layoutChoice == 8){
    xy = new Point(20,20);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,19);
    addStrip(walls,0,0,19,0);
    addStrip(walls,19,0,19,19);
    addStrip(walls,0,19,19,19);
    
    //Make Random Maze
  }
  else if(layoutChoice == 9){
    xy = new Point(20,20);
    walls = new ArrayList<Point>();
    goals = new ArrayList<Point>();
    
    addStrip(walls,0,0,0,19);
    addStrip(walls,0,0,19,0);
    addStrip(walls,19,0,19,19);
    addStrip(walls,0,19,19,19);
    
    addStrip(walls,3,1,3,10);
    addStrip(walls,1,12,6,12);
    addStrip(walls,8,10,17,10);
    addStrip(walls,3,8,15,8);
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