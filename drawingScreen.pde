Button backFromDrawing;
Button doneDrawingButton;
Button nextDrawingButton;
Button tryAgainDrawingButton;

ArrayList<Integer> xValues;
ArrayList<Integer> yValues;
int leftDrawRectMargin;
int topDrawRectMargin;
int bottomDrawRectMargin;
int rightDrawRectMargin;

int numberMode = 1;

void setDrawingScreen(int numberMode) {
  currentStatus = Status.DRAWING_SCREEN;
  this.numberMode = numberMode;

  int margin = height * 10 / 100;
  int heightOfDrawingArea = height - margin * 2; 
  int widthOfDrawingArea = heightOfDrawingArea;
  int heightOfNumber = heightOfDrawingArea - margin * 2;
  topDrawRectMargin = margin;
  bottomDrawRectMargin = margin + heightOfDrawingArea;
  leftDrawRectMargin = margin;
  rightDrawRectMargin = margin + widthOfDrawingArea;

  fill(255, 0, 0);
  noStroke();

  setUpDrawing(currentLevel, heightOfNumber, widthOfDrawingArea, heightOfDrawingArea, margin);

  xValues = new ArrayList<Integer>();
  yValues = new ArrayList<Integer>();

  if (doneDrawingButton != null) {
    doneDrawingButton.show();
  } else {
    doneDrawingButton = cp5.addButton("done_drawing").setCaptionLabel("Gotovo").setValue(0).setPosition(widthOfDrawingArea + margin * 2, margin + heightOfDrawingArea - 30).setSize(100, 30).setImages(imageGotovo, imageGotovo_clicked, imageGotovo).addListener(new DrawingScreenButtonListener());
  }

  if (backFromDrawing != null) {
    backFromDrawing.show();
  } else {
    backFromDrawing = cp5.addButton("back_drawing").setCaptionLabel("Nazad").setValue(-1).setPosition(20, 29).setSize(80, 30).setImages(imageNazad, imageNazad_clicked, imageNazad).addListener(new DrawingScreenButtonListener());
  }
}

class DrawingScreenButtonListener implements ControlListener {
  int value;
  public void controlEvent(ControlEvent theEvent) {
    value = (int)theEvent.getController().getValue();
    if (value == -1) {
      goToLevelScreen();
    } else if (value == 0) {
      checkCorrection();
    } else if (value == 1) {
      if (numberMode == 3) {
        goToLevelScreen();
      } else {
        removeDrawingScreenButton();
         setDrawingScreen(numberMode + 1);
      }
    } else if (value == 2) {

      removeDrawingScreenButton();
      setDrawingScreen(numberMode);
    }
  }
}

void goToLevelScreen() {
  removeDrawingScreenButton();
  setLevelScreen();
}

void checkCorrection() {
  int correct = 0, correct2 = 0;
  int failed = 0, failed2 = 0, isFailed = 0;

  ArrayList<Cordinate> listForCheck = listForDrawNumber;

  for (int i = 0; i < xValues.size(); i++) {
    int found = 0;
    Integer x = xValues.get(i);
    Integer y = yValues.get(i);

    for (Cordinate item : listForCheck) {
      Float xCheck = item.x;
      Float yCheck = item.y;

      if (x < xCheck + 10 && x > xCheck - 10 && y < yCheck + 10 && y > yCheck - 10) {
        found = 1;
        break;
      }
    }
    noStroke();
    if (found == 1) {
      correct++;
      fill(0, 0, 255);
    } else {
      failed++;
      fill(255, 0, 0);
    }
    rect(x - 2, y - 2, 4, 4);
  }
  
  for (int i = 0; i < listForDrawNumber.size(); i++) {
    int found = 0;
    Float xCheck = listForDrawNumber.get(i).x;
    Float yCheck = listForDrawNumber.get(i).y;

    for (int j = 0; j < xValues.size(); j++) {    
      Integer x = xValues.get(j);
      Integer y = yValues.get(j);

      if (xCheck < x + 50 && xCheck > x - 50 && yCheck < y + 50 && yCheck > y - 50) {
        found = 1;
        break;
      }
    }
    if (found == 1) {
      correct2++;
    } else {
      failed2++;
    }
  }

  print("Correct : ", correct, "\nFailed : ", failed, "\n");
  print("Correct2 : ", correct2, "\nFailed2 : ", failed2, "\n");
  if (failed > 0 || failed2 > 0) {
    isFailed = 1;
  }
  
  if(isFailed == 1){
    playSound(wrongSound);
  }else{
    playSound(correctSound);
  }

  saveData(currentLevel, numberMode, 1);

  setNextAndTryAgainButton(isFailed == 0 ? 1 : 0);
}

void setNextAndTryAgainButton(int isNext) {

  if (tryAgainDrawingButton != null) {
    tryAgainDrawingButton.show();
  } else {
    tryAgainDrawingButton = cp5.addButton("try_again_drawing").setCaptionLabel("Ponovno").setValue(2).setPosition(doneDrawingButton.getPosition()[0], doneDrawingButton.getPosition()[1] - 50).setSize(100, 30).setImages(imagePonovno, imagePonovno_clicked, imagePonovno).addListener(new DrawingScreenButtonListener());
  }

  if (isNext == 1) {
    fill(255);
    textFont(font);
    textSize(40);
    textAlign(CENTER);
    text("TOČNO", tryAgainDrawingButton.getPosition()[0], 100, 180, 100);

    if (nextDrawingButton != null) {
      nextDrawingButton.show();
    } else {
      nextDrawingButton = cp5.addButton("next_drawing").setCaptionLabel("Sljedece").setValue(1).setPosition(tryAgainDrawingButton.getPosition()[0], tryAgainDrawingButton.getPosition()[1] - 50).setSize(100, 30).setImages(imageSljedece, imageSljedece_clicked, imageSljedece).addListener(new DrawingScreenButtonListener());
    }
  }else{
    fill(255);
    textFont(font);
    textSize(20);
    textAlign(CENTER);
    text("NETOČNO, POKUŠAJTE PONOVNO", tryAgainDrawingButton.getPosition()[0], 100, 180, 100);
  }

  doneDrawingButton.hide();
  image(imageGotovo_clear, (int)doneDrawingButton.getPosition()[0], (int)doneDrawingButton.getPosition()[1], 100, 30);
}

void onDrawingInDrawingScreen() {
  if (isUserDrawing == 1) {
    if (mouseX < rightDrawRectMargin && mouseX > leftDrawRectMargin && mouseY < bottomDrawRectMargin && mouseY > topDrawRectMargin
      && pmouseX < rightDrawRectMargin && pmouseX > leftDrawRectMargin && pmouseY < bottomDrawRectMargin && pmouseY > topDrawRectMargin) {
      stroke(255);
      strokeWeight(widthOfStroke * 2);
      line(mouseX, mouseY, pmouseX, pmouseY);
      saveCordinates(mouseX, mouseY, xValues, yValues);
    }
  }
}

void saveCordinates(int x, int y, ArrayList<Integer> xValues, ArrayList<Integer> yValues) {

  if (xValues.size() > 0) {
    Integer lastXValues = xValues.get(xValues.size() - 1);
    Integer lastYValues = yValues.get(yValues.size() - 1);
    if (lastXValues == x && lastYValues == y) {
    } else {
      xValues.add(x);
      yValues.add(y);
    }
  } else {
    xValues.add(x);
    yValues.add(y);
  }
}

void removeDrawingScreenButton() {
  doneDrawingButton.hide();
  if (nextDrawingButton != null) nextDrawingButton.hide();
  if (tryAgainDrawingButton != null) tryAgainDrawingButton.hide();
  backFromDrawing.hide();
  resetBackground();
}

void setUpDrawing(int number, int heightOfNumber, int widthOfDrawingArea, int heightOfDrawingArea, int margin) {
  int widthOfNumber = 0;
  widthOfNumber = getWidthOfNumber(number, heightOfNumber);
  int startX = (widthOfDrawingArea - widthOfNumber) / 2 + margin;
  drawGuidLines(number, heightOfNumber, widthOfDrawingArea, heightOfDrawingArea, margin, startX);
  stroke(255);
  fill(255);
  strokeWeight(widthOfStroke);
  for (Cordinate map : getCordinates(number, numberMode, heightOfNumber, margin, startX)) {
    rect(map.x, map.y, widthOfStroke, widthOfStroke);
  }
}

int getWidthOfNumber(int number, int heightOfNumber) {
  if (number == 0) {
    return getWidthOfZero(heightOfNumber);
  } else if (number == 1) {
    return getWidthOfOne(heightOfNumber);
  } else if (number == 2) {
    return getWidthOfTwo(heightOfNumber);
  } else if (number == 3) {
    return getWidthOfThree(heightOfNumber);
  } else if (number == 4) {
    return getWidthOfFour(heightOfNumber);
  } else if (number == 5) {
    return getWidthOfFive(heightOfNumber);
  } else if (number == 6) {
    return getWidthOfSix(heightOfNumber);
  } else if (number == 7) {
    return getWidthOfSeven(heightOfNumber);
  } else if (number == 8) {
    return getWidthOfEight(heightOfNumber);
  } else if (number == 9) {
    return getWidthOfNine(heightOfNumber);
  }
  return heightOfNumber / 2;
}

void drawGuidLines(int number, int heightOfNumber, int widthOfDrawingArea, int heightOfDrawingArea, int margin, int startX) {
  if (number == 0) {
    drawZeroGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 1) {
    drawOneGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 2) {
    drawTwoGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 3) {
    drawThreeGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 4) {
    drawFourGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 5) {
    drawFiveGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 6) {
    drawSixGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 7) {
    drawSevenGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 8) {
    drawEightGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  } else if (number == 9) {
    drawNineGuidlines(margin, widthOfDrawingArea, heightOfDrawingArea, heightOfNumber, startX);
  }
}

ArrayList<Cordinate> getCordinates(int number, int numberMode, int heightOfNumber, int margin, int startX) {
  if (number == 0) {
    if (numberMode == 1) {
      return getEasyZeroCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalZeroCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 1) {
    if (numberMode == 1) {
      return getEasyOneCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalOneCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 2) {
    if (numberMode == 1) {
      return getEasyTwoCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalTwoCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 3) {
    if (numberMode == 1) {
      return getEasyThreeCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalThreeCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 4) {
    if (numberMode == 1) {
      return getEasyFourCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalFourCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 5) {
    if (numberMode == 1) {
      return getEasyFiveCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalFiveCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 6) {
    if (numberMode == 1) {
      return getEasySixCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalSixCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 7) {
    if (numberMode == 1) {
      return getEasySevenCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalSevenCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 8) {
    if (numberMode == 1) {
      return getEasyEightCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalEightCordinates(startX, margin * 2, heightOfNumber);
    }
  } else if (number == 9) {
    if (numberMode == 1) {
      return getEasyNineCordinates(startX, margin * 2, heightOfNumber);
    } else if (numberMode == 2) {
      return getNormalNineCordinates(startX, margin * 2, heightOfNumber);
    }
  }
  return new ArrayList<Cordinate>();
}