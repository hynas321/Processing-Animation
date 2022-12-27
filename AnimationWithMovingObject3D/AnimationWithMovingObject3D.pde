import peasy.*;

PeasyCam cam;

PShape starShape;

PShape moon1p2Shape;
PShape moon2p3Shape;
PShape moon3p3Shape;
PShape moon4p4Shape;
PShape moon5p4Shape;
PShape moon6p4Shape;
PShape moon7p4Shape;

PShape planet1Shape;
PShape planet2Shape;
PShape planet3Shape;
PShape planet4Shape;
PImage planet4Image;

float theta;

MovingObject movingObject;
int[] movingObjectCoords;
PShape movingObjectShape;

int cameraDistance;
float[] cameraPosition;

void setup() {
  size(1080, 720, P3D);
  noStroke();

  cam = new PeasyCam(this, 5000);
 
  theta = 0;
  
  starShape = createShape(SPHERE, 200);
  
  moon1p2Shape = createShape(SPHERE, 20);
  moon2p3Shape = createShape(SPHERE, 21);
  moon3p3Shape = createShape(SPHERE, 22);
  moon4p4Shape = createShape(SPHERE, 23);
  moon5p4Shape = createShape(SPHERE, 24);
  moon6p4Shape = createShape(SPHERE, 25);
  moon7p4Shape = createShape(SPHERE, 26);

  planet1Shape = loadShape("Flashlight.obj");
  planet2Shape = createShape(SPHERE, 150);
  planet3Shape = createShape(BOX, 250);
  planet4Shape = createShape(SPHERE, 200);
  planet4Image = loadImage("planet.jpg");
  
  planet1Shape.scale(100);
  
  movingObjectShape = createShape(SPHERE, 10);
  movingObjectCoords = new int[] { 150, 150, 150 };
  movingObject = new MovingObject(movingObjectCoords, #FFFFFF, movingObjectShape);
  
  cameraPosition = new float[] {movingObjectCoords[0], movingObjectCoords[1], movingObjectCoords[2]};
  cameraDistance = 100;
}

void draw() {
  background(0);
  //lights();
  camera(movingObject.getCoords()[0], movingObject.getCoords()[1], movingObject.getCoords()[2] + cameraDistance, movingObject.getCoords()[0], movingObject.getCoords()[1], movingObject.getCoords()[2], 0, 1, 0);
  
  CelestialBody star = new CelestialBody(0, new int[] { 0, 0, 0 }, #FF0000, starShape, LightEnum.POINT, null);
  
  CelestialBody moon1p2 = new CelestialBody(theta * 3.25, new int[] { 150, 150, 150 }, #E5CCFF, moon1p2Shape, LightEnum.NONE, null);
  CelestialBody moon2p3 = new CelestialBody(theta * 5.5, new int[] { 150, 150, 150 }, #00EFFF, moon2p3Shape, LightEnum.NONE, null);
  CelestialBody moon3p3 = new CelestialBody(theta * 3.5, new int[] { 150, 150, 150 }, #D5FF00, moon3p3Shape, LightEnum.NONE, null);
  CelestialBody moon4p4 = new CelestialBody(-theta * 5.75, new int[] { 200, 200, 200 }, #FFFFFF, moon4p4Shape, LightEnum.NONE, null);
  CelestialBody moon5p4 = new CelestialBody(-theta * 4.75, new int[] { 200, 200, 200 }, #60FF80, moon5p4Shape, LightEnum.NONE, null);
  CelestialBody moon6p4 = new CelestialBody(-theta * 3.75, new int[] { 200, 200, 200 }, #A08060, moon6p4Shape, LightEnum.NONE, null);
  CelestialBody moon7p4 = new CelestialBody(-theta * 2.75, new int[] { 200, 200, 200 }, #FFD0A0, moon7p4Shape, LightEnum.NONE, null);
  
  CelestialBody[] moons2 = new CelestialBody[] { moon1p2 };
  CelestialBody[] moons3 = new CelestialBody[] { moon2p3, moon3p3 };
  CelestialBody[] moons4 = new CelestialBody[] { moon4p4, moon5p4, moon6p4, moon7p4 };
  
  CelestialBody planet1 = new CelestialBody(theta * 1/2, new int[] { 600, 600, 600 }, #FFFFFF, planet1Shape, LightEnum.DIRECTIONAL, null);
  CelestialBody planet2 = new CelestialBody(theta * 3/8, new int[] { 900, 900, 900 }, #FFE020, planet2Shape, LightEnum.NONE, moons2);
  CelestialBody planet3 = new CelestialBody(theta * 1/3, new int[] { 1200, 1200, 1200 }, #00C000, planet3Shape, LightEnum.NONE, moons3);
  CelestialBody planet4 = new CelestialBody(theta * 1/4, new int[] { 1500, 1500, 1500 }, planet4Image, planet4Shape, LightEnum.NONE, moons4);
  
  star.display();
  planet1.display();
  planet2.display();
  planet3.display();
  planet4.display();
  movingObject.display();

  theta += 0.01;
}

void keyPressed() {
  movingObject.keyPressed();
}

void mouseWheel(MouseEvent event) {
  cameraDistance += event.getCount() * 10;
}

void mouseMoved(MouseEvent event) {
  float angle = atan2(mouseY - height / 2, mouseX - width / 2);
  cameraPosition[0] = sin(angle) * cameraDistance;
  cameraPosition[1] = cos(angle) * cameraDistance;
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    cameraPosition[2] -= (pmouseY - mouseY) * 0.1;
  }
}
