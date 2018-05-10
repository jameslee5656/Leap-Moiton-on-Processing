import de.voidplus.leapmotion.*;
import java.util.Arrays;
import java.util.concurrent.TimeUnit;

LeapMotion leap;
PrintWriter output;

PVector positionVector = new PVector (0,0,0);
PVector pastPositionVector = new PVector (0,0,0);

int dataNumber = 5;
int[] checkFlag = new int[dataNumber];  
int number = 1;

float totalDeltaY = 0;
float handPitch = 0;

void setup(){
  size(800,500);
  background(255);
  
  leap = new LeapMotion(this).allowGestures();
  
  Arrays.fill(checkFlag,0);
  
  output = createWriter("D:/exapmle/positions.txt"); 
  
  output.println("(number)      (hand position)       (flag)    (last Y) (deltaY)   (totalDeltaY)");
}

// ======================================================

void draw(){
  background(255);
  
  for (Hand hand : leap.getHands ()) {
    
    handPitch = hand.getPitch();
    positionVector = hand.getPosition();
  }
  
  output.printf( "%4d.  [ %8.5f, %8.5f, %8.5f ]"  
                , number, positionVector.x ,positionVector.y,positionVector.z); //+ " " + handPitch
  //print(number + ". " + positionVector ); //+ " " + handPitch
  System.out.printf( "%4d.  [ %8.5f, %8.5f, %8.5f ]" 
                , number, positionVector.x , positionVector.y, positionVector.z);
  check(pastPositionVector,handPitch);
  number++;
  
  pastPositionVector = positionVector;
  
  /*try {
    Thread.sleep(10);
  } catch(InterruptedException e) {
    System.out.println("got interrupted!");
  }*/
}

boolean check (PVector pv, float hp){
  boolean checksum = false;
  float deltaX = abs(pv.x - positionVector.x);
  float deltaZ = abs(pv.z - positionVector.z); 
  float deltaY = abs(pv.y - positionVector.y); 
  
  if((deltaX < 2)&&(deltaZ < 0.5)&&((deltaX !=0) || (deltaZ !=0))
        &&(deltaY > 0.5)&&(hp < 55)&&(hp > -30)){
    for(int a = 0; a < checkFlag.length; a++){
      if(checkFlag[a] == 0){
        checkFlag[a] = 1;
        totalDeltaY += deltaY;
        break;
      }
      else{
        totalDeltaY += deltaY;
        continue;
      }
    }
  }
  else{
    for(int a = 0; a < checkFlag.length; a++){
      checkFlag[a] = 0;
    }
    totalDeltaY = 0;
  }
  
  output.print(" ");
  print(" ");
  for(int a = 0; a < checkFlag.length; a++){
    output.print(checkFlag[a] + " ");
    print(checkFlag[a] + " ");
  }
 /* output.println( "totalDeltaY = " + totalDeltaY + " deltaX = " + deltaX + " deltaZ = " + deltaZ);
  println( "totalDeltaY = " + totalDeltaY + " deltaX = " + del taX + " deltaZ = " + deltaZ);
 */
  output.printf( " %8.5f %8.5f %8.5f", pv.y, deltaY, totalDeltaY);
  output.println();
  System.out.printf( " %8.5f %8.5f %8.5f\n", pv.y, deltaY, totalDeltaY);
  return checksum;
}
