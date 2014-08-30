float rightHandJoint0, rightHandJoint1, leftHandJoint0, leftHandJoint1;
float sqrtL[], sqrtR[];

void ifTouchEventIs1()
{
  rightHandJoint0 = sqrt(pow(xTouch[0]-(whiteRightHandEndX), 2) + pow(yTouch[0]-(whiteRightHandEndY), 2));
  leftHandJoint0 = sqrt(pow(xTouch[0]-(whiteLeftHandEndX), 2) + pow(yTouch[0]-(whiteLeftHandEndY), 2));
  rightHandJoint1 = sqrt(pow(xTouch[0]-(whiteRightHandJointX), 2) + pow(yTouch[0]-(whiteRightHandJointY), 2));
  leftHandJoint1 = sqrt(pow(xTouch[0]-(whiteLeftHandJointX), 2) + pow(yTouch[0]-(whiteLeftHandJointY), 2));
  strokeWeight(25);
  stroke(skeletonColor);
  if (show == true)
  {
    segment(whiteRightHandJointX, whiteRightHandJointY, angle1_, whiteHandLength);
    segment(whiteLeftHandJointX, whiteLeftHandJointY, angle2_, whiteHandLength);
  }

  if ((leftHandJoint0<bufferArea)&&(leftHandJoint1<whiteHandLength+bufferArea)&&(leftHandJoint1>whiteHandLength-bufferArea)) // right joint id touchId[0]
  {
    logData((int)xTouch[0], (int)yTouch[0], 0, 0);
    whiteLeftHandEndX = (int)xTouch[0];
    whiteLeftHandEndY = (int)yTouch[0];
    dx2 = xTouch[0] - whiteLeftHandJointX;
    dy2 = yTouch[0] - whiteLeftHandJointY;
    angle2_ = atan2(dy2, dx2);
  }

  else if ((rightHandJoint0<25)&&(rightHandJoint1<whiteHandLength+25)&&(rightHandJoint1>whiteHandLength-25)) // right joint id touchId[0]
  {
    logData(0, 0, (int)xTouch[0], (int)yTouch[0]);
    whiteRightHandEndX = (int)xTouch[0];
    whiteRightHandEndY = (int)yTouch[0];
    dx1 = xTouch[0] - whiteRightHandJointX;
    dy1 = yTouch[0] - whiteRightHandJointY;
    angle1_ = atan2(dy1, dx1);
    strokeWeight(25);
    stroke(255);
  }
}

