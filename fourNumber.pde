ArrayList<Cordinate> getFourCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int firstX = heightMy * 40 / 100; 
  int firstY = getWidthOfFour(heightMy);
  for (float x = firstX; x >= 0; x--) {
    float y = (-5 * x) / 4 + firstY;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  for (float x = 0; x <= firstY; x++) {
    float y = firstY;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }

  for (float y = firstX; y <= heightMy; y++) {
    float x = firstX;
    Cordinate map = new Cordinate(offsetX + x, offsetY + y);
    cords.add(map);
  }
  return cords;
}

ArrayList<Cordinate> getEasyFourCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getFourCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalFourCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  int widthOfFour = getWidthOfFour((int)heightOfNumber);

  Cordinate firstOne = new Cordinate(offsetX + heightOfNumber * 40 / 100, offsetY);
  returnedList.add(firstOne);
  Cordinate second = new Cordinate(offsetX, offsetY + widthOfFour);
  returnedList.add(second);
  Cordinate third = new Cordinate(offsetX + widthOfFour, offsetY + widthOfFour);
  returnedList.add(third);
  Cordinate fourth = new Cordinate(offsetX + heightOfNumber * 40 / 100, offsetY + heightOfNumber * 40 / 100);
  returnedList.add(fourth);
  Cordinate fifth = new Cordinate(offsetX + heightOfNumber * 40 / 100, offsetY + heightOfNumber);
  returnedList.add(fifth);

  return returnedList;
}

int getWidthOfFour(int heightOfFour) {
  return heightOfFour * 50 / 100;
}

void drawFourGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfFour(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}