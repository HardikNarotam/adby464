class Lion {
  
  PVector position;
  PVector vPosition;
  float radius;
  PImage lionImg;
  Life life;
  
  Lion() {
    position = new PVector(random(20, width-20), random(20, height-20));
    radius = 25;
    lionImg = loadImage("Lion.png");
    vPosition= new PVector(random(-5, 0), random(0, 5));
    
     life = new Life(7);
  }
  
  void lion() { 
    position.x+=vPosition.x;
    position.y+=vPosition.y;

    image(lionImg, position.x, position.y, radius, radius);

    if (position.x <= 0 || position.x >=480) {
      vPosition.x = -vPosition.x;
    } else if (position.y <= 0 || position.y >=430) {
      vPosition.y = -vPosition.y;
    }
  }

  void eat(int food) {
    life.addHealth(food);
    radius+=1;
  }

  void hunger() {
    life.reduceHealth(1);
    radius-=1;
  }
  
  
}
