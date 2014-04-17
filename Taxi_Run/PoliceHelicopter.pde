class PoliceHelicopter extends Base
{
  PVector dest;
  Boolean arrived = false, saveX = false, saveY = false;
  float v = 10, angle = 0, distance;
  int x, y, dest_x, dest_y;
  
  PoliceHelicopter(int a, int b)
  {
    rectMode(CENTER);
    position = new PVector (a, b);
    velocity = new PVector (0, 0);
    theta = 0.0f;
    speed = 30;
  }
  
  void draw()
  {
    pushMatrix();
    theta = atan2(velocity.y, velocity.x);
    translate(position.x, position.y);
    rotate(theta);
    fill(100);
    fill(#264ba0);
    rect(0 - 40, 0 + 5, 5, 5);
    fill(#FF0000);
    rect(0 - 40, 0 - 5, 5, 5);
    fill(255);
    rect(0 - 25, 0, 43, 5);
    fill(#264ba0);
    ellipse(0, 0, 45, 25);
    fill(220);
    rotate(angle);
    rectMode(CENTER);
    line(-50, 0,+50, 0);
    line(0, -50, 0, +50);
    popMatrix();
    
    angle += v;
  }
  
  void update()
  {
   if (arrived == false)
   {
     dest = new PVector (random(40, 960), random(120, 620));
     arrived = true;
   }
   dest_x = (int)dest.x;
   dest_y = (int)dest.y;
   velocity = PVector.sub(dest, position);
   velocity.normalize(); 
   position.add(PVector.mult(velocity, speed * timeDelta));
    
   position.x += velocity.x * timeDelta * speed;
   position.y += velocity.y * timeDelta * speed;
   velocity.limit(1.5);
   
   x = (int)position.x;
   y = (int)position.y;
   
   if (x == dest_x)
   { 
     saveX = true;
   } 
   if (y == dest_y)
   {
     saveY = true;
   }
   if (saveX == true && saveY == true)
   {
     arrived = false;
     saveX = false;
     saveY = false;
   }
  }
  
  void hitDetection()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    if (distance < 29)
    {
      taxi.alive = false;
    }
  }
}
