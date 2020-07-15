Plank p1;
Plank p2;
Ball b;

int leftScore = 0;
int rightScore = 0;

void setup() {
  focused = true;
  size(900, 900);
  b = new Ball();
  p1 = new Plank(true);
  p2 = new Plank(false);

}

void draw() {
  background(0);
  b.checkLeftPlank(p1);
  b.checkRightPlank(p2);
 
  p1.show();
  p2.show();
  p1.update();
  p2.update();
  
  b.update();
  b.edges();
  b.show();
  
  fill(255);
  textSize(32);
  text(rightScore, 32, 40);
  text(leftScore, width-64, 40);
}

void keyPressed() {
  if(keyCode == DOWN) {
    p2.dir(8);
  }
  
  if(keyCode == UP) {
    p2.dir(-8);
  }
  
  if(key ==  'w') {
    p1.dir(-8);
  }
  
  if(key == 's') {
    p1.dir(8);
  }
}
void keyReleased() {
    if(keyCode == DOWN) {
    p2.dir(0);
  }
  
  if(keyCode == UP) {
    p2.dir(0);
  }
  
  if(key ==  'w') {
    p1.dir(0);
  }
  
  if(key == 's') {
    p1.dir(0);
  }
}