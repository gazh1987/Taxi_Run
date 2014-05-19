class Taxi extends Base
{
  boolean left = false, right = false, fast = false;
  boolean alive = true;
  
  Taxi()
  {
    rectMode(CENTER);
    velocity = new PVector (0, 0);
    position = new PVector (width/2, height - 20);
    theta = 0.0f;
  }
  
  void draw()
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
  
  void update()
  {
    if (left == true)
    {
       theta += 0.04;
    }
    if (right == true)
    {
       theta -= 0.04;
    }
    velocity.x = cos(-theta);
    velocity.y = sin(-theta);
    position.x += velocity.x * timeDelta * speed;
    position.y += velocity.y * timeDelta * speed;
    velocity.limit(1.5);
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
  
  void menuVersion()
  {
    fill(#f8e281);
    rect (width/2 + 50, height/2 - 8, 30, 15);
    fill (0);
    rect (width/2 + 58, height/2, 10, 3);
    rect (width/2 +42, height/2, 10, 3);
    rect (width/2 +42, height/2 - 16, 10, 3);
    rect (width/2 +58, height/2 - 16, 10, 3);
    fill(200);     
    rect (width/2 + 50, height/2 - 8, 3, 10);
  }
  
}


