class Destination extends Customers
{
  Destination()
  {
    position = new PVector(random(4, 994), random(4, 560));
  }
  
  void draw()
  {
    strokeWeight(0);
    fill(#e80e0e);
    ellipse(position.x, position.y, 50, 50);
    strokeWeight(1);
  }
  
  void hitDetection()
  {
    if (taxi.position.x > position.x- 20 && taxi.position.y < position.y +38 && taxi.position.x < position.x + 23 && taxi.position.y > position.y - 21)
    {
      collected = true;
      if (switch_beetween_cust_dest == true)
      {
        switch_beetween_cust_dest = false;
        customer.switch_beetween_cust_dest = false;
      }
      else
      {
        switch_beetween_cust_dest = true;
        customer.switch_beetween_cust_dest = true;
      }
    }
  }
  
  void menuVersion()
  {
    strokeWeight(0);
    fill(#e80e0e);
    ellipse(width/2 + 315, height/2 +90, 50, 50);
    strokeWeight(1);
  }
}
