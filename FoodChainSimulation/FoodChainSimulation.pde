PImage backgroundImg;
Plant plant;
Deer deer;
Lion lion;
ArrayList<Plant> plants = new ArrayList<Plant>();
ArrayList<Deer> deers = new ArrayList<Deer>();
ArrayList<Lion> lions = new ArrayList<Lion>();


void setup() {
  size(500, 450);
  textSize(12);
  fill(#C10000);

  backgroundImg = loadImage("Background.png");
}

void draw() {
  image(backgroundImg, 0, 0);
  plant = new Plant();
  deer = new Deer();
  lion = new Lion();

  // display text on top left of canvas
  text("Plant : "+plants.size(), 0, 10);
  text("Deer : "+deers.size(), 0, 20);
  text("Lion : "+lions.size(), 0, 30);
  
  displayPlant();
  displayDeer();
  displayLion();
}

void displayPlant() {
  // add new object plant to arraylist plants.
  if (frameCount % 15 == 0) {
    plants.add(plant);
  }

  // display plant on canvas
  for (Plant p : plants) {
    p.plant();
  }

  // reduces life/health over time.
  if (frameCount % 60 == 0) {
    for (Plant p : plants) {
      p.hunger();
    }
  }

  // iterate arraylist and removes all plants with zero life/health
  for (int i =0; i<plants.size(); i++) {
    if (plants.get(i).life.health <= 0) {
      plants.remove(plants.get(i));
    }
  }
}

void displayDeer() {
  if (frameCount % 40 == 0) {
    deers.add(deer);
  }
  
  // display deer on canvas
  for (Deer d : deers) {
    d.deer();
  }
  
  // reduces life/health over time.
  if (frameCount % 60 == 0) {
    for (Deer d : deers) {
      d.hunger();
    }
  }
  
   // iterate arraylist and removes all deer with zero life/health
  for (int i =0; i<deers.size(); i++) {
    Deer d = deers.get(i);
    if (d.life.health <= 0) {
      deers.remove(d);
    }
  }
  
  for (int i =0; i<deers.size(); i++) {
    Deer d = deers.get(i);
    for(int j=0; j<plants.size(); j++) {
      Plant p = plants.get(j);
      // if plant and deer collide the plant disappears and deer health increase by 1
      if (dist(d.position.x,d.position.y,
             p.position.x,p.position.y) < p.radius) {
         p.life.health = 0;
         d.eat(1);
      }
    }
  }
}

void displayLion() {
  if (frameCount % 100 == 0) {
    lions.add(lion);
  }
  
  // display lion on canvas
  for (Lion l : lions) {
    l.lion();
  }  
  
  // reduces life/health over time.
  if (frameCount % 60 == 0) {
    for (Lion l : lions) {
      l.hunger();
    }
  }
  
  // iterate arraylist and removes all deer with zero life/health
  for (int i =0; i<lions.size(); i++) {
    Lion l = lions.get(i);
    if (l.life.health <= 0) {
      lions.remove(l);
    }
  }
  
  for (int i =0; i<lions.size(); i++) {
    Lion l = lions.get(i);
    for(int j=0; j<deers.size(); j++) {
      Deer d = deers.get(j);
      // if lion and deer collide the deer disappears and lion health increase by 1
      if (dist(l.position.x,l.position.y,
             d.position.x,d.position.y) < d.radius) {
         d.life.health = 0;
         l.eat(1);
      }
    }
  }
}
