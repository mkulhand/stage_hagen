
final int type_norm = 0;
final int type_special = 1;
final int type_heal = 2;

class Projectile {
  int pos_x = int(random(10,490));
  int pos_y = 0;
  int vitesse = int(random(7, 20));
  boolean has_hit = false;
  int rand = int(random(100));
  int type;
  int size;

  Projectile() {
    //calcule le type
    //this.type = type_norm;
    int rand = int(random(100));
    if(rand <= 50){
      this.type = type_norm; 
      this.size = 80;
    }
    if(rand >= 75){
      this.type = type_special; 
      this.size = 100;
    }
    if(rand >= 50 && rand <= 75){
      this.type = type_heal; 
      this.size = 70;
    }
    println(this.type);
  }
  
  void display() {
    if(this.type == type_norm){
     asteroid.resize(this.size,0);
     image(asteroid,this.pos_x,this.pos_y);
    }
    if(this.type == type_special){
     monstre_spe.resize(this.size,0);
     image(monstre_spe,this.pos_x,this.pos_y);
    }
    if(this.type == type_heal){
     heal.resize(this.size,0);
     image(heal,this.pos_x,this.pos_y);
    }
  }

  void move() {
    this.pos_y += this.vitesse;
  }

  void is_collide() {
    int dmg = 1;
    
    if (this.pos_y + this.size   > player.pos_y + 28 && this.pos_y < player.pos_y + player.size - 28
      && this.pos_x + this.size > player.pos_x + 28 && this.pos_x < player.pos_x + player.size - 28) {
        this.has_hit = true;
        if(this.type == type_special){
          dmg = 2;
        }
        if(this.type == type_heal){
         dmg = -1; 
        }
        player.take_damage(dmg);
    }
  }

}
