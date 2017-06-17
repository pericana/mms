ArrayList<Cordinate> getNineCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfNine(heightMy);
  int radius = widthMy / 2;
  int a1 = (int)offsetX + radius;
  int b1 = radius + (int)offsetY;
  int b2 = heightMy - radius + (int)offsetY;

  cords.addAll(getQuarterDownRightFromRight(a1, b1, radius));
  cords.addAll(getQuarterDownLeftFromRight(a1, b1 + widthOfStroke / 2, radius));
  cords.addAll(getQuarterUpperLeftFromLeft(a1 - widthOfStroke / 2, b1, radius));
  cords.addAll(getQuarterUpperRightFromLeft(a1, b1 - widthOfStroke / 2, radius));


  for (int i = radius; i <= heightMy - radius; i++) {
    float y = i;
    float x = widthMy + widthOfStroke / 2;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  cords.addAll(getQuarterDownRightFromRight(a1, b2, radius));
  cords.addAll(getQuarterDownLeftFromRight(a1, b2 + widthOfStroke / 2, radius));

  return cords;
}

ArrayList<Cordinate> getEasyNineCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getNineCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalNineCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  int widthOfNine = getWidthOfNine((int)heightOfNumber);
  int radius = widthOfNine / 2;

  Cordinate firstOne = new Cordinate(offsetX + widthOfNine, offsetY + radius);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX + widthOfNine / 2, offsetY + heightOfNumber - radius * 2);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX, offsetY + radius);
  returnedList.add(third);
  Cordinate fourth = new Cordinate(offsetX + widthOfNine, offsetY + heightOfNumber - radius);
  returnedList.add(fourth);
  Cordinate fifth = new Cordinate(offsetX, offsetY + heightOfNumber - radius);
  returnedList.add(fifth);

  return returnedList;
}

int getWidthOfNine(int heightOfNine) {
  return heightOfNine / 2;
}

void drawNineGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfNine(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}