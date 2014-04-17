class MainMenu
{ 
  Taxi t = new Taxi();
  Customers c = new Customers();
  Destination d = new Destination();
  ReFuel f = new ReFuel();
  
  boolean game = false;
  float y = -0.2;
  
  void logo()
  {
    fill(20);
    textFont(m);
    text("Welcome to", width/2 - 50, height/2 - 210);
    fill(40);
    textFont(f1);
    textSize(66);
    text("Taxi Run", width/2 - 135, y);
  }
  
  void update()
  {
    if (y < 170)
    {
      y += 0.8;
    }
  }
  
  void instruction()
  {
    if (y > 170)
    {
      textFont(f1);
      textSize(21);
      fill(0);
      text("Use the Direction pad or A, W, S, D to move", width/2 - 200, height/2 - 100);
      text("Press up to go fast and down to go slow", width/2 - 200, height/2 - 50);
      text("You are the taxi => ", width/2 - 200, height/2);
      t.menuVersion();
      fill(0);
      text("Collect the customer => ", width/2 - 200, height/2 + 50); 
      c.menuVersion();
      text("Drop the Customer at the Destination => ", width/2 - 200, height/2 + 100); 
      d.menuVersion();
      fill(0);
      text("Collect this to Re-Fuel => ", width/2 - 200, height/2 + 150);
      f.menuVersion();
      fill(0);
      text("Dont crash into the cars or buildings,", width/2 - 200, height/2 + 200);
      text("And avoid the police helicopters!", width/2 - 200, height/2 + 220);
      text("Press \"s\" to start the game...  ", width/2 - 200, height/2 + 270);
    }
  }
}
