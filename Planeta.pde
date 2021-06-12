class Planeta {
  PShape planet;
  Planeta(PImage textura){    
    noFill();
    noStroke();
    planet = createShape(SPHERE,300);
    planet.setTexture(textura);
  }
  void show(){
    shape(planet);
  }
}
