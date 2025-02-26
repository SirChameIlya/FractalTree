private double fractionLength = .8;
private int smallestBranch = 10;
private double branchAngle = .2;
public void setup()
{
  size(640, 480);
  noLoop();
}
public void draw()
{
  background(0);
  stroke(0, 255, 0);
  line(320, 480, 320, 380);
  //stroke(60, 130, 60);
  drawBranches(320, 380, 100, 3*Math.PI/2, 0, 255, 0);  //will add later
}
public void drawBranches(int x, int y, double branchLength, double angle, int r, int g, int b)
{
  stroke(r, g, b);
  double angle1 = angle + branchAngle + 0.2 * Math.random() - 0.1;
  double angle2 = angle - branchAngle + 0.2 * Math.random() - 0.1;
  branchLength *= fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  //your code here
  if (branchLength <= smallestBranch) {
    line(endX1, endY1, (float)(branchLength * Math.cos(angle1) + endX1), (float)(branchLength * Math.sin(angle1) + endY1));
    line(endX2, endY2, (float)(branchLength * Math.cos(angle2) + endX2), (float)(branchLength * Math.sin(angle2) + endY2));
  } else {
    drawBranches(endX1, endY1, branchLength, angle1, r+10, g-10, b+10);
    drawBranches(endX2, endY2, branchLength, angle2, r+10, g-10, b+10);
  }
}

public void keyPressed() {
  if (key == 'a' && branchAngle < 1) {
    branchAngle += 0.1;
    redraw();
  } else if (key == 'd' && branchAngle > 0) {
    branchAngle -= 0.1;
    redraw();
  }
}
