class Bubble {
  float x, y;
  float speedX, speedY, SPEED = 2 + random(-1,1);
  color colour;
  float radius;
  boolean exploded;

  Bubble (float newX, float newY, color newColour, float newRadius) {
    x = newX;
    y = newY;
    colour = newColour;
    radius =  newRadius;
    speedX = SPEED;
    speedY = SPEED;
    exploded = false;
  }

  void display() {
    ellipseMode(RADIUS);
    stroke(colour);
    fill(colour, 63);
    ellipse(x, y, radius, radius);
  }

  void move() {
    speedX *= speedDirection(x, width);
    speedY *= speedDirection(y, height);
    x += speedX;
    y += speedY;
  }

  float speedDirection(float position, float range) {
    if (hitWall(position, range)) {
      return -1;
    } else {
      return 1;
    }
  }

  boolean hitWall(float pos, float rge) {
    return (pos >= rge-radius || pos <= radius);
  }
}