class Header
{
  String header = "Taxi Run!";
  int x = 0, y = 50;
  
  void draw()
  {
    textFont(f1);
    fill(#50afe5);
    strokeWeight(2);
    rect(500, y, y + 950, y + 50);
    strokeWeight(1);
    
    textSize(50);
    fill(255);
    text(header, 400, 65);
    textSize(10);
  }
  
  void expandHeader()
  {
    y += 4;
    if (y > 300)
    {
      y = 300;
    }
  }
}
