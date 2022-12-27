class MovingObject {
  int[] coords;
  color hexColor;
  PShape pShape;
  PImage pImage;
  
  MovingObject(int[] coords, color hexColor, PShape pShape) {
    this.coords = coords;
    this.hexColor = hexColor;
    this.pShape = pShape;
  }
  
  MovingObject(int[] coords, PImage pImage, PShape pShape) {
     this.coords = coords;
     this.pImage = pImage;
     this.pShape = pShape;
  }
  
  void display() {
    pushMatrix();
    
    if (pImage != null) {
      pShape.setTexture(pImage);
    }
    else {
      pShape.setFill(hexColor); 
    }
    
    translate(coords[0], coords[1], coords[2]);
    shape(pShape);
  
    popMatrix();
  }
  
  int[] getCoords() {
    return coords;
  }
  
  void keyPressed() {
    if (key == 'A' || key == 'a') {
      coords[0] -= 100; //x
    } 
    else if (key == 'D' || key == 'd') {
      coords[0] += 100; //x
    } 
    else if (key == 'W' || key == 'w') {
      coords[1] -= 100; //y
    } 
    else if (key == 'S' || key == 's') {
      coords[1] += 100; //y
    }
    else if (key == 'Q' || key == 'q') {
      coords[2] -= 100; //z
    }
    else if (key == 'E' || key == 'e') {
      coords[2] += 100; //z
    }
  }
  
  void keyReleased() {
    if (key == 'A' || key == 'a') {
      coords[0] = 0;
    } 
    else if (key == 'D' || key == 'd') {
      coords[0] = 0; //x
    } 
    else if (key == 'W' || key == 'w') {
      coords[1] = 0; //y
    } 
    else if (key == 'S' || key == 's') {
      coords[1] = 0; //y
    }
    else if (key == 'Q' || key == 'q') {
      coords[2] = 0; //z
    }
    else if (key == 'E' || key == 'e') {
      coords[2] ; //z
    }
  }
}
