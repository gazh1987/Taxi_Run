Taxi taxi;
Customers customer;

void setup()
{
  size (1000, 600);
  background(180);
  taxi = new Taxi();
  customer = new Customers();
}

void draw()
{
  background(180);
  taxi.draw();
  taxi.update();
  taxi.checkSides();
  customer.draw();
}

void keyPressed()
{
  if (keyCode == LEFT || key == 'a' || key == 'A')
  {
    taxi.left = true;
    taxi.theta += 0.1;
  }
  if (keyCode == RIGHT || key == 'd' || key == 'D')
  {
    taxi.right = true;
    taxi.theta -= 0.1;
  }
}

