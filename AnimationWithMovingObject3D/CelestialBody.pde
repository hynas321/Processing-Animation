class CelestialBody {
  float angle;
  color hexColor;
  PShape pShape;
  PImage pImage;
  LightEnum lightType;
  CelestialBody[] celestialBodies;
  
  PVector v1;
  PVector v2;
  PVector p;
  
  CelestialBody(float angle, int[] coords, color hexColor, PShape pShape, LightEnum lightType, CelestialBody[] celestialBodies) {
     this.angle = angle;
     this.hexColor = hexColor;
     this.pShape = pShape;
     this.lightType = lightType;
     this.celestialBodies = celestialBodies;
     
     v1 = new PVector(coords[0], coords[1], coords[2]);
     v2 = new PVector(1, 0, 1);
     p = v1.cross(v2);
  }
  
  CelestialBody(float angle, int[] coords, PImage pImage, PShape pShape, LightEnum lightType, CelestialBody[] celestialBodies) {
     this.angle = angle;
     this.pImage = pImage;
     this.pShape = pShape;
     this.lightType = lightType;
     this.celestialBodies = celestialBodies;
     
     v1 = new PVector(coords[0], coords[1], coords[2]);
     v2 = new PVector(1, 0, 1);
     p = v1.cross(v2);
  }
  
  void display() {
    pushMatrix();
    
    if (pImage != null) {
      pShape.setTexture(pImage);
    }
    else {
      pShape.setFill(hexColor); 
    }
    
    rotate(angle, p.x, p.y, p.z);
    translate(v1.x, v1.y, v1.z);
    shape(pShape);
    
    switch (lightType) {
      case POINT:
        pointLight(255, 255, 255, v1.x, v1.y, v1.z);
        break;
      case DIRECTIONAL:
        directionalLight(255, 255, 255, v1.x, v1.y, v1.z);
        break;
      case SPOT:
        spotLight(0, 255, 0, v1.x, v1.y, v1.z, 100, 100, 100, PI/2, 100);
        break;
      case NONE:
        break;
    }
    
    
    if (celestialBodies != null) {
      displayCelestialBodies();
    }
  
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
