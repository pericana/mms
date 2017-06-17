ArrayList<Cordinate> getTwoCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfTwo(heightMy);
  int radius = widthMy / 2;
  int b1 = radius + (int)offsetY;
  int a1 = (int)offsetX + radius;

  cords.addAll(getQuarterUpperLeftFromLeft(a1, b1, radius));
  cords.addAll(getQuarterUpperRightFromLeft(a1, b1 - widthOfStroke / 2, radius));
  cords.addAll(getFirstForTwo(a1 + widthOfStroke / 2, b1, radius));

  float lastX = ((Cordinate)cords.get(cords.size() - 1)).x + widthOfStroke / 2;
  float lastY = ((Cordinate)cords.get(cords.size() - 1)).y + widthOfStroke / 2;

  float x2 = offsetX;
  float y2 = heightMy + offsetY;

  for (float x = lastX; x >= x2; x--) {
    float y = ((y2 - lastY)/(x2 - lastX)) * (x - lastX) + lastY; 
    Cordinate map = new Cordinate(x, y);
    cords.add(map);
  }

  for (float x = x2; x <= offsetX + widthMy; x++) {
    float y = offsetY + heightMy; 
    Cordinate map = new Cordinate(x, y);
    cords.add(map);
  }

  return cords;
}

ArrayList<Cordinate> getEasyTwoCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getTwoCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalTwoCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();
  ArrayList<Cordinate> temp = getTwoCordinates(offsetX, offsetY, heightOfNumber);

  Cordinate firstOne = temp.get(0);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX + getWidthOfTwo((int)heightOfNumber), firstOne.y);
  returnedList.add(second);
  int half = temp.size() / 2;
  returnedList.add(temp.get(half + half / 6));
  Cordinate fourth = new Cordinate(firstOne.x, offsetY + heightOfNumber);
  returnedList.add(fourth);
  Cordinate fifth = new Cordinate(offsetX + getWidthOfTwo((int)heightOfNumber), offsetY + heightOfNumber);
  returnedList.add(fifth);

  return returnedList;
}

int getWidthOfTwo(int heightOfTwo) {
  return heightOfTwo / 2;
}

void drawTwoGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfTwo(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}