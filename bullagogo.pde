int nbBubbles;
float radius, divideRadius;
ArrayList<Bubble> bubbles;

void setup() {
  size(800, 600);

  nbBubbles = 2;
  radius = 255;
  divideRadius = radius;
  bubbles = new ArrayList<Bubble>();

  for (int i = 0; i < nbBubbles; i++) {
    bubbles.add(new Bubble(radius + 100*i, radius + 100*i,  color(240, 200), radius));
  }
}

void draw() {
  fill(12, 12, 12, 159); // Couleur avec transparence.
  rect(0, 0, width, height);

  noStroke();

  for (int i = 0; i < bubbles.size(); i++) {
    if (!bubbles.get(i).exploded) {
      bubbles.get(i).move();
      bubbles.get(i).display();
    }
  }
  nbBubbles = bubbles.size();
  if (nbBubbles <= 100) {
    divideBubbles();
  }
}

/*void explosion() {
  for (int i = 0; i < nbBubbles; i++) {
  bubbles.get(i).colour = color(random(0, 255), random(0, 255), random(0, 255));
  bubbles.get(i).speedX *= -1;
  bubbles.get(i).speedY *= -1;
  }
  }
 */
void divide(Bubble b){
  if (!b.exploded) {
    b.exploded = true;
    bubbles.add(new Bubble(random(0, width), random(0,height), color(random(0, 255),random(0, 255),random(0, 255)), divideRadius));
    bubbles.add(new Bubble(random(0, width), random(0,height), color(random(0, 255),random(0, 255),random(0, 255)), divideRadius));
  }
}

void divideBubbles() {
  for (int i = 0; i < nbBubbles; i++) {
    for (int j = i + 1; j < nbBubbles; j++) {
      float space = dist(bubbles.get(i).x, bubbles.get(i).y, bubbles.get(j).x, bubbles.get(j).y);
      if(space < radius/2) {
        divideRadius = max(divideRadius - 2, 10);
        divide(bubbles.get(i));
        divide(bubbles.get(j));
      }
    }
  }
}
