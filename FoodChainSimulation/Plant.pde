class Plant {
  
  PVector position;
  float radius;
  PImage plantImg;
  Life life;
  
  Plant() {
    position = new PVector(random(20, width-20),random(20, height-20));
    radius = 25;
    plantImg = loadImage("Plant.png");
    
    life = new Life(5);
  }
  
  void plant() {
    image(plantImg, position.x, position.y, radius, radius);
    
  }
  
  void hunger() {
    life.reduceHealth(1);
  }
  
} //<>//
 
