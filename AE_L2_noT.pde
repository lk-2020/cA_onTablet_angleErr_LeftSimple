import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

color bg = color(255);

int dWidth=1280;
int dHeight=720;
int numRcordings=0;

int[] iterations;
int rec = 0;
float ang;

color skeletonColor = 50;
boolean first;

boolean inHere = true;

MyButton showButton;
int showButtonX = 1280 - 100;
int showButtonY = dHeight - 100;
int showButtonWidth = 100;
int showButtonHeight = 50;

MyButton noShowButton;
int noShowButtonX = 1280 - 100;
int noShowButtonY = dHeight - 200;
int noShowButtonWidth = 100;
int noShowButtonHeight = 50;


MyButton doneButton;
int doneButtonX = 1280 - 100;
int doneButtonY = 0;
int doneButtonWidth = 100;
int doneButtonHeight = 50;

boolean show = true;

void setup() {
  first = true;
  //size(displayWidth, displayHeight);
  size(1280, 720);
  //size(2560,1600);
  orientation(LANDSCAPE);
  background(0);
  fill(0, 0, 244);
  stroke(255);
  rectMode(CENTER);

  // Initialize Multitouch x y arrays
  xTouch = new float [10];
  yTouch = new float [10]; // Don't use more than ten fingers
  sqrtL = new float[4]; 
  sqrtR = new float[4];
  doneButton = new MyButton(doneButtonX, doneButtonY, doneButtonWidth, doneButtonHeight, "DONE");
  showButton = new MyButton(showButtonX, showButtonY, showButtonWidth, showButtonHeight, " ");
  noShowButton = new MyButton(noShowButtonX, noShowButtonY, noShowButtonWidth, noShowButtonHeight, "n");
  dataLoggerInit();
}

//-----------------------------------------------------------------------------------------

void draw() {
//  if (showButton.isShowClicked())
//  {
//    reInitializeTouchPoints();
//    show = true;
//  }
//  if (noShowButton.isnoShowClicked())
//  {
//    reInitializeTouchPoints();
//    show = false;
//  }
  iter=0;// variable to store the actions
  background(bg);
  strokeWeight(5);
  stroke(255, 0, 0);
  line(dWidth/2, whiteRightHandJointY, 0, whiteRightHandJointY);
  firstTrue();
  doneButton.draw();
//  showButton.draw();
//  noShowButton.draw();
  if (doneButton.isStopClicked())
  {
    bg = color(0);
    reInitializeTouchPoints();
    saveLoggedData();
  }

  //drawBlueCirclesOnTouch();
  if (TouchEvents != 0)
    first = false;
  if (TouchEvents == 1)
    ifTouchEventIs1();
  //  if (TouchEvents == 2)
  //    ifTouchEventIs2();
    if (TouchEvents == 4)
    {
      bg = color(0);
      saveLoggedData();
    }

  if ((degrees(angle2_)) < 0)
    ang = 180+(degrees(angle2_));
  else
    ang = -180+(degrees(angle2_));

  if ((ang<2)&&(ang>-2))
    logData(0, 111111, 111111, 111111);
}

void firstTrue() //white left body
{
  rectMode(CENTER);
  fill(skeletonColor);
  noStroke();
//  noFill();
//  stroke(0);
  rect(whiteSkeletonX, whiteSkeletonY, 160, 160, 15);

  if ((first == true))
  {   
    angle1_ = 0;
    angle2_ = radians(180);
    strokeWeight(25);
    stroke(skeletonColor);
    segment(whiteRightHandJointX, whiteRightHandJointY, angle1_, whiteHandLength); //white right hand skeleton
    segment(whiteLeftHandJointX, whiteRightHandJointY, angle2_, whiteHandLength); //white left hand skeleton
  }
}

void segment(float x, float y, float a, int handLength) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, handLength, 0);
  popMatrix();
}

void reInitializeTouchPoints()
{
  xTouch[0] = 0.0;
  yTouch[0] = 0.0;
}

