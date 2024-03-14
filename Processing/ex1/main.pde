int vitesse_perso = 7;

int last_second = millis();

boolean move_left = false;
boolean move_right = false;
boolean move_up = false;
boolean move_down = false;


ArrayList<Projectile> projs = new ArrayList<Projectile>();

Player player = new Player();

void setup() {
  size(500, 700);
}

void draw() {
  if (player.vie <= 0){
    exit();
  }
  
  if(last_second+1200 <= millis()){
    println("chance");
    last_second = millis();
     int chance = int(random(100));
     if(chance <= 50){
       projs.add(new Projectile());
       println("HIT");
     }
  }
  
  for(int i = 0;i<projs.size();i++){
    if(projs.get(i).pos_y-50>700){
      projs.remove(i);
    }
  }
  background(255,255,255);
  
  textSize(100);
  fill(250,0,0);
  text(player.vie , 50 , 100);
  
  for (int i = 0;i<projs.size();i++){
    projs.get(i).display();
    projs.get(i).move();
  }
  player.display();
  player.move();
  is_collide();
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
