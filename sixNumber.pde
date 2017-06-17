ArrayList<Cordinate> getSixCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfSix(heightMy);
  int radius = widthMy / 2;
  int a1 = (int)offsetX + radius;
  int b1 = radius + (int)offsetY;
  int b2 = heightMy - radius + (int)offsetY;

  cords.addAll(getQuarterUpperRightFromRight(a1, b1, radius));
  cords.addAll(getQuarterUpperLeftFromRight(a1, b1 - widthOfStroke / 2, radius));

  for (int i = radius; i <= heightMy - radius; i++) {
    float y = i;
    float x = -widthOfStroke / 2;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  cords.addAll(getQuarterDownLeftFromLeft(a1, b2, radius));
  cords.addAll(getQuarterDownRightFromLeft(a1, b2 + widthOfStroke / 2, radius));
  cords.addAll(getQuarterUpperRightFromRight(a1 + widthOfStroke / 2, b2, radius));
  cords.addAll(getQuarterUpperLeftFromRight(a1, b2 - widthOfStroke / 2, radius));

  return cords;
}

ArrayList<Cordinate> getEasySixCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getSixCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalSixCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  int widthOfSix = getWidthOfSix((int)heightOfNumber);
  int radius = widthOfSix / 2;

  Cordinate firstOne = new Cordinate(offsetX + widthOfSix, offsetY + radius);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX, offsetY + radius);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX, offsetY + heightOfNumber - radius);
  returnedList.add(third);
  Cordinate fourth = new Cordinate(offsetX + widthOfSix, offsetY + heightOfNumber - radius);
  returnedList.add(fourth);
  Cordinate fifth = new Cordinate(offsetX + widthOfSix / 2, offsetY + heightOfNumber - radius * 2);
  returnedList.add(fifth);

  return returnedList;
}

int getWidthOfSix(int heightOfSix) {
  return heightOfSix / 2;
}

void drawSixGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfSix(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}