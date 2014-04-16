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
    textFont(s, 10);
    text("TAXI!", position.x+5, position.y -15, 30); 
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
  
  void menuVersion()
  {
    fill(#da5f1e);
    ellipse(width / 2 + 100, height / 2 + 25, 12, 14);
    fill(255);
    ellipse(width / 2 + 100, height / 2 + 25, 10, 10);
    fill(#34a6e0);
    rect (width / 2 + 100, height / 2 + 35, 8, 10);
    rect (width / 2 + 100, height / 2 + 35, 8, 10);
    rect (width / 2 + 105, height / 2 + 34, 3, 8);
    rect (width / 2 + 95, height / 2 + 29, 3, 8);
    fill(#da5f1e);
    rect (width / 2 + 102, height / 2 + 44, 4, 8);
    rect (width / 2 + 98, height / 2 + 44, 4, 8);
    fill(0); 
  }
}
