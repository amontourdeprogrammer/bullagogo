class Bubulle {
	//Déclaration des paramètres de base de la balle
	float x;
	float y;
	float vitesseX;
	float vitesseY;
	color couleur;
	int radius;

	//Constructeur de la balle
	Bubulle (float nouvX, float nouvY, color nouvCouleur, int nouvRadius) {
		x = nouvX;
		y = nouvY;
		couleur = nouvCouleur;
		radius =  nouvRadius;

		vitesseX = 2+ random(-1,1);
		vitesseY = 2+ random(-1,1);
	}

	//Dessin de la balle
	void display() {
		fill(couleur);
		ellipse(x, y, radius, radius);
	}

	//Déplacement de la balle
	void bouge() {
		x = x + vitesseX;
		y = y + vitesseY;
	}

	void testCollision() {
		//Si la balle touche un mur, elle rebondit
		if (x > width-radius/2 || x <  radius/2) {
			vitesseX = vitesseX * -1;
		}
		if (y > height-radius/2 || y < radius/2) {
			vitesseY = vitesseY * -1;
		}
	}
}