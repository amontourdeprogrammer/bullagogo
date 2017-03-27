class Bubble {
  PVector position, speed;
  float SPEED = 2 + random(-1,1);
  color colour;
  float radius;
  boolean exploded;

  Bubble (float newX, float newY, color newColour, float newRadius) {
    position = new PVector(newX, newY);
    speed = new PVector(SPEED, SPEED);
    colour = newColour;
    radius =  newRadius;
    exploded = false;
  }

  void display() {
    ellipseMode(RADIUS);
    stroke(colour);
    fill(colour, 63);
    ellipse(position.x, position.y, radius, radius);
  }

  void move() {
    speed.x *= speedDirection(position.x, width);
    speed.y *= speedDirection(position.y, height);
    position.add(speed);
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