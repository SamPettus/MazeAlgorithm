class Population {
  Dot[] dots;
  float fitnessSum;
  int gen = 1;

  int bestDot = 0;
  int minSteps = 10000000;
  
  int worstDot = 0;



  Population(int size) {
    dots = new Dot[size];
    for (int i = 0; i<size; i++) {
      dots[i] = new Dot();
    }

  }

  void show() {
    for (int i = 0; i<dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
  }

  void update(Obstacles x) {
    for (int i = 0; i<dots.length; i++) {
      if (dots[i].brain.step>minSteps) {
        dots[i].dead = true;
      } 
      else if (x.inObstacle(dots[i])) {
        dots[i].dead = true;
      } else {
        dots[i].update();
      }
    }
  }


  void calculateFitness(Goal b) {
    for (int i = 0; i<dots.length; i++) {
      dots[i].calculateFitness(b);
    }
  }

  boolean allDotsDead() {
    for (int i = 0; i<dots.length; i++) {
      if (!dots[i].dead&&!dots[i].reachedGoal) {
        return false;
      }
    }
    return true;
  }

  void naturalSelection() {
    Dot[] evolvedDots = new Dot[dots.length];
    setBestDot();
    //setWorstDot();
    calculateFitnessSum();
    evolvedDots[0] = dots[bestDot].createbaby();
    evolvedDots[0].isBest = true;
    evolvedDots[1] = dots[bestDot].createbaby();
    for (int i = 2; i<evolvedDots.length; i++)
    {
      //select parent based off of fitness
      Dot parent = selectParent();
      evolvedDots[i] = parent.createbaby();
    }
    dots = evolvedDots;



    gen++;
  }

  void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i<dots.length; i++) {
      fitnessSum+=dots[i].fitness;
    }
  }

  Dot selectParent() {
    float rand = random(fitnessSum);

    float runningSum = 0;
    for (int i = 0; i<dots.length; i++) {
      runningSum+=dots[i].fitness;
      if (runningSum>rand) {
        return dots[i];
      }
    }
    //should never get to this point
    return null;
  }
  //-------------------------------------
  void mutate() {
    for (int i = 1; i<dots.length; i++) {
      dots[i].brain.mutate(dots[bestDot].reachedGoal);
    }
  }
  //--------------------------------------
  void setBestDot() {
    float max = 0;
    int maxIndex = 0;
    for (int i = 0; i<dots.length; i++) {
      if (dots[i].fitness>max) {
        max = dots[i].fitness;
        maxIndex = i;
      }
    }
    bestDot = maxIndex;
    if (dots[bestDot].reachedGoal) {
      minSteps = dots[bestDot].brain.step;
    }
  }
  //--------------------------------------
  void setWorstDot(){
   float min = 1000000000;
   int worstIndex = 0;
   for(int i = 0; i<dots.length; i++){
    if(dots[i].fitness<min){
     min = dots[i].fitness;
     worstIndex = i;
    }
   }
   //worstDot = worstIndex;
  }
}
