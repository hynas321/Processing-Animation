import peasy.*;

PeasyCam cam;

int[] starCoords;
PShape starShape;

int[] moon1p2Coords;
int[] moon2p3Coords;
int[] moon3p3Coords;
int[] moon4p4Coords;
int[] moon5p4Coords;
int[] moon6p4Coords;
int[] moon7p4Coords;
PShape moon1p2Shape;
PShape moon2p3Shape;
PShape moon3p3Shape;
PShape moon4p4Shape;
PShape moon5p4Shape;
PShape moon6p4Shape;
PShape moon7p4Shape;

int[] planet1Coords;
int[] planet2Coords;
int[] planet3Coords;
int[] planet4Coords;
PShape planet1Shape;
PShape planet2Shape;
PShape planet3Shape;
PShape planet4Shape;
PImage planet4Image;

float theta;

void setup() {
  size(1080, 720, P3D);
  noStroke();

  cam = new PeasyCam(this, 1500);
 
  theta = 0;
  
  starShape = createShape(SPHERE, 40);
  
  moon1p2Shape = createShape(SPHERE, 8);
  moon2p3Shape = createShape(SPHERE, 6.5);
  moon3p3Shape = createShape(SPHERE, 8.5);
  moon4p4Shape = createShape(SPHERE, 5);
  moon5p4Shape = createShape(SPHERE, 7);
  moon6p4Shape = createShape(SPHERE, 9);
  moon7p4Shape = createShape(SPHERE, 11);

  planet1Shape = loadShape("Flashlight.obj");
  planet2Shape = createShape(SPHERE, 20);
  planet3Shape = createShape(BOX, 30);
  planet4Shape = createShape(SPHERE, 40);
  planet4Image = loadImage("planet.jpg");
}

void draw() {
  background(0);
  lights();

  CelestialBody star = new CelestialBody(0, new int[] { 0, 0, 0 }, #FF0000, starShape, null);
  
  CelestialBody moon1p2 = new CelestialBody(theta * 3.25, new int[] { 60, 60, 60 }, #E5CCFF, moon1p2Shape, null);
  CelestialBody moon2p3 = new CelestialBody(theta * 5.5, new int[] { 60, 60, 60 }, #00EFFF, moon2p3Shape, null);
  CelestialBody moon3p3 = new CelestialBody(theta * 3.5, new int[] { 60, 60, 60 }, #D5FF00, moon3p3Shape, null);
  CelestialBody moon4p4 = new CelestialBody(-theta * 5.75, new int[] { 60, 60, 60 }, #FFFFFF, moon4p4Shape, null);
  CelestialBody moon5p4 = new CelestialBody(-theta * 4.75, new int[] { 60, 60, 60 }, #60FF80, moon5p4Shape, null);
  CelestialBody moon6p4 = new CelestialBody(-theta * 3.75, new int[] { 60, 60, 60 }, #A08060, moon6p4Shape, null);
  CelestialBody moon7p4 = new CelestialBody(-theta * 2.75, new int[] { 60, 60, 60 }, #FFD0A0, moon7p4Shape, null);
  
  CelestialBody[] moons2 = new CelestialBody[] { moon1p2 };
  CelestialBody[] moons3 = new CelestialBody[] { moon2p3, moon3p3 };
  CelestialBody[] moons4 = new CelestialBody[] { moon4p4, moon5p4, moon6p4, moon7p4 };
  
  CelestialBody planet1 = new CelestialBody(theta * 2, new int[] { 100, 100, 100 }, #FFFFFF, planet1Shape, null);
  CelestialBody planet2 = new CelestialBody(theta * 4, new int[] { 200, 200, 200 }, #FFE020, planet2Shape, moons2);
  CelestialBody planet3 = new CelestialBody(theta, new int[] { 300, 300, 300 }, #00C000, planet3Shape, moons3);
  CelestialBody planet4 = new CelestialBody(theta * 1/2, new int[] { 500, 500, 500 }, planet4Image, planet4Shape, moons4);
  
  star.display();
  planet1.display();
  planet2.display();
  planet3.display();
  planet4.display();

  theta += 0.01;
}
