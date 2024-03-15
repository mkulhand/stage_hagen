class Player {
  int pos_x = 200 ;
  int pos_y = 600;
  int vie = 10;
  int size = 60;
  int size_heart = 50;
  
  void move(){
     if (move_left && this.pos_x>0) {
    this.pos_x -= vitesse_perso;
    }
    if (move_right && this.pos_x<width-60) {
    this.pos_x += vitesse_perso;
    } 
        if (move_up && this.pos_y<height+50) {
    this.pos_y -= vitesse_perso;
    } 
        if (move_down && this.pos_y<height-60) {
    this.pos_y += vitesse_perso;
        }
  }
  
  void display(){
    ship.resize(this.size,0);
    image(ship,this.pos_x,this.pos_y);
    heart_1.resize(this.size_heart,0);
    heart_2.resize(this.size_heart,0);
  }
  
  void take_damage(int dmg){
    if(this.vie - dmg <= 10){
    this.vie -= dmg ;
    }  
  }
}
