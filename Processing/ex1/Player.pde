class Player {
  int pos_x = 220 ;
  int pos_y = 650;
  int vie = 5;
  
  void move(){
     if (move_left && this.pos_x>0) {
    this.pos_x -= vitesse_perso;
    }
    if (move_right && this.pos_x<width-50) {
    this.pos_x += vitesse_perso;
    } 
        if (move_up && this.pos_y<height+50) {
    this.pos_y -= vitesse_perso;
    } 
        if (move_down && this.pos_y<height-50) {
    this.pos_y += vitesse_perso;
    } 
  }
  
  void display(){
    fill(0,250,0);
    square(this.pos_x,this.pos_y,50);
  }
  
  void take_damage(int dmg){
    this.vie -= dmg ;
  }
}
