ArrayList<Cordinate> getEightCordinates(float offsetX, float offsetY, float heightOfNumber){
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int width1 = heightMy * 46 / 100;
  int width2 = getWidthOfEight(heightMy);
  int radius1 = width1 / 2;
  int radius2 = width2 / 2;
  int startX1 = radius2 - radius1;
  int a1 = startX1 + radius1 + (int)offsetX;
  int b1 = radius1 + (int)offsetY;
  int startX2 = 0;
  int a2 = startX2 + radius2 + (int)offsetX;
  int b2 = radius2 + radius1 * 2  + (int)offsetY + widthOfStroke / 2;
  
  cords.addAll(getQuarterDownRightFromLeft(a1, b1, radius1));
  cords.addAll(getQuarterUpperRightFromRight(a1 + widthOfStroke / 2, b1, radius1));
  cords.addAll(getQuarterUpperLeftFromRight(a1, b1 - widthOfStroke / 2, radius1));
  cords.addAll(getQuarterDownLeftFromLeft(a1 - widthOfStroke / 2, b1, radius1));
  
  cords.addAll(getQuarterUpperRightFromLeft(a2, b2, radius2));
  cords.addAll(getQuarterDownRightFromRight(a2 + widthOfStroke / 2, b2, radius2));
  cords.addAll(getQuarterDownLeftFromRight(a2, b2 + widthOfStroke / 2, radius2));
  cords.addAll(getQuarterUpperLeftFromLeft(a2 - widthOfStroke / 2, b2, radius2));

  return cords;
  
}

ArrayList<Cordinate> getEasyEightCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getEightCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalEightCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  int widthOfEight = getWidthOfEight((int)heightOfNumber);
  int radius1 = (int)heightOfNumber * 46 / 100 / 2;
  int radius2 = widthOfEight / 2;

  Cordinate firstOne = new Cordinate(offsetX + widthOfEight / 2, offsetY);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX + radius2 - radius1, offsetY + radius1);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX + widthOfEight / 2, offsetY + radius1 * 2);
  returnedList.add(third);
  Cordinate fourth = new Cordinate(offsetX + widthOfEight, offsetY + heightOfNumber - radius2);
  returnedList.add(fourth);
  Cordinate fifth = new Cordinate(offsetX + widthOfEight / 2, offsetY + heightOfNumber);
  returnedList.add(fifth);

  return returnedList;
}

int getWidthOfEight(int heightOfEight) {
  return heightOfEight * 54 / 100;
}

void drawEightGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfEight(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}