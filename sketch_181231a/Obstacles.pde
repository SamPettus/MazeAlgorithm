class Obstacles {
  int course = 0;
  Obstacles(int a) {
    course = a;
  }
  void show() {
    if (course ==1)
    {
      fill(0, 0, 255);
      rect(100, 300, 600, 10);
      rect(100, 100, 200, 10);
      rect(500, 100, 200, 10);
      rect(400, 90, 10, 200);
      rect(600, 400, 10, 200);
      rect(200, 400, 10, 200);
      rect(100, 300, 10, 200);
      rect(700,300,10,200);
      rect(0, 600, 210, 10);
      rect(600, 600, 200, 10);
    } else {
      fill(0, 0, 255);
      rect(0, 400, 600, 20);
      rect(200, 600, 600, 20);
      rect(200, 200, 600, 20);
    }
  }
  boolean inObstacle(Dot w) {
    if (course==1) {
      if (w.pos.x<700 && w.pos.y<310 && w.pos.x>100 && w.pos.y>300) {
        return true;
      } else if (w.pos.x<300 && w.pos.y<110 && w.pos.x>100 && w.pos.y>100) {
        return true;
      } else if (w.pos.x<700 && w.pos.y<110 && w.pos.x>500 && w.pos.y>100) {
        return true;
      } else if (w.pos.x<410 && w.pos.y<290 && w.pos.x>400 && w.pos.y>90) {
        return true;
      } else if (w.pos.x<610 && w.pos.y<600 && w.pos.x>600 && w.pos.y>400) {
        return true;
      } else if (w.pos.x<210 && w.pos.y<600 && w.pos.x>200 && w.pos.y>400) {
        return true;
      } else if(w.pos.x<110 && w.pos.y<500 && w.pos.x>100 && w.pos.y>300){
        return true;
      }else if(w.pos.x<710 && w.pos.y<500 && w.pos.x>700 && w.pos.y>300){
        return true;
      }else if(w.pos.x<210 && w.pos.y<610 && w.pos.x>0 && w.pos.y>600){
       return true; 
      }else if(w.pos.x<800 && w.pos.y<610 && w.pos.x>600 && w.pos.y>600){
        return true;
      }
      else
        return false;
    } else {
      if (w.pos.x<600 && w.pos.y<420 && w.pos.x>0 && w.pos.y>400) {
        return true;
      } else if (w.pos.x<800 && w.pos.y<620 && w.pos.x>200 && w.pos.y>600) {
        return true;
      } else if (w.pos.x<800 && w.pos.y<220 && w.pos.x>200 && w.pos.y>200) {
        return true;
      } else {
        return false;
      }
    }
  }
}
