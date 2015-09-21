/* Create your robot on this line! */

void robotInstructions () {
/* Code your robot's behavior in here! */
  if (!r.senseIfBlocked()) {
    r.goForward();
  } else {
    r.turnRight();
  }
}