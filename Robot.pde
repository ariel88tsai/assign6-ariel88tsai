class Robot extends Enemy{
	// Requirement #5: Complete Dinosaur Class

	final int PLAYER_DETECT_RANGE_ROW = 2;
	final int LASER_COOLDOWN = 180;
	final int HAND_OFFSET_Y = 37;
	final int HAND_OFFSET_X_FORWARD = 64;
	final int HAND_OFFSET_X_BACKWARD = 16;
  int direction;
  int speed = 

   void display(){
    direction = (currentSpeed >0)? RIGHT : LEFT;
    pushMatrix();
    translate(x+w,y);
    if(direction == RIGHT){
      scale(1,1);
      image(dinosaur,-w,0,w,h);
    }else{
      scale(-1,1);
      image(dinosaur,0,0,w,h);
    }
    popMatrix();
  }
  
  void update(){
    direction = (currentSpeed >0)? RIGHT : LEFT;
    
    x += currentSpeed;
    
    if(x > width-w || x < 0){
      currentSpeed*=-1;
    }
    
    if(player.y == y){
      if(currentSpeed == 1f && player.x > x){
      currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
      }else if(currentSpeed == -1f && player.x < x){
        currentSpeed *= TRIGGERED_SPEED_MULTIPLIER;
      }
    }else{
      currentSpeed = (currentSpeed > 0)? 1f:-1f; }
    
  }
  
  Robbot(float x, float y){
    super(x, y);
  }
	// HINT: Player Detection in update()
	/*

	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )

	boolean checkY = player is less than (or equal to) 2 rows higher or lower than me

	if(checkX AND checkY){
		Is laser's cooldown ready?
			True  > Fire laser from my hand!
			False > Don't do anything
	}else{
		Keep moving!
	}

	*/
}
