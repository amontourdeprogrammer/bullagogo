Bubulle[] bubulles = new Bubulle[2];

void setup() {

  size(500,500);
  colorMode(HSB);      // HSB simplifie les couleurs al�atoires
  noStroke();
  smooth();            // formes anti-alias�es

  // pour chaque objet, choisir une taille &position de d�part
  for(int i=0; i < bubulles.length; i++) {
    float taille = random(5,30);
    float depart_x = random(width);
    float depart_y = random(height);
    bubulles[i] = new Bubulle(depart_x, depart_y, taille);
  }
}

void draw() {

  background(255);

  for(int i=0; i < bubulles.length; i++) {
    bubulles[i].draw();
  }

}