ArrayList<Cordinate> getFiveCordinates(float offsetX, float offsetY, float heightOfNumber) {  //vraca kordinate za broj pet, offset x i offset y su pocetne tocke kvadrata u kojem se broj crta, heightofnumber je visina broja
  ArrayList<Cordinate> cords = new ArrayList<Cordinate>();
  int heightMy = (int)heightOfNumber;
  int widthMy = getWidthOfFive(heightMy);
  int radius = (heightMy * 60 / 100) / 2;
  int firstHeight = heightMy * 40 / 100;   //zadnja y tocka prije trbuscica
  int firstX = heightMy * 8 / 100;         //zadnja x tocka prije kose crte

  int b1 = heightMy - radius + (int)offsetY;
  int a1 = (int)offsetX + radius / 2;          // a i b su tocke za krug (centar kruznice)

  for (float x = widthMy; x >= firstX; x--) {
    float y = 0;
    Cordinate cord = new Cordinate(x + offsetX, y + offsetY);
    cords.add(cord);
  }

  float x2 = 0;
  float y2 = firstHeight;
  float x1 = firstX;  
  float y1 = 0;

  for (float y = y1; y <= y2; y++) {
    float x = ((y - y1) * (x2 - x1)) / (y2 - y1) + x1;  
    Cordinate cord = new Cordinate(x + offsetX, y + offsetY);
    cords.add(cord);
  }

  for (float x = x2; x <= a1 - offsetX; x++) {
    float y = y2;  
    Cordinate cord = new Cordinate(x + offsetX, y + offsetY);
    cords.add(cord);
  }

  cords.addAll(getQuarterUpperRightFromLeft(a1, b1, radius));
  cords.addAll(getQuarterDownRightFromRight(a1 + widthOfStroke / 2, b1, radius));

  for (float x = a1 - offsetX; x >= 0; x--) {
    float y = heightMy + widthOfStroke / 2;  
    Cordinate cord = new Cordinate(x + offsetX, y + offsetY);
    cords.add(cord);
  }

  return cords;
}

ArrayList<Cordinate> getEasyFiveCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> temp = getFiveCordinates(offsetX, offsetY, heightOfNumber);
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  for (int i = 0; i < temp.size(); i = i + 20) {
    returnedList.add(temp.get(i));
  }

  return returnedList;
}

ArrayList<Cordinate> getNormalFiveCordinates(float offsetX, float offsetY, float heightOfNumber) {
  ArrayList<Cordinate> returnedList = new ArrayList<Cordinate>();

  int widthOfFive = getWidthOfFive((int)heightOfNumber);
  int radius = (int)(heightOfNumber * 60 / 100) / 2;

  Cordinate cord = new Cordinate(offsetX + widthOfFive, offsetY);
  returnedList.add(cord);
  Cordinate cord2 = new Cordinate(offsetX + heightOfNumber * 8 / 100, offsetY);
  returnedList.add(cord2);
  Cordinate cord3 = new Cordinate(offsetX, offsetY + heightOfNumber * 40 / 100);
  returnedList.add(cord3);
  Cordinate cord4 = new Cordinate(offsetX + radius / 2 + radius, offsetY + heightOfNumber * 40 / 100 + radius);
  returnedList.add(cord4);
  Cordinate cord5 = new Cordinate(offsetX, offsetY + heightOfNumber);
  returnedList.add(cord5);

  return returnedList;
}

int getWidthOfFive(int heightOfFive) {
  return heightOfFive / 2;
}

void drawFiveGuidlines(int margin, int widthOfDrawingArea, int heightOfDrawingArea, int heightOfNumber, int startX) {
  rect(margin, margin * 2 - widthOfStroke, widthOfDrawingArea, 1);
  rect(margin, margin * 2 + heightOfNumber + 2 * widthOfStroke, widthOfDrawingArea, 1);
  rect(startX - widthOfStroke, margin, 1, heightOfDrawingArea);
  rect(startX + getWidthOfFive(heightOfNumber) + 2 * widthOfStroke, margin, 1, heightOfDrawingArea);
}