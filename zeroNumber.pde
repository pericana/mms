ArrayList<Cordinate> getZeroCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfZero(heightMy);
  int radius = widthMy / 2;
  int a1 = (int)offsetX + radius;
  int b1 = radius + (int)offsetY;
  int b2 = heightMy - radius + (int)offsetY;

  cords.addAll(getQuarterUpperLeftFromRight(a1, b1, radius));
  for (int y = radius; y <= heightMy - radius; y++) {
    float x = -widthOfStroke / 2;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  cords.addAll(getQuarterDownLeftFromLeft(a1, b2, radius));
  cords.addAll(getQuarterDownRightFromLeft(a1, b2 + widthOfStroke / 2, radius));

  for (int y = heightMy - radius; y >= radius; y--) {
    float x = widthMy + widthOfStroke / 2;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  cords.addAll(getQuarterUpperRightFromRight(a1, b1 + widthOfStroke / 2, radius));

  return cords;
}

ArrayList<Cordinate> getEasyZeroCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getZeroCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalZeroCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getZeroCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  returnedList.add(temp.get(0));
  int firstQuater = temp.size() / 4;
  returnedList.add(temp.get(firstQuater));
  int half = temp.size() / 2;
  returnedList.add(temp.get(half));
  int thirdQuater = half + firstQuater;
  returnedList.add(temp.get(thirdQuater));

  return returnedList;
}

int getWidthOfZero(int heightOfZero) {
  return heightOfZero * 50 / 100;
}

void drawZeroGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfZero(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}