void chooseLayout() {
  /* Choose your map here */
  loadLayout(8); // maps 0 to 8 are available
  executionSpeed = 100; //Change this as you like
}

void robotInstructions () {
  /* Code your robot's behavior in here */
  r.turnLeft();
  r.goForward();
}