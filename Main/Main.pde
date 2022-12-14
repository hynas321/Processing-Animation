float theta;
PImage backgroundImage;

void setup() {
  size(1080, 720);
  theta = 0;
  backgroundImage = loadImage("background.jpg");
}

void draw() {
  background(0);
  image(backgroundImage, 0, 0);
  noStroke();

  //Star
  translate(width/2, height/2);
  fill(255, 0, 0);
  ellipse(0, 0, 70, 70);

  //Planet 1 - 0 moons
  int[] planet1Rgb = { 254, 127, 0 };
  CelestialBody planet1 = new CelestialBody(50, 10, theta * 6, planet1Rgb, null);
  planet1.display();


  //Planet 2 - 1 moon
  int[] moon1p2Rgb = { 229, 204, 255 };
  CelestialBody moon1p2 = new CelestialBody(28.5, 8, theta * 3.25, moon1p2Rgb, null);
  
  int[] planet2Rgb = { 255, 224, 32 };
  CelestialBody[] moons2 = { moon1p2 };
  CelestialBody planet2 = new CelestialBody(100, 20, theta * 4, planet2Rgb, moons2);
  
  planet2.display();
  //
  
  
  //Planet 3 - 2 moons
  int[] moon2p3Rgb = { 0, 239, 255 };
  CelestialBody moon2p3 = new CelestialBody(35.5, 6.5, theta * 5.5, moon2p3Rgb, null);
  
  int[] moon3p3Rgb = { 213, 255, 0 };
  CelestialBody moon3p3 = new CelestialBody(45.4, 8.5, theta * 3.5, moon3p3Rgb, null);
  
  int[] planet3Rgb = { 0, 192, 0 };
  CelestialBody[] moons3 = { moon2p3, moon3p3 };
  CelestialBody planet3 = new CelestialBody(200, 30, theta, planet3Rgb, moons3);
  
  planet3.display();
  //
  
  //Planet 4 - 4 moons
  int[] moon4p4Rgb = { 255, 255, 255 };
  CelestialBody moon4p4 = new CelestialBody(25, 5, -theta * 5.75, moon4p4Rgb, null);
  
  int[] moon5p4Rgb = { 96, 255, 128 };
  CelestialBody moon5p4 = new CelestialBody(35, 7, -theta * 4.75, moon5p4Rgb, null);
  
  int[] moon6p4Rgb = { 160, 128, 96 };
  CelestialBody moon6p4 = new CelestialBody(45, 9, -theta * 3.75, moon6p4Rgb, null);
  
  int[] moon7p4Rgb = { 255, 208, 160 };
  CelestialBody moon7p4 = new CelestialBody(55, 11, -theta * 2.75, moon7p4Rgb, null);
  
  int[] planet4Rgb = { 0, 111, 255 };
  CelestialBody[] moons4 = { moon4p4, moon5p4, moon6p4, moon7p4 };
  CelestialBody planet4 = new CelestialBody(300, 40, theta * 1/4, planet4Rgb, moons4);
  
  planet4.display();
  //

  theta += 0.01;
}
