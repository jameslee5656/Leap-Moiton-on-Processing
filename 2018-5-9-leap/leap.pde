import de.voidplus.leapmotion.*;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

LeapMotion leap;
PrintWriter output;

PVector positionVector = new PVector (0,0,0);
PVector pastPositionVector = new PVector (0,0,0);

PShape dice_UP;
PShape dice_DOWN;

int dataNumber = 5;
int[] checkFlag = new int[dataNumber];  
int number = 1;

float totalDeltaY = 0;
float handPitch = 0;

//Dice location : C:/Users/james/Documents/Project/leap/dice.obj
void setup(){
  size(1200, 600, P3D);
  
  
  background(0);
  
  dice_UP = loadShape("C:/Users/james/Documents/Project/test/dice.obj");
  
  leap = new LeapMotion(this).allowGestures();
  
  Arrays.fill(checkFlag,0);
  
  output = createWriter("D:/exapmle/positions.txt"); 
  
  output.println("(number)      (hand position)       (flag)    (last Y) (deltaY)   (totalDeltaY)");
}

// ======================================================

void draw(){
  background(0);
  
  for (Hand hand : leap.getHands ()) {
    
    handPitch = hand.getPitch();
    positionVector = hand.getPosition();
  }
  
  output.printf( "%4d.  [ %8.5f, %8.5f, %8.5f ]"  
                , number, positionVector.x ,positionVector.y,positionVector.z); //+ " " + handPitch
  //print(number + ". " + positionVector ); //+ " " + handPitch
  System.out.printf( "%4d.  [ %8.5f, %8.5f, %8.5f ]" 
                , number, positionVector.x , positionVector.y, positionVector.z);
  displayUP(checkSize(pastPositionVector,handPitch));
  number++;
  
  pastPositionVector = positionVector;
  
  /*try {
    Thread.sleep(10);
  } catch(InterruptedException e) {
    System.out.println("got interrupted!");
  }*/
}
