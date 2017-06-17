ArrayList<Cordinate> getThreeCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfThree(heightMy);
  int radius = widthMy / 2;
  int firstX = heightMy * 15 / 100;
  int a1 = radius + (int)offsetX;
  int b1 = radius + (int)offsetY;
  int a2 = a1;
  int b2 = radius + radius * 2 + (int)offsetY + widthOfStroke / 2;

  cords.addAll(getFirstForThree(a1, b1, radius));
  cords.addAll(getQuarterUpperRightFromLeft(a1, b1 - widthOfStroke / 2, radius));
  cords.addAll(getQuarterDownRightFromRight(a1 + widthOfStroke / 2, b1, radius));

  int secondX = (int)((double)radius / 1.4);
  int secondY = widthMy + 1;
  for (int i = radius; i >= secondX; i--) {
    float x = i;
    float y = secondY;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  for (int i = secondX; i <= firstX; i++) {
    float x = i;
    float y = secondY;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  cords.addAll(getQuarterUpperRightFromLeft(a2 - widthOfStroke / 2, b2, radius));
  cords.addAll(getQuarterDownRightFromRight(a2, b2 - widthOfStroke / 2, radius));
  cords.addAll(getSecondForThree(a2, b2, radius));

  return cords;
}

ArrayList<Cordinate> getEasyThreeCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getThreeCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalThreeCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();
  ArrayList<Cordinate> temp = getThreeCordinates(offsetX, offsetY, heightOfNumber);

  Cordinate firstOne = temp.get(0);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX + getWidthOfThree((int)heightOfNumber), offsetY + heightOfNumber / 4);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX + (int)((double)(getWidthOfThree((int)heightOfNumber) / 2) / 1.4), offsetY + heightOfNumber / 2);
  returnedList.add(third);
  Cordinate fourth = new Cordinate(offsetX + getWidthOfThree((int)heightOfNumber), offsetY + (heightOfNumber / 4) * 3);
  returnedList.add(fourth);
  Cordinate lastOne = temp.get(temp.size() - 1);
  returnedList.add(lastOne);

  return returnedList;
}

int getWidthOfThree(int heightOfThree) {
  return heightOfThree / 2;
}

void drawThreeGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  ArrayList<Cordinate> temp = getThreeCordinates(startX, margin * 2 - widthOfStroke, heightOfNumber);
  Cordinate firstOne = temp.get(0);
  float x1 = firstOne.x;

  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(x1, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfTwo(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}