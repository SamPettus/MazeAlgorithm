class Brain{
  PVector[] directions;
  int step = 0;

   Brain(int size){
     directions = new PVector[size];
     randomize();
   }
   //Helper Functions

   void randomize(){
     for(int i = 0; i<directions.length; i++)
     {
       float randomAngle = random(2*PI);
       directions[i] = PVector.fromAngle(randomAngle);
     }
   }
   //---------------------------------------
   Brain clone(){
     Brain clone = new Brain(directions.length);
     for(int i = 0; i<directions.length; i++){
       clone.directions[i] = directions[i].copy();
     }
     return clone;
   }
   //-----------------------------------------
   void mutate(boolean reached){
     float mutationRate = 0;
     if(reached){
       mutationRate = 0.005;
     }
     else{
      mutationRate = .025; 
     }
     for(int i = 0; i<directions.length; i++){
       float rand = random(1);
       if(rand<mutationRate){
         //set this direction as a random direction
         float randomAngle = random(2*PI);
         directions[i] = PVector.fromAngle(randomAngle);
       }
     }
   }
}
