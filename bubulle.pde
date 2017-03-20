class Bubulle {

  color couleur;
  float x, y, taille;

  Bubulle(float depart_x, float depart_y, float t) {
    x = depart_x;
    y = depart_y;
    taille = t;
    couleur = color(random(255), 255, 255); // hue, saturation, brightness
  }

void draw(){
  dessiner();
  bouger();
}



}