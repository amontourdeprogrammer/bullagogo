Bubulle[] bubulles = new Bubulle[20];

void setup() {
noStroke();
  size(500,500);
  colorMode(HSB);      
  smooth();            

  // pour chaque objet, choisir une taille &position de depart
  for(int i=0; i < bubulles.length; i++) {
    float taille = random(20,60);
    float depart_x = random(width);
    float depart_y = random(height);
    bubulles[i] = new Bubulle(depart_x, depart_y, taille);
  }
}

void draw() {

  background(0);

  for(int i=0; i < bubulles.length; i++) {
    bubulles[i].draw();
  }

}