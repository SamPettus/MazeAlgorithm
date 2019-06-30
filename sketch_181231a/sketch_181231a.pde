 Population test;
Goal b;
Obstacles x;
int count= 0;

void setup() {
  size(800, 800);
  test = new Population(1000);
  b = new Goal(400, 15);
  x = new Obstacles(2);
}

void draw() {
  background(255);
  b.show();
  x.show();
  fill(175,100,220);
  textSize(32);
  text("Steps: " + count, 610, 50);
  text("Generation: " + test.gen, 50, 50);
  if (test.allDotsDead()) {
    if(test.dots[test.bestDot].reachedGoal){
      count = test.dots[test.bestDot].brain.step;
    }
    test.calculateFitness(b);
    test.naturalSelection();
    test.mutate();
  } else {
    test.update(x);
    test.show();
  }
} 
