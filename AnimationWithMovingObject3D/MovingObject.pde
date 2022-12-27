class MovingObject {
  int[] coords;
  int sphereRadius;
  
  MovingObject(int[] coords) {
    this.coords = coords;
    sphereRadius = 20;
  }
  
  void display() {
    pushMatrix();
    
    translate(coords[0], coords[1], coords[2]);
    fill(255, 255, 255);
    sphere(sphereRadius * 2);
    fill(155, 255, 0);
    box(55, 55, 55);
    
    popMatrix();
  }
  
  void avoidCollisionWithSphere(CelestialBody celestialBody, int celestialBodyRadius) {
    PVector celestialBodyPVector = celestialBody.getV1();
   
      
  }
  
  int[] getCoords() {
    return coords;
  }
  
  void keyPressed() {
    if (key == 'A' || key == 'a') {
      coords[0] -= 10; //x
    } 
    else if (key == 'D' || key == 'd') {
      coords[0] += 10; //x
    } 
    else if (key == 'Q' || key == 'q') {
      coords[1] -= 10; //y
    } 
    else if (key == 'E' || key == 'e') {
      coords[1] += 10; //y
    }
    else if (key == 'W' || key == 'w') {
      coords[2] -= 10; //z
    }
    else if (key == 'S' || key == 's') {
      coords[2] += 10; //z
    }
  }
  
  void keyReleased() {
    if (key == 'A' || key == 'a') {
      coords[0] = 0;
    } 
    else if (key == 'D' || key == 'd') {
      coords[0] = 0; //x
    } 
    else if (key == 'Q' || key == 'q') {
      coords[1] = 0; //y
    } 
    else if (key == 'E' || key == 'e') {
      coords[1] = 0; //y
    }
    else if (key == 'W' || key == 'w') {
      coords[2] = 0; //z
    }
    else if (key == 'S' || key == 's') {
      coords[2] = 0; //z
    }
  }
}
