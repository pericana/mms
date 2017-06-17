int arrayLength;
int arrayStep;
ArrayList<Cordinate> listForDrawNumber;
int waittingFrame;

Button skipAnimating;

static int FRAME_FOR_WAIT = 30;

int timesAnimate = 1;

void setAnimateScreen(int numberForAnimation) {
  
  if (skipAnimating != null) {
    skipAnimating.show();
  } else {
    skipAnimating = cp5.addButton("skip_animating").setCaptionLabel("Prekoči").setValue(1).setPosition(600, 400).setSize(100, 30).setImages(imagePreskoci, imagePreskoci_clicked, imagePreskoci).addListener(new AnimateScreenButtonListener());
  }
  
  frameRate(60);
  
  currentStatus = Status.ANIMATE_SCREEN;
  currentLevel = numberForAnimation;
  int margin = height * 10 / 100;
  int heightOfDrawingArea = height - margin * 2; 
  int widthOfDrawingArea = heightOfDrawingArea;
  int heightOfNumber = heightOfDrawingArea - margin * 2;

  arrayStep = 0;
  waittingFrame = FRAME_FOR_WAIT;
  if (numberForAnimation == 0) {
    playSoundForNumber("number_sounds/0_nula.mp3", 300, 500);
    int widthOfZero = getWidthOfZero(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfZero) / 2 + margin;
    listForDrawNumber = getZeroCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawZeroGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 1) {
    playSoundForNumber("number_sounds/1_jedan.mp3", 80, 100);
    int widthOfOne = getWidthOfOne(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfOne) / 2 + margin;
    listForDrawNumber = getOneCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawOneGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 2) {
    playSoundForNumber("number_sounds/2_dva.mp3", 60, 90);
    int widthOfTwo = getWidthOfTwo(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfTwo) / 2 + margin;
    listForDrawNumber = getTwoCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawTwoGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 3) {
    playSoundForNumber("number_sounds/3_tri.mp3", 90, 100);
    int widthOfThree = getWidthOfThree(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfThree) / 2 + margin;
    listForDrawNumber = getThreeCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawThreeGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 4) {
    playSoundForNumber("number_sounds/4_cetiri.mp3", 50, 60);
    int widthOfFour = getWidthOfFour(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfFour) / 2 + margin;
    listForDrawNumber = getFourCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawFourGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 5) {
    playSoundForNumber("number_sounds/5_pet.mp3", 50, 60);
    int widthOfFive = getWidthOfFive(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfFive) / 2 + margin;
    listForDrawNumber = getFiveCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawFiveGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 6) {
    playSoundForNumber("number_sounds/6_sest.mp3", 80, 100);
    int widthOfSix = getWidthOfSix(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfSix) / 2 + margin;
    listForDrawNumber = getSixCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawSixGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 7) {
    playSoundForNumber("number_sounds/7_sedam.mp3", 35, 50);
    int widthOfSeven = getWidthOfSeven(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfSeven) / 2 + margin;
    listForDrawNumber = getSevenCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawSevenGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 8) {
    playSoundForNumber("number_sounds/8_osam.mp3", 100, 120);
    int widthOfEight = getWidthOfEight(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfEight) / 2 + margin;
    listForDrawNumber = getEightCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawEightGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }else if (numberForAnimation == 9) {
    playSoundForNumber("number_sounds/9_devet.mp3", 90, 110);
    int widthOfNine = getWidthOfNine(heightOfNumber);
    int startX = (widthOfDrawingArea - widthOfNine) / 2 + margin;
    listForDrawNumber = getNineCordinates(startX, margin * 2, heightOfNumber);
    fill(255, 0, 0);
    noStroke();
    drawNineGuidlines(margin,widthOfDrawingArea,heightOfDrawingArea,heightOfNumber,startX);
  }
  arrayLength = listForDrawNumber.size();

  fill(0);
  stroke(255);
  strokeWeight(widthOfStroke);
  
}

void onDrawingInAnimateScreen() {
  if (arrayStep < arrayLength) {
    Cordinate map = listForDrawNumber.get(arrayStep);
    print("====================", arrayStep, " - ", arrayLength);
    print("(", map.x, map.y, ")\n");
    arrayStep ++;
    rect(map.x, map.y, widthOfStroke, widthOfStroke);
  }else{
    if(waittingFrame == 0){
      if(timesAnimate == 3){
        hideAnimateButton();
        resetBackground();
        setDrawingScreen(1);
      }else{
        hideAnimateButton();
        resetBackground();
        timesAnimate++;
        setAnimateScreen(currentLevel);
      }

    }else if(waittingFrame == FRAME_FOR_WAIT){
      frameRate(30);
      waittingFrame--;
    }else{
      waittingFrame --;
      print("Wait ", waittingFrame);
    }
  }
}

class AnimateScreenButtonListener implements ControlListener {
  int value;
  public void controlEvent(ControlEvent theEvent) {
    value = (int)theEvent.getController().getValue();
    if (value == 1) {
      waittingFrame = 0;
      hideAnimateButton();
      resetBackground();
      setDrawingScreen(1);
    } 
  }
}

void hideAnimateButton(){
  if(skipAnimating != null){
    skipAnimating.hide(); 
  }
  if(numberSound != null){
    numberSound.pause();
  }
}

void playSoundForNumber(String path, int frameRate1, int frameRate2){
  if(timesAnimate == 1){
      numberSound = minim.loadFile(path);
      frameRate(frameRate1);
    }else{
      numberSound = minim.loadFile(path.replace(".mp3", "_r.mp3"));
      frameRate(frameRate2);
    }
    playSound(numberSound);
}