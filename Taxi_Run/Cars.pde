class Cars extends Base
{
  public WayPoints[] points = new WayPoints[5];
  PVector dest;
  int p = 0;
  int x, y;
  float r, g, b;
  float distance;
  
  boolean saveX = false, saveY = false;
  
  Cars(int d0x, int d0y, int d1x, int d1y, int d2x, int d2y, int d3x, int d3y, int d4x, int d4y,int s, float r, float g, float b) 
  {
    this.r = r;
    this.g = g;
    this.b = b;
    rectMode(CENTER);
    velocity = new PVector (0, 0);
    position = new PVector(d0x, d0y);
    theta = 0.0f;
    speed = s;
    points[0] = new WayPoints(d0x, d0y);
    points[1] = new WayPoints(d1x, d1y);
    points[2] = new WayPoints(d2x, d2y);
    points[3] = new WayPoints(d3x, d3y);
    points[4] = new WayPoints(d4x, d4y);
  }
  
  void draw()
  { 
    pushMatrix();
    theta = atan2(velocity.y, velocity.x);
    translate(position.x, position.y);
    rotate(-theta);
    fill(r, g, b);
    rect (0, 0, 30, 15);
    fill (0);
    rect (0 + 8, 0 + 8, 10, 3);
    rect (0 -8, 0 + 8, 10, 3);
    rect (0 -8, 0 - 8, 10, 3);
    rect (0 +8, 0 - 8, 10, 3);
    popMatrix();
  }
  
  void update()
  {
    dest = new PVector(points[p].points.x, points[p].points.y);
    velocity = PVector.sub(dest, position);
    velocity.normalize(); 
    position.add(PVector.mult(velocity, speed * timeDelta));
    
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);

    x = (int)position.x;
    y = (int)position.y;
    
    if (x == points[p].points.x)
    {
      saveX = true;
    }
    if (y == points[p].points.y)
    {
      saveY = true;
    }
    if (saveX == true && saveY == true)
    {
      if (p == 4)
      {
        p = 0;
      }
      else
      {
        p++;
      }
      saveX = false;
      saveY = false;
    } 
  }
  
  void hitDetection()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    if (distance < 23)
    {
     taxi.alive = false;
    }
  }
}
