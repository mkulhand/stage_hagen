
class Projectile {
  int pos_x = int(random(width));
  int pos_y = 0;
  int vitesse = int(random(7, 20));
  boolean is_special = false;
  boolean has_hit = false;

  Projectile() {
    //calcule le type
  }
  
  void display() {
    fill(255, 0, 0);
    circle(this.pos_x, this.pos_y, 50);
  }

  void move() {
    this.pos_y += this.vitesse;
  }

  void is_collide() {
    if (this.pos_y + 25 > player.pos_y && this.pos_y - 25 < player.pos_y + 50
      && this.pos_x + 25> player.pos_x && this.pos_x - 25 < player.pos_x + 50) {
        this.has_hit = true;
        player.take_damage(1);
    }
  }

}
