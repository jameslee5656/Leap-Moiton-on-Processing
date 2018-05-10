float checkSize (PVector pv, float hp){
  //boolean checksum = false;
  float deltaX = abs(pv.x - positionVector.x);
  float deltaZ = abs(pv.z - positionVector.z); 
  float deltaY = (pv.y - positionVector.y); 
  
  if((deltaX < 2)&&(deltaZ < 0.5)&&((deltaX !=0) || (deltaZ !=0))
        &&(abs(deltaY) > 0.5)&&(hp < 55)&&(hp > -30)){ //deltaY need for check
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
  return totalDeltaY;
}
