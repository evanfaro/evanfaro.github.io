int cols, rows;
int scl = 50;
int w = 1200;
int h = 1600;

float flying = 0;

float[][] terrain;

void setup() {
  
  size(1600,1600, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
  
}

public void draw()  {
  flying -= .1;
    float yoff = flying;
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      terrain [x][y] = map(noise(xoff,yoff), 0, 1 , -100, 100);
      
      xoff += .20;
    }
    yoff += .2;
  }

  background(0);
  //stroke(24,55,174);
  
  
  translate(width/2, height/2+50);
  rotateX(sin(PI/3));
 rotateY(.001/* * mouseX-150*/);
  frameRate(20);
  
     if (key == '.' && scl < 250) {
       
          scl = scl+2;
    
    
    }else {
      
    scl = scl;
    }
    if (key == ',' && scl > 0) {
       
          scl = scl-1;
    
    
    }else {
    scl = scl;
   
    }
    
  
  translate(-w/2, -h/2);
  
   for (int y = 0; y < rows-1; y++) {
       beginShape(TRIANGLE_STRIP);
  for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
        ///---
float maprange = map((terrain [x][y]),-100,100,0,255);
float depthR = 0 /*maprange*/;
float depthG = 0 /*maprange*/;
float depthB = maprange;
    
stroke(depthR,depthG,depthB);
fill  (depthR,depthG,depthB);
  ///---
    /* //---
float randR = random(0,255);
float randG = random(0,255);
float randB = random(0,255);
    
stroke(randR,randG,randB);
fill(randR, randG, randB);
     //--- */
     
      if (mousePressed) {
        translate(mouseX*.001,mouseY*.001); 
     // rotateZ(mouseX*.001);
    }
     
    } 
    endShape();
   
  
    
    
   
   }
  
}
