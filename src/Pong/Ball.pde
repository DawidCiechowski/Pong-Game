class Ball {
  float vx, vy;
  float x = width/2;
  float y = height/2;
  float r = 14;
  
  Ball() {
    reset();
  }
  
  void checkLeftPlank(Plank p) {
   if(y - r < p.y + p.yScale/2 && y + r > p.y - p.yScale/2 && x - r < p.x + p.w/2) {
     if(x > p.x) {
      float diff = y - (p.y - p.yScale/2);
      float rad = radians(45);
      float angle = map(diff, 0, p.yScale, -rad, rad);
      vx = 10 * cos(angle);
      vy = 10 * sin(angle);
      x = p.x + p.w/2 + r;
     }
   }
  }
  
  void checkRightPlank(Plank p) {
    if(y - r < p.y + p.yScale/2 && y + r > p.y - p.yScale/2 && x + r > p.x - p.w/2) {
      if(x < p.x) {
      float diff = y - (p.y - p.yScale/2);
      float angle = map(diff, 0, p.yScale, radians(225), radians(135));
      vx = 10 * cos(angle);
      vy = 10 * sin(angle);
      x = p.x - p.w/2 - r;
      }
    }
  }
  void update() {
    x = x + vx;
    y = y + vy;
  }
  
  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    vx = 10 * cos(angle);
    vy = 10 * sin(angle);
    
    if(random(1) > 0.5) {
     vx *= -1; 
    }
  }
  
  void edges() {
   if(y < 0 || y > height) {
     vy *= -1; 
   }
   
   if(x-r > width) {
     leftScore++;
     reset();
   }
   
   if(x+r < 0) {
     rightScore++;
     reset();
   }
  }
  
  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}