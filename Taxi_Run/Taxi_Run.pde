PFont f, s;
ArrayList<Customers> cust_dest;
ArrayList<Base> objects; 
Score score;
Taxi taxi;
Cars car1;
Cars car2;
Cars car3;
Cars car4;
Cars car5;
Cars car6;
Cars car7;
Cars car8;
Customers customer; 
Destination dest;
Buildings topLeft;
Buildings topRight;
Buildings bottomLeft;
Buildings bottomRight;
Header header;
Fuel fuel;
ReFuel rFuel;

void setup()
{
  size (1000, 650);
  f = loadFont("ShowcardGothic-Reg-48.vlw");
  s = loadFont("GillSansMT-Bold-10.vlw");
  textFont(f);
  background(180);
  
  //Customer / Destination
  cust_dest = new ArrayList<Customers>();
  customer = new Customers();
  dest = new Destination();
  cust_dest.add(customer);
  
  //Game Objects
  objects = new ArrayList<Base>();
  taxi = new Taxi();
  car1 = new Cars(260, 580, 445, 580, 445, 385, 70, 385, 71, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car2 = new Cars(261, 350, 445, 350, 445, 155, 70, 155, 71, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car3 = new Cars(661, 350, 555, 350, 555, 149, 931, 150, 931, 350, 25, random(0, 255), random(0, 255), random(0, 255));
  car4 = new Cars(661, 580, 555, 580, 555, 385, 931, 385, 931, 580, 20, random(0, 255), random(0, 255), random(0, 255));
  car5 = new Cars(445, 385, 70, 385, 71, 580, 260, 580, 445, 580, 25, random(0, 255), random(0, 255), random(0, 255));
  car6 = new Cars(445, 155, 70, 155, 71, 350, 261, 350, 445, 350, 30, random(0, 255), random(0, 255), random(0, 255));
  car7 = new Cars(555, 149, 931, 150, 931, 350, 661, 350, 555, 350, 25, random(0, 255), random(0, 255), random(0, 255)); 
  car8 = new Cars(555, 385, 931, 385, 931, 580, 661, 580, 555, 580, 20, random(0, 255), random(0, 255), random(0, 255)); 
  topLeft = new Buildings(width/4 + 5, height/4 + 70);
  bottomRight = new Buildings(width - width/4 - 15, height - height/4 - 30);   
  bottomLeft = new Buildings(width/4 + 5, height - height/4 - 30);
  topRight = new Buildings(width - width/4 - 15, height/4 + 70);
  fuel = new Fuel();
  rFuel = new ReFuel();
  
  objects.add(topLeft);
  objects.add(bottomRight);
  objects.add(bottomLeft);
  objects.add(topRight); 
  objects.add(taxi);
  objects.add(car1);
  objects.add(car2);
  objects.add(car3);
  objects.add(car4);
  objects.add(car5);
  objects.add(car6);
  objects.add(car7);
  objects.add(car8);
  objects.add(fuel);
  
  header = new Header();
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
  
  for (Base o : objects)
  {
    o.draw();
    o.update();
    o.checkSides();
    o.hitDetection();
    o.reFuel();
  }
  if (rFuel.remove == true)
  {
    rFuel.remove = false;
    objects.remove(rFuel);
  }
  
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
  
  if (rFuel.place == false)
  {
    if (fuel.fuel < 85)
    {
      rFuel.place = true;
      if (rFuel.place == true)
      {
        rFuel.randomise();
        objects.add(rFuel);
      }
    }
  }
  
  score.draw();
}

void keyPressed()
{
  //Turning
  if (keyCode == LEFT || key == 'a' || key == 'A')
  {
    taxi.left = true;
  }
  if (keyCode == RIGHT || key == 'd' || key == 'D')
  {
    taxi.right = true;
  }
  
  //Speed
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

//Stopping Turning
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

