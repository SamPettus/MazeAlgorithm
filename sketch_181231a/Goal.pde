class Goal{
  PVector goal;
  
  Goal(int x, int y){
    goal = new PVector(x,y);
  }
  
  void show(){
    fill(255,0,0);
    rect(goal.x,goal.y,10,10);
  }
  float x(){
    return goal.x;
  }
  float y(){
   return goal.y; 
  }
  
  
}
