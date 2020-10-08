class Life {
  
  int health;
  
  // constructor with parameter health
  Life(int ihealth) {
    health = ihealth;
  }
  
  // return current health
  int getHealth() {
    return health;
  }
  
  // add health to health
  void addHealth(int plusHealth) {
    health = health+plusHealth;
  }
  
  // reduces health from current health
  void reduceHealth(int minusHealth) {
   health = health-minusHealth; 
  }
  
}
