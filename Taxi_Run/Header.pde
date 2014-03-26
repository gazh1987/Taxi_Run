class Header
{
  String header = "Taxi Run!";
  
  void draw()
  {
    textFont(f);
    fill(#50afe5);
    strokeWeight(2);
    rect(500, 50, 1000, 100);
    strokeWeight(1);
    
    textSize(50);
    fill(255);
    text(header, 400, 65);
    textSize(10);
  }
}
