ArrayList<Cordinate> getSevenCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfSeven(heightMy);
  int firstX = widthMy;

  for (float x = 0; x <= firstX; x++) {
    float y = 0;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  for (float x = firstX; x >= 0; x--) {
    float y = (-5 * x) / 2 + heightMy;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  return cords;
}

ArrayList<Cordinate> getEasySevenCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getSevenCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalSevenCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  int widthOfSeven = getWidthOfSeven((int)heightOfNumber);

  Cordinate firstOne = new Cordinate(offsetX, offsetY);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX + widthOfSeven, offsetY);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX, offsetY + heightOfNumber);
  returnedList.add(third);

  return returnedList;
}

int getWidthOfSeven(int heightOfSeven) {
  return heightOfSeven * 40 / 100;
}

void drawSevenGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfSeven(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}