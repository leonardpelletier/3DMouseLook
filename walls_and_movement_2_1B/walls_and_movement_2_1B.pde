//camera variables
float eyex, eyey, eyez; //camera position
float focusx, focusy, focusz; //point at which camera faces
float upx, upy, upz; //tilt axis

//keyboard variables
boolean wkey, akey, dkey, skey; 

void setup() {
  size(800, 800, P3D);
  
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;
  
  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
}

void draw() {
  background(0);
  
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  
  move();
  drawAxis();
  drawFloor(-2000, 2000, height, 100);
  drawFloor(-2000, 2000, 0, 100);
}

void move() {
  
  pushMatrix();
  translate(focusx, focusy, focusz);
  sphere(5);
  popMatrix();
  
  if (akey) eyex = eyex - 10;
  if (dkey) eyex = eyex + 10;
  if (wkey) eyez = eyez - 10;
  if (skey) eyez = eyez + 10;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
}

void drawAxis() {
  stroke(255,0,0);
  strokeWeight(5);
  line(0,0,0, 0,0,2000);
  line(0,0,0, 0,2000,0);
  line(0,0,0, 2000,0,0);
  noFill();
  rect(0,0,width,height);
  
}

void drawFloor(int start, int end, int level, int gap) {
  stroke(255);
  strokeWeight(1);
  int x = start;
  int z = start;
  while (x < end) {
    line(x, level, start, x, level, end);
    line(start, level, z, end, level, z);
    x = x + gap;
    z = z + gap;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
}
