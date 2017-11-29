PVector [] dataPoints;
int start = 2;
SimpleGraph sg;

void setup()
{
  size(1500, 800);
  String [] data = loadStrings("50andsteps61andchest50.csv");
  dataPoints = new PVector[data.length];
  
  // Start at i=1 to avoid header line
  for (int i = 1; i < data.length; i++)
  {
    String [] s = split(data[i], ',');
    dataPoints[i] = new PVector(Float.valueOf(s[0]), Float.valueOf(s[4]));
  }
  sg = new SimpleGraph(100, 100, 1400, 700, 0, 3, 10, -1);
}

void draw()
{
  background(200);

  sg.setDataRange(dataPoints[start].x, 3, dataPoints[start+5000-1].x, -1);
  fill(0);
  stroke(0);
  for (int i = start; i < start+5000; i++)
  {
    sg.drawPoint(dataPoints[i]);
  }

  // draw y=-1,0,1,2
  fill(50);
  for (int y = -1; y <= 3; y++)
    sg.drawLine(new PVector(dataPoints[start].x, y), new PVector(dataPoints[start+5000-1].x, y));

  //draw x-axis
  stroke(255, 0, 0);
  sg.drawLine(new PVector(dataPoints[start].x, 0), new PVector(dataPoints[start+5000-1].x, 0));
  
  //Label x value at left and right edges
  textAlign(CENTER);
  text(dataPoints[start].x, sg.dataToScreen(dataPoints[start]).x, sg.dataToScreen(new PVector(0, 0)).y-1);
  text(dataPoints[start+5000-1].x, sg.dataToScreen(dataPoints[start+5000-1]).x, sg.dataToScreen(new PVector(0, 0)).y-1);
}


void keyPressed()
{
  println(start);
  if (key == 'p')
    start+=100;
  else
    start-=100;
  if (start < 2)
    start = 2;
  if (start > dataPoints.length - 5000)
    start = dataPoints.length - 5000;
}