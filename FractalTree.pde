private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2; 

public void setup() {   
  size(640,480);    
  noLoop(); 
} 

public void draw() {   
  background(0);   
  stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
  line(320,480,320,380);   
  drawBranches(320,380,100,3*Math.PI/2);  
} 

public void drawBranches(int x,int y, double branchLength, double angle) {   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int X1 = (int)(branchLength*Math.cos(angle1) + x);
  int Y1 = (int)(branchLength*Math.sin(angle1) + y);
  int X2 = (int)(branchLength*Math.cos(angle2) + x);
  int Y2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x, y, X1, Y1);
  line(x, y, X2, Y2);
  branchLength = branchLength*fractionLength;
  
 if(branchLength > smallestBranch) {
    drawBranches(X1, Y1, branchLength / 1.25, angle1 + .5);
    drawBranches(X2, Y2, branchLength / 1.25, angle2 - .5);
  }
}

public void mousePressed() {
  redraw();
}


