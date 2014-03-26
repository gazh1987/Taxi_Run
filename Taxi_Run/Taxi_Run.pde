PFont f, s;
Score score;
Taxi taxi;
Customers customer; 
Destination dest;
ArrayList<Customers> cust_dest;
Buildings topLeft;
Buildings topRight;
Buildings bottomLeft;
Buildings bottomRight;
Header header;

void setup()
{
  size (1000, 650);
  f = loadFont("ShowcardGothic-Reg-48.vlw");
  s = loadFont("GillSansMT-Bold-10.vlw");
  textFont(f);
  background(180);
  header = new Header();
  taxi = new Taxi();
  cust_dest = new ArrayList<Customers>();
  customer = new Customers();
  dest = new Destination();
  cust_dest.add(customer);
  topLeft = new Buildings(width/4 + 5, height/4 + 70);
  bottomRight = new Buildings(width - width/4 - 15, height - height/4 - 30);   
  bottomLeft = new Buildings(width/4 + 5, height - height/4 - 30);//bottomLeft;
  topRight = new Buildings(width - width/4 - 15, height/4 + 70);//bottomLeft;
  score = new Score();
}

void draw()
{
  if (customer.startGame == true)
  {
    customer.randomise();
    customer.startGame = false;
  }
  background(150);
  header.draw();
  topLeft.draw();
  topRight.draw();
  bottomLeft.draw();
  bottomRight.draw();
  topLeft.hitDetection();
  topRight.hitDetection();
  bottomLeft.hitDetection();
  bottomRight.hitDetection();
  for (Customers c : cust_dest)
  {
    c.draw();
    c.hitDetection();
    if (c.collected == true)
    {
      if (c.switch_beetween_cust_dest == true)
      {
        dest.randomise();
        cust_dest.add(dest);
      }
      else if (c.switch_beetween_cust_dest == false)
      {
        customer.randomise();
        cust_dest.add(customer);
        score.addScore();
      }
      cust_dest.remove(c);
      c.collected = false;
    }  
  }
  taxi.draw();
  taxi.update();
  taxi.checkSides();
  score.draw();
}

void keyPressed()
{
  if (keyCode == LEFT || key == 'a' || key == 'A')
  {
    taxi.left = true;
    //taxi.theta += 0.1;
  }
  if (keyCode == RIGHT || key == 'd' || key == 'D')
  {
    taxi.right = true;
    //taxi.theta -= 0.1;
  }
  if (keyCode == UP || key == 'w' || key == 'W')
  {
    if (taxi.fast == true)
    {    
      taxi.speed *= 1;
    }
    else
    {
      taxi.speed *= 1.5;
      taxi.fast = true;
    }
  }
  if (keyCode == DOWN || key == 's' || key == 'S')
  {
    if (taxi.fast == false)
    {    
      taxi.speed *= 1;
    }
    else
    {
      taxi.speed = 100;
      taxi.fast = false;
    }
  }
}

void keyReleased()
{
  if (keyCode == LEFT || key == 'a' || key == 'A' )
  {
    taxi.left = false;
  }
  if (keyCode == RIGHT || key == 'd' || key == 'D')
  {
    taxi.right = false;
  }
}

