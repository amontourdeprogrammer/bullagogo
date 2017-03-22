//Déclaration d'une variable contenant le nombre de balles
int nbreBubulle = 2;
float positionX;
float positionY;
int radius = 255;

//Déclaration d'une liste d'instances de l'objet Balle
Bubulle[] bubulles = new Bubulle[nbreBubulle];

void setup() {
	smooth(); //Lissage des dessins
	size(800, 600); //Taille de la fenêtre

	//Cette boucle va créer trois balles blanches
	//au centre de l'écran
	for (int i = 0; i < nbreBubulle; i++) {
		bubulles[i] = new Bubulle(radius + 100*i, radius + 100*i,  color(240), radius);
	}
}

void draw() {
	fill(12, 12, 12, 159); // Couleur avec transparence.
	rect(0, 0, width, height);

	noStroke();

	//Cette boucle va déplacer et afficher les trois balles
	for (int i = 0; i < nbreBubulle; i++) {
		bubulles[i].bouge();
		bubulles[i].testCollision();
		bubulles[i].display();
	}
  
  for (int i = 0; i < nbreBubulle; i++) {
		for (int j = i + 1; j < nbreBubulle; j++) {
      float space = dist(bubulles[i].x, bubulles[i].y, bubulles[j].x, bubulles[j].y);
			if(space < radius/2) {
				explosion();
			}
		}
	}

	if (mousePressed){
		explosion();
	}

}

void explosion() {
	for (int i = 0; i < nbreBubulle; i++) {
		bubulles[i] = new Bubulle(radius + 100*i, radius + 100*i,  color(random(0, 255),random(0, 255),random(0, 255)), radius);
	}
}