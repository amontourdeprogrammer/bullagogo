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
    checkWallHits();
    position.add(speed);
  }

  void checkWallHits() {
    position.set(offsetFromWall(position.x, width),offsetFromWall(position.y, height));
    speed.x *= speedDirection(position.x, width);
    speed.y *= speedDirection(position.y, height);
  }

  float speedDirection(float coordinate, float range) {
    if (hitWall(coordinate, range)) {
      return -1;
    } else {
      return 1;
    }
  }

  float offsetFromWall(float coordinate, float range) {
    if (coordinate >= range-radius) {
      return range-radius;
    } else if (coordinate <= radius) {
      return radius;
    } else {
      return coordinate;
    }
  }

  boolean hitWall(float coor, float rge) {
    return (coor >= rge-radius || coor <= radius);
  }
}
