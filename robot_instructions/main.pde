import java.util.ArrayList;
import java.awt.Point;

  void delay (int delay) {
    int time = millis();
    while (millis() - time <= delay);
  }

int executionSpeed = 750; // 0 is the fastest

Point xySelect; // Add dimension checks later
ArrayList<Point> wallSelect;
ArrayList<Point> goalSelect;

ArrayList<Point> myWalls = new ArrayList<Point>();
ArrayList<Point> myGoals = new ArrayList<Point>();

float mapX, mapY; // top left corner of the map

color baseColor;
color tileColor;
color goalColor;
color wallColor;

Map m;
Robot r;

void settings () {
  size(760, 760);
}
 
void setup () { 
  mapX = width*0.05;
  mapY = height*0.05;
  baseColor = color(255);
  goalColor = color(0, 255, 0);
  wallColor = color(117);
    
  // Select layout parameters here
  chooseLayout();
  
  myWalls = wallSelect;
  myGoals = goalSelect;
  
  m = new Map(xySelect.x, xySelect.y, myWalls, myGoals);
  r = new Robot(1, 1, 1, m);
  //r.facing = 2;
  noLoop();
}

void draw () {
  for(int i = 0; i < m.xSize; i++) {
    for(int j = 0; j < m.ySize; j++) {
      drawTile(r, m.tileArray[i][j]);
    }
  }
}

void mousePressed() {
 robotInstructions();
 m.endRun();
}

void drawTile(Robot r, Tile t) {
  if (t.isOccupied) {
    t.drawRobot(r);
  }
  else {
      if (t.isGoal) {
       fill(goalColor);
      }
      if (t.isWall) {
        fill(wallColor);
      }
      rect(t.dispX, t.dispY, t.xSize, t.ySize);
      fill(baseColor);
  }
  redraw();
}