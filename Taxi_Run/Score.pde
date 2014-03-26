class Score
{
  String s = "Score: ";
  int score = 0;
  
  void draw()
  {
    textFont(f);
    textSize(32);
    fill(255);
    text (s, 10, 60);
    text(score, 120, 60);
    textSize(10);
  }
  
  void addScore()
  {
    score += 100;
  } 
}

