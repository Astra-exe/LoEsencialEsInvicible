class Estrella{
  PVector point = new PVector();
  Estrella(){
    point.x = random(-width, width);
    point.y = random(-height,height);
  }
  void move(){
    PVector T = new PVector(1,0,0);
    point.add(T);
    if(point.x  > width){
      point.x = random(-width, width);
      point.y = random(-height,height);
    }
  }
  void show(){
    noStroke();
    fill(255,255,255,90);
    circle(point.x,point.y, 5);
  }
}
