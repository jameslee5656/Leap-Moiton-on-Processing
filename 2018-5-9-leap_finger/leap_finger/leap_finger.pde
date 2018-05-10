import de.voidplus.leapmotion.*;

LeapMotion leap;
PVector fingerPosition = new PVector(0,0,0);
PVector fingerDirection;
int DataNumber = 5;
PVector []RecordPosition = new PVector[DataNumber];
PVector []RecordDirection = new PVector[DataNumber];
int RecordIndex = 0;


void setup(){
  size(800,500);
  background(255);
  
  leap = new LeapMotion(this).allowGestures();
}

void draw(){
  background(255);
  
  for (Hand hand : leap.getHands ()) {
    Finger fingerIndex = hand.getIndexFinger();
    fingerPosition = fingerIndex.getPosition();
    fingerDirection = fingerIndex.getDirection();
  }
  RecordPosition[RecordIndex] = fingerPosition;
  RecordDirection[RecordIndex] = fingerDirection;
  if(RecordIndex == (DataNumber - 1)){
    float Rotation = check(RecordPosition,RecordDirection,DataNumber);
    RecordIndex = 0;
    for(int i = 0;i < DataNumber;i++){
      print(RecordPosition[i]);
    }
    println(" " + Rotation);
  }
  else{RecordIndex++;}
  
}

float check(PVector []pos , PVector []dir , int dataNumber){
  int checkbit;
  float rotate = 1;
  
  for(checkbit = 1 ; checkbit < DataNumber ; checkbit++){
    if((Math.abs(pos[checkbit-1].y - pos[checkbit].y) < 2) && (Math.abs(pos[checkbit-1].z - pos[checkbit].z) < 1.5 ) && (dir[checkbit].y > 0)){  //direction not done
      continue;
    }
    else{
      break;
    }
  }
  if(checkbit == dataNumber){
    rotate = pos[dataNumber].x - pos[0].x;
    return rotate;
  }
  else{
    return 0;
  }
}
