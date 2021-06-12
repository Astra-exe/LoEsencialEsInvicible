PImage []texture = new PImage[3];
PShape []elemento = new PShape[3];
PShape []carryStar = new PShape[3];
float ystar=7;
PImage rosa;
PShape principito, corona, oro;

Planeta planet;

float mover=0, inicio=-450, inicio2=450, xmov=-450, xmov2=450;
float x = 0,y = -190, gravity = 0.002, yspeed;

int indexPlanet = 0;


Estrella []estrella = new Estrella[200];
//Setup
void setup(){
  
  size(900,700,P3D);
  rosa = loadImage("./resources/Principito RGB-03.png");
  texture[0] = loadImage("./resources/3DModels/Arena.jpg");
  texture[1] = loadImage("./resources/3DModels/texturaOro.jpeg");
  texture[2] = loadImage("./resources/3DModels/numeros.png");
  
  frameRate(60);
  
  principito = loadShape("./resources/3DModels/Modelo_principito/Principito_Modelo.obj");
  corona = loadShape("./resources/3DModels/Corona.obj");
  oro = loadShape("./resources/3DModels/Lingote.obj");
  elemento[0] = loadShape("./resources/3DModels/Baobabs.obj");
  elemento[1] = loadShape("./resources/3DModels/Trono.obj");
  elemento[2] = loadShape("./resources/3DModels/Escritorio.obj");
  
  for(int i = 0; i < carryStar.length; i+=1)
    carryStar[i] = loadShape("./resources/3DModels/Estrella_dorada.obj");
  
  for(int i = 0; i < estrella.length; i+=1)
    estrella[i] = new Estrella();

}


//Draw
void draw(){
   background(#001432);
   lights();
   
   translate(width/2,height/2,0);
   
   
   float y1 = -175 + sin (inicio) * 100;
   float y2 = -175 + sin (inicio2) * 100;
   
   
   
   if(indexPlanet < 3){
     for(int i = 0; i < estrella.length; i+=1){
         estrella[i].move();
         estrella[i].show();
          
       }
     fill(255,255,255);
     pushMatrix();
      translate(width*0.8, height*0.5);
      rotate(frameCount / -100.0);
      
    popMatrix();
     
     pushMatrix();
       translate(mover,height/2+150,0);
       if (frameCount > 150)//300
       {
         yspeed += gravity;
         mover -= 1;
       }
       if (mover == -850)
       {
         indexPlanet += 1;
         mover *= -1;
         yspeed *= -1;
         xmov =-450;
         xmov2 =450;
         
       }
       if (mover == 1)
       {
         frameCount = 0;
         mover -= 1;
         yspeed = 0;
       }
       
       rotateZ(radians(frameCount*0.5));
       
       if(indexPlanet >=0 && indexPlanet <= 2){
          elemento(elemento[indexPlanet], indexPlanet);
          planet = new Planeta(texture[indexPlanet]);
          planet.show();
       }
       
     popMatrix();
     
     y+=yspeed;
     ystar+=yspeed;
     
     pushMatrix();
       rotateZ(radians(180));
       rotateY(radians(-90));
       scale(1);
       shape(principito,x,y);
     popMatrix();
     if(indexPlanet == 0)
       image(rosa,-mover+70,y+320,100,100);

     else if(indexPlanet == 1){
       pushMatrix();
       translate(mover+80,50,0);
       rotateZ(radians(180));
       rotateY(radians(frameCount));
       scale(50);
       shape(corona,0,0);
       popMatrix();
   }  
   
     else if(indexPlanet == 2){
       pushMatrix();
       translate(mover+80,50,0);
       rotateZ(radians(180));
       rotateY(radians(frameCount));
       scale(50);
       shape(oro,0,0);
       popMatrix();
     }
     
    strokeWeight(1);
    stroke(random(175,255),random(175,255),random(175,255));
    star(xmov,y1,10,30,5);
    star(xmov2,y2,10,30,5);
    star(-mover-80,y1+80,10,30,5);
    star(mover+80,y2+80,10,30,5);
    inicio = inicio + 0.05;
    inicio2 = inicio2 - 0.05;
    xmov +=1;
    xmov2 -=1;
    
    //Estrellas cargadoras
     pushMatrix();
       rotateZ(radians(180));
       //rotateY(radians(0));
       scale(20);
       for(int i = 0; i < carryStar.length; i+=1){
       pushMatrix();
         translate(3*i,2,0);
         stroke(255);
         strokeWeight(0.05);
         line(-3.5,3.5+(ystar*0.06),-(i*3),ystar*0.03); 
         shape(carryStar[i],0,ystar*0.06);
       popMatrix(); 
        }
    popMatrix();
   }
}

void elemento(PShape elemento, int indexPlanet){
    
    if (indexPlanet==0)
    {
      pushMatrix();
        translate(0,300,120);
        rotateZ(45);
        scale(30);
        shape(elemento,0,0);
      popMatrix();
    }
    
    else if (indexPlanet==1)
    {
      pushMatrix();
        translate(-200,-270,50);
        rotateZ(radians(180));
        rotateY(radians(30));
        scale(40);
        shape(elemento,0,0);
      popMatrix();
    }
    
    else if (indexPlanet==2)
    {
      pushMatrix();
        translate(100,-320,300);
        rotateZ(180);
        rotateY(radians(105));       
        rotateX(radians(45));
        scale(50);
        shape(elemento,0,0);
      popMatrix();
    }
      
    
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
