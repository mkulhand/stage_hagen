int vitesse_perso = 8;
int temps = 2000;
int last_second = millis();

boolean move_left = false;
boolean move_right = false;
boolean move_up = false;
boolean move_down = false;

PImage background;
PImage etoile;
PImage etoile2;
PImage ship;
PImage monstre_spe;
PImage asteroid;
PImage heal;
PImage heart_1;
PImage heart_2;

ArrayList<Projectile> projs = new ArrayList<Projectile>();

Player player = new Player();

void setup() {
  size(500, 700);
  load_background();
  load_projs();
  load_heart();
  ship = loadImage("assets/ship.png");
}
void load_background(){
  background = loadImage("assets/background_1.png");
  etoile = loadImage("assets/background_2.png");
  etoile2 = loadImage("assets/background_3.png");
}

void load_projs(){
  monstre_spe = loadImage("assets/monstre.png");
  asteroid = loadImage("assets/asteroid.png");
  heal = loadImage("assets/heal.png");
}

void load_heart(){
  heart_1 = loadImage("assets/heart_1.png");
  heart_2 = loadImage("assets/heart_2.png");
}

void draw() {
  if (player.vie <= 0){
    exit();
  }
  
  spawn_proj();
  
  for(int i = 0;i<projs.size();i++){
    if(projs.get(i).pos_y-50>700){
      projs.remove(i);
    }
  }
  display_background();
  for(int i = 0;i<player.vie;i++){
    if(i < 5){
      image(heart_1 ,player.size_heart * i , 0);
    }
    else{
      image(heart_2,player.size_heart * i-250 , 50); 
    }
  }

  
  for (int i = 0;i<projs.size();i++){
    projs.get(i).display();
    projs.get(i).move();
  }
  player.display();
  player.move();
  is_collide();
 }
 void display_background(){
  image(background, -500, 0);
  image(background, -500,350);
  image(etoile,-200,0);
  image(etoile,-550,350);
  image(etoile2,-10,0);
  image(etoile2,-500,350);
 }

void spawn_proj(){
  if(last_second+temps <= millis()){
    println("chance");
    last_second = millis();
     int chance = int(random(100));
     if(chance <= 90){
       projs.add(new Projectile());
       println("HIT");
       if(temps >= 120){
       temps -=10;
       println(temps);
      }
    }
  }
}

void keyReleased() {
  if(keyCode==37){
       move_left=false;
    }
  
    if(keyCode==39){
      move_right=false;
    }
      if(keyCode==38){
       move_up=false;
    }
  
    if(keyCode==40){
      move_down=false;
    }
}

void keyPressed() {

    if(keyCode==37){
       move_left=true;
    }
  
    if(keyCode==39){
      move_right=true;
    }
        if(keyCode==38){
       move_up=true;
    }
  
    if(keyCode==40){
      move_down=true;
    }
}

void is_collide() {
  for (int i = 0;i<projs.size();i++){
    if(projs.get(i).has_hit == false){
      projs.get(i).is_collide();
    }
  }
}
