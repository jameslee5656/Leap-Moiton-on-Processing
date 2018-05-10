float rotateAngle = 0;
float siz = 20;

void displayUP(float scal) {
 
  float magnificant = 1;
  
  if(scal != 0){
    if(abs(scal)>100){
      if(scal > 0){
        scal = 100;
      }
      else{
        scal = -100;
      }
    }
    magnificant = 0.015 * scal;
    siz += magnificant;
    if (siz > 40){
      siz = 40;
    }
    else if(siz < 10){
      siz = 10;
    }
  }
  
  noStroke();
  pushMatrix();
  //default camera :(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
  //width/2.0, height/2.0, 0, 0, 1, 0)
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), //where am I
          width/2.0, height/2.0, (height/2.0)  / tan(PI*30.0 / 180.0 ) - 1,//where I look 
          0, 1, 0); //the direction;*/
  scale(siz);
  translate(width/(siz*2), height/(siz*2), height / (siz)*tan(PI*30.0 / 180.0));
  

  
  rotateY(rotateAngle);
  shape(dice_UP);
  popMatrix();
  
  rotateAngle+=.012;
}
