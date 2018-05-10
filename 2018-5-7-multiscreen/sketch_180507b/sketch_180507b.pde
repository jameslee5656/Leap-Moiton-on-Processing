PWindow win;

public void settings() {
  size(320, 240);
}

void setup() { 
  win = new PWindow();
}


class PWindow extends PApplet {
  PWindow() {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings(){
      size(500, 200);
  }
  
  void setup() {
    background(150);
  }

}
