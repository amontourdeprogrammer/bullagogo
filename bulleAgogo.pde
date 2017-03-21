//Déclaration d'une variable contenant le nombre de balles
int nbreBubulle = 10;
float positionX;
float positionY;


//Déclaration d'une liste d'instances de l'objet Balle
Bubulle[] bubulles = new Bubulle[nbreBubulle];

void setup() {
  smooth(); //Lissage des dessins
  size(800, 600); //Taille de la fenêtre

  //Cette boucle va créer trois balles blanches
  //au centre de l'écran
  for (int i = 0; i < nbreBubulle; i++) {
    bubulles[i] = new Bubulle(width/2, height/2,  color(240));
   
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
  
    if (mousePressed){
        for (int i = 0; i < nbreBubulle; i++) {

          bubulles[i] = new Bubulle(width/2, height/2,  color(240));

    }
    }
 
}