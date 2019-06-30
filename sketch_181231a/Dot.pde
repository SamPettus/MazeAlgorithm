class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;
  int goalX= 400;
  int goalY = 10;

  float fitness = 0;

  Dot() {
    brain = new Brain(1000);
    pos = new PVector(width/2, height-10);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  //Helper Functions

  void show() {
    if (isBest) {
      fill(147, 112, 219);
      ellipse(pos.x, pos.y, 8, 8);
    } else {
      if (dead) {
        fill(0);
      } else {
        fill(127,255,0);
      }  
      ellipse(pos.x, pos.y, 4, 4);
    }
  }
  void move() {
    if (brain.directions.length >brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }

    vel.add(acc);
    vel.limit(10);
    pos.add(vel);
  }

  void update() {
    if (!dead&&!reachedGoal)
    {
      move();
      if (pos.x<2||pos.y<2||pos.x>width-2||pos.y>height-2) {
        dead = true;
      } else if (dist(pos.x, pos.y, goalX, goalY)<5.5) {
        reachedGoal = true;
      }
    }
  }
  //--------------------------------------------------------



  void calculateFitness(Goal b) {
    if (reachedGoal) {
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step*brain.step);
    } else {
      float distanceToGoal = dist(pos.x, pos.y, b.x(), b.y());
      if (distanceToGoal>760) {
        fitness = 1.0/(distanceToGoal * distanceToGoal);
      } else {
        fitness = 1.0/(distanceToGoal * distanceToGoal) + (1/brain.step)*2.2;
      }
    }
  }
  //-----------------------------------------------------
  Dot createbaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    baby.dead = false;
    return baby;
  }
}
