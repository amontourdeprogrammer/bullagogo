class Bubulle {
 //Déclaration des paramètres de base de la balle
  float x;
  float y;
  float vitesseX;
  float vitesseY;
  color couleur;

  //Constructeur de la balle
  Bubulle (float nouvX, float nouvY, color nouvCouleur) {
    x      = nouvX;
    y      = nouvY;
    couleur    = nouvCouleur;

    vitesseX = 2+ random(-1,1);
    vitesseY = 2+ random(-1,1);
  }

  //Dessin de la balle
  void display() {
    fill(couleur);
    ellipse(x, y, 8, 8);
  }

  //Déplacement de la balle
  void bouge() {
    x = x + vitesseX;
    y = y + vitesseY;
  }

  void testCollision() {
    //Si la balle touche un mur, elle rebondit
    if (x > width-8 || x < 8) {
       vitesseX = vitesseX * -1;
    }
    if (y > height-8 || y < 8) {
       vitesseY = vitesseY * -1;
    }
    
  
  }

  
 
}