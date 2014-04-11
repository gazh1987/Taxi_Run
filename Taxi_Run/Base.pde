class Base
{
  PVector position;
  PVector velocity;
  PVector force;
  float look;
  float theta;
  float mass;
  float speed = 100;
  float timeDelta = 1.0f / 60.0f;   
  
  void draw()
  {
  }
  
  void reFuel()
  {
  }
  
  void update()
  {
  }
  
  void hitDetection()
  {
  }
  
  void randomise()
  {
    position.x = (random(4, 994));
    position.y = (random(4, 560));
    if (((position.y < 100) || position.x > topLeft.position.x- 168 && position.y < topLeft.position.y +100 && position.x < topLeft.position.x + 168 && position.y > topLeft.position.y - 68) || (position.x > topRight.position.x- 168 && position.y < topRight.position.y +100 && position.x < topRight.position.x + 168 && position.y > topRight.position.y - 68)|| (position.x > bottomRight.position.x- 168 && position.y < bottomRight.position.y +100 && position.x < bottomRight.position.x + 168 && position.y > bottomRight.position.y - 68)||(position.x > bottomLeft.position.x- 168 && position.y < bottomLeft.position.y +100 && position.x < bottomLeft.position.x + 168 && position.y > bottomLeft.position.y - 68))
    {
       randomise(); 
    }     
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
