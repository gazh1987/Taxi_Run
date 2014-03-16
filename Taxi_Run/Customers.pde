class Customers extends Base
{
  boolean collected = false, startGame = true;
  boolean switch_beetween_cust_dest = false;
  
  Customers()
  {
    position = new PVector(random(4, 994), random(4, 560));
  }
  
  void draw()
  {
    fill(255);
    ellipse(position.x+18, position.y-20, 40, 20);
    fill(#da5f1e);
    ellipse(position.x, position.y, 12, 14);
    fill(255);
    ellipse(position.x, position.y, 10, 10);
    fill(#34a6e0);
    rect (position.x, position.y+10, 8, 10);
    rect (position.x, position.y+10, 8, 10);
    rect (position.x+5, position.y+9, 3, 8);
    rect (position.x-5, position.y+4, 3, 8);
    fill(#da5f1e);
    rect (position.x+2, position.y+19, 4, 8);
    rect (position.x-2, position.y+19, 4, 8);
    fill(0);
    text("TAXI!", position.x+5, position.y -15, 30); 
  }
  
  void randomise()
  {
    position.x = (random(4, 994));
    position.y = (random(4, 560));
    if (((position.y < 100) || position.x > topLeft.position.x- 168 && position.y < topLeft.position.y +100 && position.x < topLeft.position.x + 168 && position.y > topLeft.position.y - 68) || (position.x > topRight.position.x- 168 && position.y < topRight.position.y +100 && position.x < topRight.position.x + 168 && position.y > topRight.position.y - 68)|| (position.x > bottomRight.position.x- 168 && position.y < bottomRight.position.y +100 && position.x < bottomRight.position.x + 168 && position.y > bottomRight.position.y - 68)||(position.x > bottomLeft.position.x- 168 && position.y < bottomLeft.position.y +100 && position.x < bottomLeft.position.x + 168 && position.y > bottomLeft.position.y - 68))
    {
      println("inside");
       randomise(); 
    }     
  }
  
  void hitDetection()
  {
    if (taxi.position.x > position.x- 20 && taxi.position.y < position.y +38 && taxi.position.x < position.x + 23 && taxi.position.y > position.y - 21)
    {
      collected = true;
      if (switch_beetween_cust_dest == true)
      {
        switch_beetween_cust_dest = false;
        dest.switch_beetween_cust_dest = false;
      }
      else
      {
        switch_beetween_cust_dest = true;
        dest.switch_beetween_cust_dest = true;
      }
    }
  }
  
}
