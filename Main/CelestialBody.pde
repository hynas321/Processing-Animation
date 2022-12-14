class CelestialBody {
  float distance;
  float diameter;
  float angle;
  int[] rgb;
  CelestialBody[] celestialBodies;
  
  CelestialBody(float distance, float diameter, float angle, int[] rgb, CelestialBody[] celestialBodies) {
     this.distance = distance;
     this.diameter = diameter;
     this.angle = angle;
     this.rgb = rgb;
     this.celestialBodies = celestialBodies;
  }
  
  float getDistance() {
      return distance;
  }
  
  float getDiameter() {
    return diameter; 
  }
  
  float getAngle() {
    return angle;
  }
  
  int[] getRgb() {
    return rgb;
  }
  
  CelestialBody[] getCelestialBodies() {
    return celestialBodies; 
  }
  
  void display() {
    pushMatrix();

    rotate(angle);
    translate(distance, 0);
    fill(rgb[0], rgb[1], rgb[2]);
    ellipse(0, 0, diameter, diameter);
    
    if (celestialBodies != null) {
      displayCelestialBodies();
    }
  
    popMatrix();
  }

  private void displayCelestialBodies() {
    for(CelestialBody celestialBody : celestialBodies) {
      pushMatrix();
    
      rotate(celestialBody.getAngle());
      translate(celestialBody.getDistance(), 0);
      fill(celestialBody.rgb[0], celestialBody.rgb[1], celestialBody.rgb[2]);
      ellipse(0, 0, celestialBody.getDiameter(), celestialBody.getDiameter());
    
      popMatrix();
    }
  }
}
