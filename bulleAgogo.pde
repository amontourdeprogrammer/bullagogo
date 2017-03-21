//Déclaration d'une variable contenant le nombre de balles
int nbreBalle = 10;
 


//Déclaration d'une liste d'instances de l'objet Balle
Balle[] balles = new Balle[nbreBalle];

void setup() {
  smooth(); //Lissage des dessins
  size(800, 600); //Taille de la fenêtre

  //Cette boucle va créer trois balles blanches
  //au centre de l'écran
  for (int i = 0; i < nbreBalle; i++) {
    balles[i] = new Balle(width/2, height/2,  color(240));
   
  }
}

void draw() {
  fill(12, 12, 12, 122); // Couleur avec transparence.
  rect(0, 0, width, height);

  noStroke();

  //Cette boucle va déplacer et afficher les trois balles
  for (int i = 0; i < nbreBalle; i++) {
    balles[i].bouge();
    balles[i].testCollision();
    balles[i].display();
  }
  
  
 
}