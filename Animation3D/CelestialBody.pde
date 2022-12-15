class CelestialBody {
  float radius;
  float angle;
  color hexColor;
  CelestialBody[] celestialBodies;
  
  PVector v1;
  PVector v2;
  PVector p;
  
  CelestialBody(float radius, float angle, color hexColor, int[] coords, CelestialBody[] celestialBodies) {
     this.radius = radius;
     this.angle = angle;
     this.hexColor = hexColor;
     this.celestialBodies = celestialBodies;
     
     v1 = new PVector(coords[0], coords[1], coords[2]);
     v2 = new PVector(1, 0, 1);
     p = v1.cross(v2);
  }
  
  void display() {
    pushMatrix();
  
    fill(hexColor);
    rotate(angle, p.x, p.y, p.z);
    translate(v1.x, v1.y, v1.z);
    sphere(radius);
    
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
    
      PVector celestialV1 = celestialBody.getV1();
      PVector celestialP = celestialBody.getP();
      
      fill(celestialBody.getColor());
      rotate(celestialBody.getAngle(), celestialP.x, celestialP.y, celestialP.z);
      translate(celestialV1.x, celestialV1.y, celestialV1.z);
      sphere(celestialBody.radius);
    
      popMatrix();
    }
  }
}
