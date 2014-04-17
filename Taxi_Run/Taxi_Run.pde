import ddf.minim.*;
Minim minim;
AudioPlayer theme;
AudioPlayer menuMusic;
AudioPlayer collect;

PFont f1, s, m;
ArrayList<Customers> cust_dest;
ArrayList<Base> objects; 
MainMenu menu;
Score score;
Taxi taxi;
PoliceHelicopter police1;
PoliceHelicopter police2;
PoliceHelicopter police3;
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
int SIZE = 45;
Clouds clouds[] = new Clouds[SIZE];

void setup()
{
  size (1000, 650);
  f1 = loadFont("ShowcardGothic-Reg-48.vlw");
  s = loadFont("GillSansMT-Bold-10.vlw");
  m = loadFont("BrushScriptMT-48.vlw");
  textFont(f1);
  background(180);
  
  //Sound
  minim = new Minim(this);
  menuMusic = minim.loadFile("TaxiDriverTheme.wav");
  collect = minim.loadFile("collect.wav");
  theme = minim.loadFile("BullittTheme.wav");
  
  //Menu
  menu = new MainMenu();
  for (int i = 0; i < SIZE; i ++)
  {
    clouds[i] = new Clouds();
  }
  
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
  police1 = new PoliceHelicopter(40, 960);
  police2 = new PoliceHelicopter(960, 620);
  police3 = new PoliceHelicopter(40, 620);
  
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
  objects.add(police1);
  objects.add(police2);
  objects.add(police3);
  
  header = new Header();
  score = new Score();
}

void draw()
{ 
  if (menu.game == false)
  {
    background(#50afe5);
    for (int i = 0; i < SIZE; i ++)
    {
      clouds[i].draw();
      clouds[i].update();
      clouds[i].checkSides();
    }
    menu.logo();
    menu.update();
    menu.instruction();
    menuMusic.play();
  }
  else if (menu.game == true)
  {
    theme.play();
    if (customer.startGame == true)
    {
      customer.randomise();
      customer.startGame = false;
    }
    background(150);
    header.draw();
    
    for (Customers c : cust_dest)
    {
      c.draw();
      c.hitDetection();
      if (c.collected == true)
      {
        if (c.switch_beetween_cust_dest == true)
        {
          collect.play();
          collect.rewind();
          dest.randomise();
          cust_dest.add(dest);
        }
        else if (c.switch_beetween_cust_dest == false)
        {
          collect.play();
          collect.rewind();
          customer.randomise();
          cust_dest.add(customer);
          score.addScore();
        }
        cust_dest.remove(c);
        c.collected = false;
      }  
    }
    
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
  if (taxi.alive == false)
  {
    //Getting error when put in for loop!!
    objects.remove(topLeft);
    objects.remove(bottomRight);
    objects.remove(bottomLeft);
    objects.remove(topRight); 
    objects.remove(taxi);
    objects.remove(car1);
    objects.remove(car2);
    objects.remove(car3);
    objects.remove(car4);
    objects.remove(car5);
    objects.remove(car6);
    objects.remove(car7);
    objects.remove(car8);
    objects.remove(fuel);
    objects.remove(police1);
    objects.remove(police2);
    objects.remove(police3);
    cust_dest.remove(customer);
    cust_dest.remove(dest);
    
    header.expandHeader();
    textSize(40);
    fill(32);
    text("Game Over!\nYou scored: " + score.score, width/2-125, height/2-100);
    text("Press the 'r' key \nto return to opening\nscreen! ", width/2-125, height/2+50);
    if (key == 'r' | key == 'R')
    {
      minim.stop();
      setup();
    }
  }
}
  
void keyPressed()
{
  //Menu Option
  if (key == 's' | key == 'S') 
  {
    menuMusic.close();
    menu.game = true;
  }
  
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


