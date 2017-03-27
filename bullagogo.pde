int nbBubbles, timeElapsed;
float radius, smallRadius;
ArrayList<Bubble> bubbles;

void setup() {
  //ellipseMode(RADIUS);
  size(800, 600);

  nbBubbles = 2;
  radius = 100;
  smallRadius = radius;
  bubbles = new ArrayList<Bubble>();
  timeElapsed = millis();

  for (int i = 0; i < nbBubbles; i++) {
    bubbles.add(new Bubble(radius + 100*(i+1), radius + 100*(i+1),  color(240), radius));
  }
}

void draw() {
  fill(12);
  noStroke();
  rect(0, 0, width, height);

  for (Bubble b : bubbles) {
    if (!b.exploded) {
      b.display();
      b.move();
    }
  }
  nbBubbles = bubbles.size();
  //print(nbBubbles);
  if (nbBubbles <= 500) {
    splitBubbles();
  }
}


void splitBubbles() {
  for (int i = 0; i < nbBubbles; i++) {
    for (int j = i + 1; j < nbBubbles; j++) {
      float space = PVector.dist(bubbles.get(i).position, bubbles.get(j).position);
      if(space <= 2*radius) {
        smallRadius = max(smallRadius - 1.5, 30);
        splitBubble(bubbles.get(i));
        splitBubble(bubbles.get(j));
        radius = smallRadius;
      }
    }
  }
}

void splitBubble(Bubble b){
  if (!b.exploded && (millis() - timeElapsed) > 500) {
      b.exploded = true;
      b.position.set(0, 0);
      bubbles.add(new Bubble(random(radius,width-radius), random(radius, height-radius), color(random(0, 255),random(0, 255),random(0, 255)), smallRadius));
      bubbles.add(new Bubble(random(radius,width-radius), random(radius, height-radius), color(random(0, 255),random(0, 255),random(0, 255)), smallRadius));
      timeElapsed = millis();
  }
}