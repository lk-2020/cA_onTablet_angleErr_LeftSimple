int shiftAnimatingX = 100;

float x0, y0, x1, y1;

//WHITE SKELETON 
int whiteSkeletonXincr = 150;

int whiteSkeletonX = dWidth/2 ;
int whiteSkeletonY = 720/2;

int whiteRightHandJointX = dWidth/2 + 59 ;
int whiteRightHandJointY = 304;
int whiteLeftHandJointX = dWidth/2 - 57;
int whiteLeftHandJointY = whiteRightHandJointY;
int whiteRightHandEndX = dWidth/2 + 100;
int whiteRightHandEndY = 200;
int whiteLeftHandEndX = dWidth/2 - 100;
int whiteLeftHandEndY = 200;

//int whiteRightHandEndX = dWidth/2 + 200;
//int whiteRightHandEndY = 200;
//int whiteLeftHandEndX = dWidth/2 - 200;
//int whiteLeftHandEndY = 200;



int jRx; // joint right hand
int it=0, iter=0;

int bufferArea = 175;

int whiteHandLength = 150;
//int whiteHandLength = 250;

float dx1 = whiteRightHandEndX - whiteRightHandJointX;
float dy1 = whiteRightHandEndY - whiteRightHandJointY;
float dx2 = whiteLeftHandEndX - whiteLeftHandJointX;
float dy2 = whiteLeftHandEndY - whiteLeftHandJointY;
float angle1_ = atan2(dy1, dx1);  
float angle2_ = atan2(dy2, dx2);  




