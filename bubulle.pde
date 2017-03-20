class Bubulle {

  color couleur;
  float x, y, taille;

  Bubulle(float depart_x, float depart_y, float t) {
    x = depart_x;
    y = depart_y;
    taille = t;
    couleur = color(random(255), 230, 255); // hue, saturation, brightness
  }
void draw(){
  dessiner();
  bouger();
}

void bouger() {
      // bouger al�atoirement en fonction de sa taille
      x += random(-taille,taille);
      y += random(-taille,taille);
      // boucler sur les bords du Sketch
      if (x > width + taille) x = -taille;
      if (x < -taille) x = width + taille;
      if (y > height + taille) y = -taille;
      if (y < -taille) y = height + taille;
  }

void dessiner(){
 // translate(x,y);
  fill(couleur);
  ellipse (x, y, taille, taille);
  fill(255);
  ellipse (x, y, taille/3, taille/3);
  
  
}
}