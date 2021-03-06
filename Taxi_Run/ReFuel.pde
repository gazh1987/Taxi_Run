class ReFuel extends Base
{
  String s = "F";
  boolean place = false, remove = false;
  float distance;
  
  ReFuel()
  {
     position = new PVector(random(4, 994), random(4, 560));
  }
  
  void draw()
  {
    fill(#ff0000);
    ellipse(position.x + 4, position.y - 5, 30, 30);
    fill(255);
    textFont(f1);
    textSize(18);
    text (s, position.x, position.y);
  }
  
  void hitDetection()
  {
    distance = dist(taxi.position.x, taxi.position.y, position.x, position.y);
    if (distance < 24)
    {
      score.subScore();
      collect.play();
      collect.rewind();
      fuel.fuel = 190;
      fuel.r = 0;
      fuel.g = 255;
      place = false;
      remove = true;
    }
  }
  
  void menuVersion()
  {
    fill(#ff0000);
    ellipse(width/2 + 130, height/2 + 140, 30, 30);
    fill(255);
    textFont(f1);
    textSize(18);
    text (s, width/2 + 126, height/2 + 145);
  }
}
