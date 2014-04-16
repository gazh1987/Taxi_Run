class Clouds
{
  PVector position = new PVector(random(width+200), random(height));
  PVector velocity = new PVector(-0.5, 0);
  
  Clouds()
  {
    stroke(255); 
    fill(255);
    ellipse (position.x, position.y, 50, 50);
    ellipse (position.x+20, position.y+10, 50, 50);
    ellipse (position.x, position.y+5, 50, 50);
    ellipse (position.x, position.y, 50, 50);
  }
  
  void draw()
  {
    stroke(255); 
    fill(255);
    ellipse (position.x, position.y, 50, 50);
    ellipse (position.x+20, position.y+10, 50, 50);
    ellipse (position.x-10, position.y+5, 50, 50);
    ellipse (position.x+30, position.y, 50, 50);
    ellipse (position.x-20, position.y+15, 50, 50);
    ellipse (position.x+20, position.y-15, 50, 50);
    ellipse (position.x-20, position.y-15, 50, 50);
    ellipse (position.x-25, position.y-15, 50, 50);
    stroke(0);
  }
  
  void update()
  {
    position.add(velocity);
  }
  
  void checkSides()
  {
    if (position.x < -80)
    {
       position.x = 1000;
    } 
  }
}
