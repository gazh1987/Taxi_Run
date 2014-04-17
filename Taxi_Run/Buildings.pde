class Buildings extends Base
{
  Buildings(int x, int y)
  {
    position = new PVector(x, y);
  }
  
  void draw()
  {
    fill(180);
    strokeWeight(0);
    //footpath
    rect (position.x, position.y + 23, 325, 150);
    stroke(100);
    fill(80);
    rect(position.x - 11, position.y + 16, 300, 130);
    strokeWeight(2);
    stroke(255);
    fill(#e7c687);
    rect(position.x, position.y, 300, 100);
    stroke(0);
    strokeWeight(2);
    fill(#9d8161);
    rect(position.x, position.y + 65, 300, 30);
    strokeWeight(0);
    rect(position.x+1, position.y - 47, 297, 3);
    fill(255);
    rect(position.x, position.y +50, 300, 3);
    stroke(150);
    fill(90);
    rect(position.x + 147, position.y + 1, 6, 96);
    stroke(0);
    fill(100);
    rect(position.x, position.y + 100, 324, 1);
    int x = 145, y = 58;
    for (int i = 0; i < 30; i ++)
    {
      strokeWeight(1);
      fill(255);
      rect(position.x - x, position.y + y, 4, 8);
      rect(position.x - x, position.y + y + 12, 3, 7);
      x -= 10;
    }
  } 
    
  void hitDetection()
  {
    if (taxi.position.x > position.x- 159 && taxi.position.y < position.y +93 && taxi.position.x < position.x + 159 && taxi.position.y > position.y - 59)
    {
      taxi.alive = false;
    }
  }
}
