import peasy.*;

float theta;
PeasyCam cam;

void setup() {
  size(1080, 720, P3D);
  theta = 0;
  cam = new PeasyCam(this, 1000);
}

void draw() {
  background(0);
  lights();
  noStroke();

  //Star
  fill(255, 0, 0);
  translate(0, 0);
  sphere(40);
  //

  //Planet 1 - 0 moons
  int[] planet1Coords = { 100, 100, 100 };
  
  CelestialBody planet1 = new CelestialBody(10, theta * 6, #FE7F00, planet1Coords, null);
  
  planet1.display();
  //
  
  //Planet 2 - 1 moon
  int[] planet2Coords = { 200, 200, 200 }; 
  int[] moon1p2Coords = { 60, 60, 60 };
  
  CelestialBody moon1p2 = new CelestialBody(8, theta * 3.25, #E5CCFF, moon1p2Coords, null);
  CelestialBody[] moons2 = { moon1p2 };
  CelestialBody planet2 = new CelestialBody(20, theta * 4, #FFE020, planet2Coords, moons2);
  
  planet2.display();
  //
  
  
  //Planet 3 - 2 moons
  int[] planet3Coords = { 300, 300, 300 };
  int[] moon2p3Coords = { 60, 60, 60 };
  int[] moon3p3Coords = { 60, 60, 60 };
  
  CelestialBody moon2p3 = new CelestialBody(6.5, theta * 5.5, #00EFFF, moon2p3Coords, null);
  CelestialBody moon3p3 = new CelestialBody(8.5, theta * 3.5, #D5FF00, moon3p3Coords, null);
  CelestialBody[] moons3 = { moon2p3, moon3p3 };
  CelestialBody planet3 = new CelestialBody(30, theta, #00C000, planet3Coords, moons3);
  
  planet3.display();
  //
  
  //Planet 4 - 4 moons
  int[] planet4Coords = { 400, 400, 400 };
  int[] moon4p4Coords = { 60, 60, 60 };
  int[] moon5p4Coords = { 60, 60, 60 };
  int[] moon6p4Coords = { 60, 60, 60 };
  int[] moon7p4Coords = { 60, 60, 60 };
  
  CelestialBody moon4p4 = new CelestialBody(5, -theta * 5.75, #FFFFFF, moon4p4Coords, null);
  CelestialBody moon5p4 = new CelestialBody(7, -theta * 4.75, #60FF80, moon5p4Coords, null);
  CelestialBody moon6p4 = new CelestialBody(9, -theta * 3.75, #A08060, moon6p4Coords, null);
  CelestialBody moon7p4 = new CelestialBody(11, -theta * 2.75, #FFD0A0, moon7p4Coords, null);
  CelestialBody[] moons4 = { moon4p4, moon5p4, moon6p4, moon7p4 };
  CelestialBody planet4 = new CelestialBody(40, theta * 1/4, #006FFF, planet4Coords, moons4);
  
  planet4.display();
  //
  
  theta += 0.01;
}
