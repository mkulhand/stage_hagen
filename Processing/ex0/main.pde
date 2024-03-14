
int red = 0;
int green = 0;
int blue = 0;

int circ_x = 250;
int circ_y = 250;

String shape = "CIRCLE";
int shape_size = 100;

int taille = 500;

void setup() {
  size(taille, taille);
}

void draw() {
  int half_size = shape_size/2;
  background(255, 255, 255);
  fill(red, green, blue);
  if (shape == "CIRCLE") {
    circle(circ_x,circ_y, shape_size);
  }
  if (shape == "SQUARE"){
    square(circ_x - half_size,circ_y - half_size, shape_size);
  }  
  if (shape == "TRIANGLE"){
    triangle(circ_x,circ_y - half_size,circ_x - half_size,circ_y + half_size,circ_x + half_size,circ_y + half_size);
  } 
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  //int incr = (e > 0) ? 3 : -3;
  
  int incr = 0;
  if (e > 0) {
    incr = 3;
  } else {
    incr = -3;
  }
  
  shape_size += incr;
}

void keyPressed() {
  println(keyCode);
  //SPACEBAR
  if(keyCode==32){
    red = 255;
  }
  //LEFT
  if(keyCode==37 && circ_x>0){
  circ_x-=10;
  }
  //UP
  if(keyCode==38 && circ_y>0){
    circ_y-=10;
  }
  //RIGHT
  if(keyCode==39 && circ_x<taille){
  circ_x+=10;
  }
  //DOWN
  if(keyCode==40 && circ_y<taille){
    circ_y+=10;
  }
  // 1
  if(keyCode==97){
    shape ="CIRCLE";
  }
  // 2
   if(keyCode==98){
    shape ="SQUARE";
   }
   // 3
    if(keyCode==99){
    shape ="TRIANGLE";
    }
  
}
