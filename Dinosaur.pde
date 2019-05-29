class Dinosaur extends Enemy {
	// Requirement #4: Complete Dinosaur Class

	final float TRIGGERED_SPEED_MULTIPLIER = 5;
  float currentSpeed = 1f;
  int direction;
  
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

  
	// HINT: Player Detection in update()
	/*
	
	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
	}
	*/
    Dinosaur(float x, float y){
    super(x, y);
  }
}
