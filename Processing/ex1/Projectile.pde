
final int type_norm = 0;
final int type_special = 1;
final int type_heal = 2;

class Projectile {
  int pos_x = int(random(width));
  int pos_y = 0;
  int vitesse = int(random(7, 20));
  boolean has_hit = false;
  int rand = int(random(100));
  int type;

  Projectile() {
    //calcule le type
    //this.type = type_norm;
    int rand = int(random(100));
    if(rand <= 50){
      this.type = type_norm; 
    }
    if(rand >= 50 && rand <= 75){
      this.type = type_special; 
    }
    if(rand >= 75){
      this.type = type_heal; 
    }
    println(this.type);
  }
  
  void display() {
    fill(255, 0, 0);
    if(this.type == type_special){
     fill(0,0,255); 
    }
    if(this.type == type_heal){
     fill(0,255,0); 
    }
    circle(this.pos_x, this.pos_y, 50);
  }

  void move() {
    this.pos_y += this.vitesse;
  }

  void is_collide() {
    int dmg = 1;
    
    if (this.pos_y + 25 > player.pos_y && this.pos_y - 25 < player.pos_y + 50
      && this.pos_x + 25> player.pos_x && this.pos_x - 25 < player.pos_x + 50) {
        this.has_hit = true;
        if(this.type == type_special){
          dmg = 2;
        }

        player.take_damage(dmg);
    }
  }

}
