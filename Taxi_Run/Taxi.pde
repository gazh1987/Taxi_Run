class Taxi extends Base
{
  boolean left = false, right = false, fast = false;
  float rot = 0.0f;
  
  Taxi()
  {
    rectMode(CENTER);
    velocity = new PVector (0, 0);
    position = new PVector (width/2, height - 20);
    theta = rot;
  }
  
  void draw()
  { 
    rotateTaxi(velocity, theta);
    
    if (left == false && right == false)
    {
       pushMatrix();
       translate(position.x, position.y);
       rotate(-theta);
       fill(#f8e281);
       rect (0, 0, 30, 15);
       fill (0);
       rect (0 + 8, 0 + 8, 10, 3);
       rect (0 -8, 0 + 8, 10, 3);
       rect (0 -8, 0 - 8, 10, 3);
       rect (0 +8, 0 - 8, 10, 3);
       fill(200);
       rect (0, 0, 3, 10);
       popMatrix();
       
    }
    if (left == true)
    {
       theta += 0.04;
       pushMatrix();
       translate(position.x, position.y);
       rectMode(CENTER);
       rotate(-theta);
       fill(#f8e281);
       rect (0, 0, 30, 15);
       fill (0);
       rect (0 + 8, 0 + 8, 10, 3);
       rect (0 - 8, 0 + 8, 10, 3);
       rect (0 - 8, 0 - 8, 10, 3);
       rect (0 + 8, 0 - 8, 10, 3);
       fill(200);
       rect (0, 0, 3, 10);
       popMatrix();
    } 
    if (right == true)
    {
       theta -= 0.04;
       pushMatrix();
       translate(position.x, position.y);
       rectMode(CENTER);
       rotate(-theta);
       fill(#f8e281);
       rect (0, 0, 30, 15);
       fill (0);
       rect (0 + 8, 0 + 8, 10, 2);
       rect (0 - 8, 0 + 8, 10, 2);
       rect (0 - 8, 0 - 8, 10, 2);
       rect (0 + 8, 0 - 8, 10, 2);
       fill(200);
       rect (0, 0, 3, 10);
       popMatrix();
    }
  }
  
  void update()
  {
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);
  }
  
  void rotateTaxi(PVector velocity, float theta) 
  { 
    velocity.x = cos(-theta);
    velocity.y = sin(-theta);
  }
  
  void checkSides()
  {
    if(position.y > height)
    {
      position.y = 110;
    }
    if(position.y < 110)
    {
      position.y = height;
    }
    if (position.x < 0)
    {
      position.x = width;
    }
    if (position.x > width)
    {
      position.x = 0;
    }
  }
}


