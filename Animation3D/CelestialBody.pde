class CelestialBody {
  float radius;
  float angle;
  color hexColor;
  PShape pShape;
  PImage pImage;
  CelestialBody[] celestialBodies;
  
  PVector v1;
  PVector v2;
  PVector p;
  
  CelestialBody(float angle, int[] coords, color hexColor, PShape pShape, CelestialBody[] celestialBodies) {
     this.angle = angle;
     this.hexColor = hexColor;
     this.pShape = pShape;
     this.celestialBodies = celestialBodies;
     
     v1 = new PVector(coords[0], coords[1], coords[2]);
     v2 = new PVector(1, 0, 1);
     p = v1.cross(v2);
  }
  
  CelestialBody(float angle, int[] coords, PShape pShape, CelestialBody[] celestialBodies) {
     this.angle = angle;
     this.pShape = pShape;
     this.celestialBodies = celestialBodies;
     
     v1 = new PVector(coords[0], coords[1], coords[2]);
     v2 = new PVector(1, 0, 1);
     p = v1.cross(v2);
  }
  
  void display() {
    pushMatrix();
    
    if (pShape != null) {

    }
    
    if (pImage != null) {

    }
    
    if (pShape == null && pImage == null) {
      
    }
    
    if (celestialBodies != null) {
      displayCelestialBodies();
    }
    
    shape(pShape);
    rotate(angle, p.x, p.y, p.z);
    translate(v1.x, v1.y, v1.z);
  
    popMatrix();
  }
  
  float getAngle() {
    return angle;
  }
  
  color getColor() {
    return hexColor;
  }
  
  CelestialBody[] getCelestialBodies() {
    return celestialBodies; 
  }
  
  PVector getV1() {
    return v1;
  }
  
  PVector getV2() {
    return v2;
  }
  
  PVector getP() {
    return p;
  }

  private void displayCelestialBodies() {
    for(CelestialBody celestialBody : celestialBodies) {
      pushMatrix();
      celestialBody.display();
      popMatrix();
    }
  }
}
