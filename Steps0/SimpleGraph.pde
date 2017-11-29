class SimpleGraph
{

  PVector upperLeft, lowerRight, dataUL, dataLR;

  SimpleGraph(float ULx, float ULy, float LRx, float LRy, float dataULx, float dataULy, float dataLRx, float dataLRy)
  {

    this.upperLeft = new PVector(ULx, ULy);
    this.lowerRight = new PVector(LRx, LRy);
    this.dataUL = new PVector(dataULx, dataULy);
    this.dataLR = new PVector(dataLRx, dataLRy);
  }



  SimpleGraph(PVector upperLeft, PVector lowerRight, PVector dataUL, PVector dataLR)
  {
    this.upperLeft = upperLeft;
    this.lowerRight = lowerRight;
    this.dataUL = dataUL;
    this.dataLR = dataLR;
  }

void setDataRange(float dataULx, float dataULy, float dataLRx, float dataLRy)
{
    this.dataUL = new PVector(dataULx, dataULy);
    this.dataLR = new PVector(dataLRx, dataLRy);
}  


  PVector dataToScreen(PVector data)
  {
    //println(data.x+","+ dataUL.x+","+lowerRight.x+","+upperLeft.x+","+dataLR.x+","+dataUL.x+","+lowerRight.x);
    float newX = (data.x - dataUL.x)*(lowerRight.x-upperLeft.x)/(dataLR.x-dataUL.x)+upperLeft.x;
    float newY = (data.y - dataUL.y)*(lowerRight.y-upperLeft.y)/(dataLR.y-dataUL.y)+upperLeft.y;
    return new PVector(newX, newY);
  }

  void drawPoint(PVector data)
  {
    PVector scrPt = dataToScreen(data);
    point(scrPt.x, scrPt.y);
    //ellipse(scrPt.x,scrPt.y,5,5);
  }


  void drawLine(PVector dataStart, PVector dataEnd)
  {
    PVector scrPt1 = dataToScreen(dataStart);
    PVector scrPt2 = dataToScreen(dataEnd);
    line(scrPt1.x, scrPt1.y, scrPt2.x, scrPt2.y);
  }
}