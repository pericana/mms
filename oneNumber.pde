ArrayList<Cordinate> getOneCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int firstX = getWidthOfOne(heightMy);
  int secondY = heightMy * 40 / 100;
  for (float x = 0; x <= firstX; x++) {
    float y = (-4 * x) / 3 + secondY;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  for (float y = 0; y <= heightMy; y++) {
    float x = firstX;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }
  return cords;
}

ArrayList<Cordinate> getEasyOneCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getOneCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalOneCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  Cordinate first = new Cordinate(offsetX, offsetY + heightOfNumber * 40 / 100);
  returnedList.add(first);
  Cordinate second = new Cordinate(offsetX + getWidthOfOne((int)heightOfNumber), offsetY);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX + getWidthOfOne((int)heightOfNumber), offsetY + heightOfNumber / 2);
  returnedList.add(third);
  Cordinate fourth = new Cordinate(offsetX + getWidthOfOne((int)heightOfNumber), offsetY + heightOfNumber);
  returnedList.add(fourth);

  return returnedList;
}

int getWidthOfOne(int heightOfOne) {
  return heightOfOne * 30 / 100;
}

void drawOneGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfOne(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}