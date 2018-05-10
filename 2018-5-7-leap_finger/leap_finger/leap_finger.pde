import de.voidplus.leapmotion.*;

LeapMotion leap;

void setup(){
  size(800,500);
  background(255);
  
  leap = new LeapMotion(this).allowGestures();
}

// ======================================================
// Call Back
void leapOnInit() {
  println("Leap Motion Init");
}
void leapOnConnect() {
  println("Leap Motion Connect");
}
void leapOnDisconnect() {
  println("Leap Motion Disconnect");
}
// ======================================================

void draw(){
  background(255);
  
  for (Hand hand : leap.getHands ()) {
    Finger fingerIndex = hand.getIndexFinger();
    PVector fingerPosition = fingerIndex.getPosition();
    ellipse(fingerPosition.x , fingerPosition.y, 10 ,10 );
  }
}
