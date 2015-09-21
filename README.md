# controls-workshop-1
## Guide to the Grid Robot

Imagine that we've created a robot named "robert", who is facing east at position (0, 0). There happens to be a wall at position (4, 6).

Your own robot, named "r", will always start at position (0, 0), facing north.

## goForward()
This tells the robot to move forward. Be careful though, because it's fragile and will break if it tries to go into a wall or out of the map!

###### Example code
    robert.goForward(); // robert is now at position (1, 0)
  
## turnLeft()
This tells the robot to turn left in place

###### Example code
    robert.turnLeft(); // robert is still at position (1, 0), but is now facing north

## turnRight()
This tells the robot to turn right in place

###### Example code
    robert.turnRight(); // robert is still at position (1, 0), but is now facing east again

Now imagine that robert, is now facing east at position (3, 6). There happens to be a wall at position (4, 6).

### getGPS().x
This is the x-coordinate of the robot's GPS reading
###### Example code
    int GPSX;
    GPSX = robert.getGPS().x;
    println(GPSX);
  
###### Output
    3

### getGPS().y
This is the y-coordinate of the robot's GPS reading
###### Example code
    int GPSY;
    GPSY = robert.getGPS().y;
    println(GPSY);
  
###### Output
    6

### getCompass()
This is the robot's compass measurement

##### Compass legend:
- 0: south
- 1: east
- 2: north
- 3: west

###### Example code
    int heading;
    heading = robert.getCompass();
    println(heading);
    robert.turnLeft;
    heading = robert.getCompass();
    println(heading);
  
###### Output
    1
    2
    
### senseIfBlocked()
This is true when the space in front of the robot is blocked, i.e. the robot is facing a wall

###### Example code 1
    if (robert.senseIfBlocked()) {
        println("It's blocked! I can't move forward safely");
    } else {
        println("All clear up ahead! I can move forward safely");
    }
  
###### Output
    It's blocked! I can't move forward safely
    
###### Example code 2
    robert.turnLeft();
    if (robert.senseIfBlocked()) {
        println("It's blocked! I can't move forward safely");
    } else {
        println("All clear up ahead! I can move forward safely");
    }
  
###### Output
    All clear up ahead! I can move forward safely
