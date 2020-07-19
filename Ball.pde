class Ball {
  float r;              // radius
  float x, y;           // location
  float xspeed, yspeed; // speed
  float c;
  float d;
  float e;

  // Constructor
  Ball(float tempR, float tempC, float tempD, float tempE) {
    r = tempR;
    x = random(width);
    y = random(height);
    c=tempC;
    d=tempD;
    e=tempE;
    xspeed = random( - 5, 5);
    yspeed = random( - 5, 5);
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y

    // Check horizontal edges
    if (x > width-r/2 || x < r/2) {
      xspeed *= -1;
    }
    //Check vertical edges
    if (y > height-r/2 || y < r/2) {
      yspeed *= -1;
    }
  }

  // Draw the ball
  void display() {
    stroke(0);
    fill(c, d, e);
    ellipse(x, y, r*2, r*2);
  }
}
