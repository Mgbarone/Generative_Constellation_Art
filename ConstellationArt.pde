/*---------------------------------
 Name: Generative Constellation Art
 Date: September 2024
 Title: Interactive Pulsating Constellation and Particle System
 Description:
 This interactive generative art piece allows users to create constellations by selecting bright stars. 
 Each star pulsates and reacts to user input, and selected stars remain bright until deselected. 
 The artwork incorporates randomness in color selection, pulsation effects, and a particle system 
 that creates particle bursts at each click. Inspired by celestial movements and the stars, this artwork 
 brings an interactive visual experience.
 
 Links:
 https://github.com/Mgbarone/Generative_Constellation_Art
 -----------------------------------*/

PImage img;  // Variable for the image

ArrayList<PVector> brightStars = new ArrayList<PVector>();  // List of bright star positions (constellation)
ArrayList<PVector> stars = new ArrayList<PVector>();  // List of other star positions
ArrayList<Float> brightness = new ArrayList<Float>();  // List of brightness levels
ArrayList<Boolean> selected = new ArrayList<Boolean>();  // Tracking selected stars
ArrayList<Integer> selectedOrder = new ArrayList<Integer>();  // Tracking selection order of stars
ArrayList<PVector> eyes = new ArrayList<PVector>();  // List of eye positions for pulsating
ArrayList<Particle> particles = new ArrayList<Particle>();  // List for storing particles

// Variables for managing pulsation and flickering
ArrayList<Float> starPulse = new ArrayList<Float>();
ArrayList<Float> pulseSpeed = new ArrayList<Float>();
ArrayList<Float> brightStarPulse = new ArrayList<Float>();
ArrayList<Float> brightPulseSpeed = new ArrayList<Float>();
ArrayList<Float> eyePulse = new ArrayList<Float>();  // Pulsation for eyes
ArrayList<Float> eyePulseSpeed = new ArrayList<Float>();  // Pulsation speed for eyes
ArrayList<Integer> starColors = new ArrayList<Integer>();  // To hold random colors for regular stars

// Colors for stars and eyes (changed to match star behavior)
color particleColor1 = color(255, 255, 255);  // Pure white
color particleColor2 = color(175, 210, 227);  // Light blue
color particleColor3 = color(46, 93, 130);    // Dark blue
color particleColor4 = color(203, 235, 249);  // Light blue-green
color particleColor5 = color(48, 147, 202);   // Medium blue

// Particle class definition
class Particle {
    PVector position;  // Particle position
    PVector velocity;  // Particle velocity
    float lifespan;  // Particle lifespan
    float size;  // Particle size
    int particleColor;  // Particle color

    Particle(PVector start, int col) {
        position = start.copy();  // Copy the start position
        velocity = new PVector(random(-2, 2), random(-2, 2));  // Random initial velocity
        lifespan = random(100, 255);  // Random lifespan for different opacities
        size = random(2, 5);  // Random size for each particle
        particleColor = col;  // Particle color
    }

    void update() {
        position.add(velocity);
        lifespan -= 2;
    }

    void display() {
        noStroke();
        fill(particleColor, lifespan);  // Adjust transparency according to lifespan
        ellipse(position.x, position.y, size, size);
    }

    boolean isDead() {
        return lifespan < 0;
    }
}

void setup() {
  size(384, 768);  // Canvas size matching your image

  img = loadImage("manstar10.png");  // Load your image
  image(img, 0, 0);  // Display the image

  // Add bright star positions for the constellation
  brightStars.add(new PVector(104, 201));
  brightStars.add(new PVector(124, 190));
  brightStars.add(new PVector(153, 176));
  brightStars.add(new PVector(185, 179));
  brightStars.add(new PVector(109, 149));
  brightStars.add(new PVector(68, 159));
  brightStars.add(new PVector(59, 60));
  brightStars.add(new PVector(105, 109));
  brightStars.add(new PVector(131, 87));
  brightStars.add(new PVector(103, 37));
  brightStars.add(new PVector(214, 34));
  brightStars.add(new PVector(266, 15));
  brightStars.add(new PVector(249, 74));
  brightStars.add(new PVector(203, 116));
  brightStars.add(new PVector(242, 151));
  brightStars.add(new PVector(280, 118));
  brightStars.add(new PVector(334, 92));
  brightStars.add(new PVector(291, 161));
  brightStars.add(new PVector(244, 211));
  brightStars.add(new PVector(281, 226));
  brightStars.add(new PVector(248, 289));
  brightStars.add(new PVector(274, 315));
  brightStars.add(new PVector(310, 303));
  brightStars.add(new PVector(353, 267));
  brightStars.add(new PVector(373, 205));
  brightStars.add(new PVector(350, 267));
  brightStars.add(new PVector(308, 306));
  brightStars.add(new PVector(255, 311));
  brightStars.add(new PVector(299, 378));
  brightStars.add(new PVector(314, 400));
  brightStars.add(new PVector(359, 353));
  brightStars.add(new PVector(270, 430));
  brightStars.add(new PVector(298, 447));
  brightStars.add(new PVector(275, 478));
  brightStars.add(new PVector(330, 502));
  brightStars.add(new PVector(295, 514));
  brightStars.add(new PVector(268, 562));
  brightStars.add(new PVector(297, 619));
  brightStars.add(new PVector(358, 560));
  brightStars.add(new PVector(299, 623));
  brightStars.add(new PVector(254, 653));
  brightStars.add(new PVector(250, 694));
  brightStars.add(new PVector(250, 738));
  brightStars.add(new PVector(305, 667));
  brightStars.add(new PVector(147, 706));
  brightStars.add(new PVector(118, 697));
  brightStars.add(new PVector(97, 676));
  brightStars.add(new PVector(121, 610));
  brightStars.add(new PVector(87, 607));
  brightStars.add(new PVector(103, 571));
  brightStars.add(new PVector(103, 534));
  brightStars.add(new PVector(94, 516));
  brightStars.add(new PVector(136, 548));
  brightStars.add(new PVector(115, 495));
  brightStars.add(new PVector(137, 445));
  brightStars.add(new PVector(126, 435));
  brightStars.add(new PVector(63, 473));
  brightStars.add(new PVector(47, 452));
  brightStars.add(new PVector(29, 431));
  brightStars.add(new PVector(53, 393));
  brightStars.add(new PVector(12, 351));
  brightStars.add(new PVector(47, 337));
  brightStars.add(new PVector(27, 253));
  brightStars.add(new PVector(163, 722));
  brightStars.add(new PVector(157, 309));
  brightStars.add(new PVector(108, 311));
  brightStars.add(new PVector(125, 275));
  brightStars.add(new PVector(152, 219));
  brightStars.add(new PVector(111, 244));
  brightStars.add(new PVector(123, 725));
  brightStars.add(new PVector(118, 760));

  // Add regular star positions
  stars.add(new PVector(104, 36));
  stars.add(new PVector(108, 146));
  stars.add(new PVector(183, 178));
  stars.add(new PVector(153, 171));
  stars.add(new PVector(76, 361));
  stars.add(new PVector(64, 471));
  stars.add(new PVector(49, 452));
  stars.add(new PVector(93, 517));
  stars.add(new PVector(115, 495));
  stars.add(new PVector(102, 534));
  stars.add(new PVector(87, 607));
  stars.add(new PVector(305, 519));
  stars.add(new PVector(297, 513));
  stars.add(new PVector(313, 464));
  stars.add(new PVector(298, 446));
  stars.add(new PVector(270, 427));
  stars.add(new PVector(299, 375));
  stars.add(new PVector(228, 359));
  stars.add(new PVector(160, 367));
  stars.add(new PVector(158, 307));
  stars.add(new PVector(103, 200));
  stars.add(new PVector(108, 146));
  stars.add(new PVector(69, 159));
  stars.add(new PVector(213, 33));
  stars.add(new PVector(165, 260));
  stars.add(new PVector(204, 116));
  stars.add(new PVector(240, 152));
  stars.add(new PVector(104, 446));
  stars.add(new PVector(92, 259));
  stars.add(new PVector(80, 254));
  stars.add(new PVector(66, 234));
  stars.add(new PVector(83, 193));
  stars.add(new PVector(76, 176));
  stars.add(new PVector(38, 117));
  stars.add(new PVector(27, 139));
  stars.add(new PVector(132, 331));
  stars.add(new PVector(115, 337));
  stars.add(new PVector(64, 346));
  stars.add(new PVector(45, 337));
  stars.add(new PVector(41, 355));
  stars.add(new PVector(124, 465));
  stars.add(new PVector(106, 458));
  stars.add(new PVector(118, 433));
  stars.add(new PVector(289, 437));
  stars.add(new PVector(299, 401));
  stars.add(new PVector(304, 378));
  stars.add(new PVector(255, 306));
  stars.add(new PVector(250, 277));
  stars.add(new PVector(258, 264));
  stars.add(new PVector(262, 234));
  stars.add(new PVector(252, 216));
  stars.add(new PVector(249, 174));
  stars.add(new PVector(266, 163));
  stars.add(new PVector(281, 150));
  stars.add(new PVector(289, 155));
  stars.add(new PVector(198, 146));
  stars.add(new PVector(170, 144));
  stars.add(new PVector(172, 129));
  stars.add(new PVector(253, 49));
  stars.add(new PVector(265, 41));
  stars.add(new PVector(205, 53));
  stars.add(new PVector(44, 69));
  stars.add(new PVector(40, 91));
  stars.add(new PVector(96, 62));
  stars.add(new PVector(108, 55));
  stars.add(new PVector(122, 33));
  stars.add(new PVector(88, 217));
  stars.add(new PVector(80, 188));
  stars.add(new PVector(54, 271));
  stars.add(new PVector(120, 265));
  stars.add(new PVector(107, 248));
  stars.add(new PVector(114, 245));
  stars.add(new PVector(48, 337));
  stars.add(new PVector(54, 421));
  stars.add(new PVector(83, 396));
  stars.add(new PVector(51, 450));
  stars.add(new PVector(114, 471));
  stars.add(new PVector(134, 421));
  stars.add(new PVector(129, 405));
  stars.add(new PVector(123, 387));
  stars.add(new PVector(270, 418));
  stars.add(new PVector(247, 302));
  stars.add(new PVector(250, 284));
  stars.add(new PVector(349, 271));
  stars.add(new PVector(168, 200));
  stars.add(new PVector(169, 177));
  stars.add(new PVector(178, 161));
  stars.add(new PVector(150, 151));
  stars.add(new PVector(142, 37));
  stars.add(new PVector(109, 54));
  stars.add(new PVector(332, 217));
  stars.add(new PVector(317, 233));
  stars.add(new PVector(283, 334));
  stars.add(new PVector(283, 371));
  stars.add(new PVector(324, 427));
  stars.add(new PVector(319, 552));
  stars.add(new PVector(351, 557));
  stars.add(new PVector(107, 567));
  stars.add(new PVector(85, 545));
  stars.add(new PVector(77, 527));
  stars.add(new PVector(87, 500));
  stars.add(new PVector(17, 450));
  stars.add(new PVector(110, 440));
  stars.add(new PVector(81, 381));
  stars.add(new PVector(52, 366));
  stars.add(new PVector(56, 275));
  stars.add(new PVector(81, 148));
  stars.add(new PVector(159, 161));
  stars.add(new PVector(179, 133));
  stars.add(new PVector(179, 155));
  stars.add(new PVector(170, 176));
  stars.add(new PVector(183, 180));
  stars.add(new PVector(205, 148));
  stars.add(new PVector(236, 126));
  stars.add(new PVector(243, 114));
  stars.add(new PVector(201, 116));
  stars.add(new PVector(233, 72));
  stars.add(new PVector(242, 26));
  stars.add(new PVector(211, 32));
  stars.add(new PVector(206, 55));
  stars.add(new PVector(266, 15));
  stars.add(new PVector(334, 91));
  stars.add(new PVector(304, 97));
  stars.add(new PVector(279, 117));
  stars.add(new PVector(253, 214));
  stars.add(new PVector(257, 268));
  stars.add(new PVector(253, 285));
  stars.add(new PVector(234, 304));
  stars.add(new PVector(156, 320));
  stars.add(new PVector(267, 647));
  stars.add(new PVector(252, 688));
  stars.add(new PVector(100, 672));
  stars.add(new PVector(119, 587));
  stars.add(new PVector(123, 561));
  stars.add(new PVector(118, 448));
  stars.add(new PVector(103, 435));
  stars.add(new PVector(101, 369));
  stars.add(new PVector(103, 287));
  stars.add(new PVector(115, 219));
  stars.add(new PVector(150, 219));
  stars.add(new PVector(158, 205));
  stars.add(new PVector(132, 247));
  stars.add(new PVector(148, 293));
  stars.add(new PVector(156, 282));
  stars.add(new PVector(157, 309));
  stars.add(new PVector(136, 352));
  // (Add more regular star positions here...)

  // Add eye positions for pulsating effect
  eyes.add(new PVector(210, 215));
  eyes.add(new PVector(209, 215));
  eyes.add(new PVector(178, 211));
  eyes.add(new PVector(177, 211));

  // Initialize pulsation and speed for the eyes
  for (int i = 0; i < eyes.size(); i++) {
    eyePulse.add(random(0.0, 1.0));  // Random initial pulsation for the eyes
    eyePulseSpeed.add(random(0.03, 0.07));  // Random pulsation speed for the eyes
  }

  // Initialize pulsation, speed, and selection state for stars
  for (int i = 0; i < brightStars.size(); i++) {
    brightStarPulse.add(random(0.5, 1.0));  // Initial weaker pulsation for bright stars
    brightPulseSpeed.add(random(0.01, 0.05));  // Random pulsation speed for bright stars
    selected.add(false);  // Initially all bright stars are unselected
  }

  for (int i = 0; i < stars.size(); i++) {
    brightness.add(150.0);  // Initial brightness for regular stars
    starPulse.add(random(0.0, 1.0));  // Random pulsation for regular stars
    pulseSpeed.add(random(0.02, 0.06));  // Random pulsation speed for regular stars

    // Assign random color to each regular star
    int randomColor = (int)random(1, 6);
    switch(randomColor) {
      case 1: starColors.add(particleColor1); break;
      case 2: starColors.add(particleColor2); break;
      case 3: starColors.add(particleColor3); break;
      case 4: starColors.add(particleColor4); break;
      case 5: starColors.add(particleColor5); break;
    }
  }
}

void draw() {
  background(img);  // Redraw the image every frame to keep the background

  // Pulsation of the eyes (in sync with bright stars)
  for (int i = 0; i < eyes.size(); i++) {
    eyePulse.set(i, eyePulse.get(i) + eyePulseSpeed.get(i));
    if (eyePulse.get(i) > 1 || eyePulse.get(i) < 0) {
      eyePulseSpeed.set(i, eyePulseSpeed.get(i) * -1);  // Reverse pulsation direction
    }
  }

  // Draw the eyes with strong pulsation (same color as bright stars)
  for (int i = 0; i < eyes.size(); i++) {
    PVector eye = eyes.get(i);
    float pulse = 255.0 * brightStarPulse.get(i % brightStars.size());  // Use bright star pulsation for eyes
    fill(255, 255, 200, pulse);  // Same color as bright stars
    noStroke();
    ellipse(eye.x, eye.y, 4, 4);  // Small size for eyes
  }

  // Manage the pulsation of bright stars
  for (int i = 0; i < brightStars.size(); i++) {
    if (!selected.get(i)) {
      brightStarPulse.set(i, brightStarPulse.get(i) + brightPulseSpeed.get(i));
      if (brightStarPulse.get(i) > 1 || brightStarPulse.get(i) < 0) {
        brightPulseSpeed.set(i, brightPulseSpeed.get(i) * -1);  // Reverse pulsation direction
      }
    }
  }

  // Draw bright stars, larger when selected, no pulsation when selected
  for (int i = 0; i < brightStars.size(); i++) {
    float brightnessLevel = selected.get(i) ? 255 : 200.0 * brightStarPulse.get(i);
    float starSize = selected.get(i) ? 6 : 3 + 3 * brightStarPulse.get(i);

    fill(255, 255, 200, brightnessLevel);  // Slightly off-white for bright stars
    noStroke();
    ellipse(brightStars.get(i).x, brightStars.get(i).y, starSize, starSize);  // Larger when selected
  }

  // Manage the pulsation of regular stars
  for (int i = 0; i < stars.size(); i++) {
    starPulse.set(i, starPulse.get(i) + pulseSpeed.get(i));
    if (starPulse.get(i) > 1 || starPulse.get(i) < 0) {
      pulseSpeed.set(i, pulseSpeed.get(i) * -1);  // Reverse pulsation direction
    }
  }

  // Draw regular stars (smaller and colored using the particle colors)
  for (int i = 0; i < stars.size(); i++) {
    PVector star = stars.get(i);
    float brightnessLevel = 255.0 * starPulse.get(i);

    fill(starColors.get(i), brightnessLevel);  // Use the randomly assigned color for each regular star
    noStroke();
    ellipse(star.x, star.y, 2, 2);  // Smaller, twinkling regular stars
  }

  // Draw constellation lines if stars are selected
  if (selectedOrder.size() > 1) {
    stroke(255);
    strokeWeight(0.2);  // Thin lines for constellation
    for (int j = 0; j < selectedOrder.size() - 1; j++) {
      int index1 = selectedOrder.get(j);
      int index2 = selectedOrder.get(j + 1);
      line(brightStars.get(index1).x, brightStars.get(index1).y, brightStars.get(index2).x, brightStars.get(index2).y);
    }
  }

  // Update and display particles
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i);
    p.update();
    p.display();
    if (p.isDead()) {
      particles.remove(i);
    }
  }
}

void mousePressed() {
  // Check if the mouse is clicked near a bright star
  for (int i = 0; i < brightStars.size(); i++) {
    if (dist(mouseX, mouseY, brightStars.get(i).x, brightStars.get(i).y) < 20) {
      if (selected.get(i)) {
        selected.set(i, false);  // Deselect the star
        selectedOrder.remove((Integer)i);  // Remove from selection order
      } else {
        selected.set(i, true);  // Select the star
        selectedOrder.add(i);  // Add to selection order
      }
      break;
    }
  }

  // Generate particles at the clicked position
  for (int i = 0; i < 10; i++) {  // Burst of 10 particles
    int particleColorIndex = (int)random(1, 6);  // Random color for particles
    switch(particleColorIndex) {
      case 1: particles.add(new Particle(new PVector(mouseX, mouseY), particleColor1)); break;
      case 2: particles.add(new Particle(new PVector(mouseX, mouseY), particleColor2)); break;
      case 3: particles.add(new Particle(new PVector(mouseX, mouseY), particleColor3)); break;
      case 4: particles.add(new Particle(new PVector(mouseX, mouseY), particleColor4)); break;
      case 5: particles.add(new Particle(new PVector(mouseX, mouseY), particleColor5)); break;
    }
  }
}

void keyPressed() {
  if (key == ' ') {  // Press space to reset
    selectedOrder.clear();  // Remove all constellation lines
    for (int i = 0; i < selected.size(); i++) {
      selected.set(i, false);  // Deselect all stars
    }
    println("Constellation reset");
  }
}

