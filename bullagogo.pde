int nbBubbles, timeElapsed;
float radius, divideRadius;
ArrayList<Bubble> bubbles;

void setup() {
  //ellipseMode(RADIUS);
  size(800, 600);

  nbBubbles = 2;
  radius = 100;
  divideRadius = radius;
  bubbles = new ArrayList<Bubble>();
  timeElapsed = millis();

  for (int i = 0; i < nbBubbles; i++) {
    bubbles.add(new Bubble(radius + 100*(i+1), radius + 100*(i+1),  color(240), radius));
  }
}

void draw() {
  fill(12);
  rect(0, 0, width, height);
  noStroke();

  for (int i = 0; i < bubbles.size(); i++) {    
    if (!bubbles.get(i).exploded) {
      bubbles.get(i).display();
      bubbles.get(i).move();
    } 
  }
  nbBubbles = bubbles.size();
  //print(nbBubbles);
  if (nbBubbles <= 500) {
    divideBubbles();
  }
}


void divideBubbles() {
  for (int i = 0; i < nbBubbles; i++) {
    for (int j = i + 1; j < nbBubbles; j++) {
      float space = dist(bubbles.get(i).x, bubbles.get(i).y, bubbles.get(j).x, bubbles.get(j).y);
      if(space <= 2*radius) {
        divideRadius = max(divideRadius - 1.5, 30);
        divide(bubbles.get(i));
        divide(bubbles.get(j));
        radius = divideRadius;
      }
    }
  } 
}

void divide(Bubble b){
  if (!b.exploded && (millis() - timeElapsed) > 500) {
      b.exploded = true;
      b.x = 0;
      b.y = 0;
      bubbles.add(new Bubble(3*b.radius, random(height), color(random(0, 255),random(0, 255),random(0, 255)), divideRadius));
      bubbles.add(new Bubble(random(width), 3*b.radius, color(random(0, 255),random(0, 255),random(0, 255)), divideRadius));
      timeElapsed = millis();
  }
}