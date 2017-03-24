int nbBubbles, radius;
ArrayList<Bubble> bubbles;

void setup() {
	size(800, 600);

  nbBubbles = 2;
  radius = 255;
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
  for (int i = 0; i < nbBubbles; i++) {
		for (int j = i + 1; j < nbBubbles; j++) {
      float space = dist(bubbles.get(i).x, bubbles.get(i).y, bubbles.get(j).x, bubbles.get(j).y);
			if(space < radius/2) {
          if (!bubbles.get(i).exploded) {
            bubbles.get(i).exploded = true;
            bubbles.add(new Bubble(random(0, width), random(0,height), color(random(0, 255),random(0, 255),random(0, 255)), radius));
            bubbles.add(new Bubble(random(0, width), random(0,height), color(random(0, 255),random(0, 255),random(0, 255)), radius));
          }
          if (!bubbles.get(j).exploded) {
            bubbles.get(j).exploded = true;
            bubbles.add(new Bubble(random(0, width), random(0,height), color(random(0, 255),random(0, 255),random(0, 255)), radius));
            bubbles.add(new Bubble(random(0, width), random(0,height), color(random(0, 255),random(0, 255),random(0, 255)), radius));
          }          
          //explosion();    
			}
		}
	}

	if (mousePressed){
		explosion();
	}

}

void explosion() {
  //bubbles.add(new Bubble(0, 0,  color(random(0, 255),random(0, 255),random(0, 255)), radius));
	//for (int i = 0; i < nbBubbles; i++) {
  //  bubbles.get(i).radius -= 10;
  //  bubbles.add(new Bubble(radius + 100*i, radius + 100*i,  color(random(0, 255),random(0, 255),random(0, 255)), radius));
	//}
  for (int i = 0; i < nbBubbles; i++) {
    bubbles.get(i).colour = color(random(0, 255), random(0, 255), random(0, 255));
    bubbles.get(i).speedX *= -1;
    bubbles.get(i).speedY *= -1;
  }

}