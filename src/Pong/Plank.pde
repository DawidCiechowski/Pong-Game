class Plank {
  float x; 
  float y = (height/2);
  float w = 20;
  float movement = 0;
  float yScale = 150;
  
  Plank(boolean left){
    if(left) {
      x = w;
    } else {
      x = width - (w +1);
    }
  }
  
  void dir(float y) {
    movement = y;
  }
  
  void update() {
    y += movement;
    y = constrain(y, yScale/2, height-yScale/2);
  }
  void show(){
    fill(255);
    noStroke();
    rectMode(CENTER);
    rect(x, y, w, yScale);
  }
}