class Player {
  int pose_x = 220 ;
  int pose_y = 650;
  int vie = 5;
  
  void move(){
     if (move_left && this.pose_x>0) {
    this.pose_x -= vitesse_perso;
    }
    if (move_right && this.pose_x<width-50) {
    this.pose_x += vitesse_perso;
    } 
        if (move_up && this.pose_y<height+50) {
    this.pose_y -= vitesse_perso;
    } 
        if (move_down && this.pose_y<height-50) {
    this.pose_y += vitesse_perso;
    } 
  }
  
  void display(){
    fill(0,250,0);
    square(this.pose_x,this.pose_y,50);
  }
  
  void take_damage(int dmg){
    this.vie -= dmg ;
  }
}
