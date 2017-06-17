Button backLevel;
Button buttonLevel1;
Button buttonLevel2;
Button buttonLevel3;
Button buttonLevel4;
Button buttonLevel5;
Button buttonLevel6;
Button buttonLevel7;
Button buttonLevel8;
Button buttonLevel9;
Button buttonLevel10;

PImage imageNula;
PImage imageNula_clicked;
PImage imageJedan;
PImage imageJedan_clicked;
PImage imageDva;
PImage imageDva_clicked;
PImage imageTri;
PImage imageTri_clicked;
PImage imageCetiri;
PImage imageCetiri_clicked;
PImage imagePet;
PImage imagePet_clicked;
PImage imageSest;
PImage imageSest_clicked;
PImage imageSedam;
PImage imageSedam_clicked;
PImage imageOsam;
PImage imageOsam_clicked;
PImage imageDevet;
PImage imageDevet_clicked;

void setLevelScreen() {

  currentStatus = Status.LEVEL_SCREEN;

  int margin = width * 10 / 100;
  int marginBetween = width * 5 / 100;
  int widthOfButton = (width - margin * 2 - marginBetween * 4) / 5;
  int heightOfButton = ((height - 120) - margin * 2 - marginBetween) / 2;
  int sizeOfStar = (widthOfButton - 20) / 3;
  int startX = margin;
  int firstY = margin;
  int secondY = margin + marginBetween + heightOfButton;

  int[] successLevels = getLevelsModeSuccess();

  if (backLevel != null) {
    backLevel.show();
  } else {
    backLevel = cp5.addButton("back_level").setCaptionLabel("Nazad").setValue(-1).setPosition(20, 29).setSize(80, 30).setImages(imageNazad, imageNazad_clicked, imageNazad).addListener(new LevelScreenButtonListener());
  }

  if (buttonLevel1 != null) {
    buttonLevel1.show();
  } else {
    imageNula = loadImage("assets/slike/nula.png");
    imageNula_clicked = loadImage("assets/slike/nula_clicked.png");
    buttonLevel1 = cp5.addButton("level1").setCaptionLabel("Broj 0").setValue(0).setPosition(startX, firstY).setSize(widthOfButton, heightOfButton).setImages(imageNula, imageNula_clicked, imageNula).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX,firstY + heightOfButton,successLevels[0],sizeOfStar);

  if (buttonLevel2 != null) {
    buttonLevel2.show();
  } else {
    imageJedan = loadImage("assets/slike/jedan.png");
    imageJedan_clicked = loadImage("assets/slike/jedan_clicked.png");
    buttonLevel2 = cp5.addButton("level2").setCaptionLabel("Broj 1").setValue(1).setPosition(startX + widthOfButton + marginBetween, firstY).setSize(widthOfButton, heightOfButton).setImages(imageJedan, imageJedan_clicked, imageJedan).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + widthOfButton + marginBetween,firstY + heightOfButton,successLevels[1],sizeOfStar);

  if (buttonLevel3 != null) {
    buttonLevel3.show();
  } else {
    imageDva = loadImage("assets/slike/dva.png");
    imageDva_clicked = loadImage("assets/slike/dva_clicked.png");
    buttonLevel3 = cp5.addButton("level3").setCaptionLabel("Broj 2").setValue(2).setPosition(startX + 2*widthOfButton + 2*marginBetween, firstY).setSize(widthOfButton, heightOfButton).setImages(imageDva, imageDva_clicked, imageDva).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + 2*widthOfButton + 2*marginBetween,firstY + heightOfButton,successLevels[2],sizeOfStar);

  if (buttonLevel4 != null) {
    buttonLevel4.show();
  } else {
    imageTri = loadImage("assets/slike/tri.png");
    imageTri_clicked = loadImage("assets/slike/tri_clicked.png");
    buttonLevel4 = cp5.addButton("level4").setCaptionLabel("Broj 3").setValue(3).setPosition(startX + 3*widthOfButton + 3*marginBetween, firstY).setSize(widthOfButton, heightOfButton).setImages(imageTri, imageTri_clicked, imageTri).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + 3*widthOfButton + 3*marginBetween,firstY + heightOfButton,successLevels[3],sizeOfStar);

  if (buttonLevel5 != null) {
    buttonLevel5.show();
  } else {
    imageCetiri = loadImage("assets/slike/cetiri.png");
    imageCetiri_clicked = loadImage("assets/slike/cetiri_clicked.png");
    buttonLevel5 = cp5.addButton("level5").setCaptionLabel("Broj 4").setValue(4).setPosition(startX + 4*widthOfButton + 4*marginBetween, firstY).setSize(widthOfButton, heightOfButton).setImages(imageCetiri, imageCetiri_clicked, imageCetiri).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + 4*widthOfButton + 4*marginBetween,firstY + heightOfButton,successLevels[4],sizeOfStar);

  if (buttonLevel6 != null) {
    buttonLevel6.show();
  } else {
    imagePet = loadImage("assets/slike/pet.png");
    imagePet_clicked = loadImage("assets/slike/pet_clicked.png");
    buttonLevel6 = cp5.addButton("level6").setCaptionLabel("Broj 5").setValue(5).setPosition(startX, secondY).setSize(widthOfButton, heightOfButton).setImages(imagePet, imagePet_clicked, imagePet).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX,secondY + heightOfButton,successLevels[5],sizeOfStar);

  if (buttonLevel7 != null) {
    buttonLevel7.show();
  } else {
    imageSest = loadImage("assets/slike/sest.png");
    imageSest_clicked = loadImage("assets/slike/sest_clicked.png");
    buttonLevel7 = cp5.addButton("level7").setCaptionLabel("Broj 6").setValue(6).setPosition(startX + widthOfButton + marginBetween, secondY).setSize(widthOfButton, heightOfButton).setImages(imageSest, imageSest_clicked, imageSest).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + widthOfButton + marginBetween,secondY + heightOfButton,successLevels[6],sizeOfStar);
  
  if (buttonLevel8 != null) {
    buttonLevel8.show();
  } else {
    imageSedam = loadImage("assets/slike/sedam.png");
    imageSedam_clicked = loadImage("assets/slike/sedam_clicked.png");
    buttonLevel8 = cp5.addButton("level8").setCaptionLabel("Broj 7").setValue(7).setPosition(startX + 2*widthOfButton + 2*marginBetween, secondY).setSize(widthOfButton, heightOfButton).setImages(imageSedam, imageSedam_clicked, imageSedam).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + 2*widthOfButton + 2*marginBetween,secondY + heightOfButton,successLevels[7],sizeOfStar);
  
  if (buttonLevel9 != null) {
    buttonLevel9.show();
  } else {
    imageOsam = loadImage("assets/slike/osam.png");
    imageOsam_clicked = loadImage("assets/slike/osam_clicked.png");
    buttonLevel9 = cp5.addButton("level9").setCaptionLabel("Broj 8").setValue(8).setPosition(startX + 3*widthOfButton + 3*marginBetween, secondY).setSize(widthOfButton, heightOfButton).setImages(imageOsam, imageOsam_clicked, imageOsam).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + 3*widthOfButton + 3*marginBetween,secondY + heightOfButton,successLevels[8],sizeOfStar);
  
  if (buttonLevel10 != null) {
    buttonLevel10.show();
  } else {
    imageDevet = loadImage("assets/slike/devet.png");
    imageDevet_clicked = loadImage("assets/slike/devet_clicked.png");
    buttonLevel10 = cp5.addButton("level10").setCaptionLabel("Broj 9").setValue(9).setPosition(startX + 4*widthOfButton + 4*marginBetween, secondY).setSize(widthOfButton, heightOfButton).setImages(imageDevet, imageDevet_clicked, imageDevet).addListener(new LevelScreenButtonListener());
  }
  drawImageStar(startX + 4*widthOfButton + 4*marginBetween,secondY + heightOfButton,successLevels[9],sizeOfStar);
  
}

void drawImageStar(int x, int y, int modeSuccess, int sizeOfStar){
  if (modeSuccess > 0) {
    image(imgStarFill, x, y, sizeOfStar, sizeOfStar);
  } else {
    image(imgStarEmpty, x, y, sizeOfStar, sizeOfStar);
  }
  if (modeSuccess > 1) {
    image(imgStarFill, x + 10 + sizeOfStar, y, sizeOfStar, sizeOfStar);
  } else {
    image(imgStarEmpty, x + 10 + sizeOfStar, y, sizeOfStar, sizeOfStar);
  }
  if (modeSuccess > 2) {
    image(imgStarFill, x + (10 + sizeOfStar) * 2, y, sizeOfStar, sizeOfStar);
  } else {
    image(imgStarEmpty, x + (10 + sizeOfStar) * 2, y, sizeOfStar, sizeOfStar);
  }
}

class LevelScreenButtonListener implements ControlListener {
  int value;
  public void controlEvent(ControlEvent theEvent) {
    value = (int)theEvent.getController().getValue();
    if (value == -1) {
      goBackToFirstScreen();
    } else{
      removeLevelScreenButton();
      timesAnimate = 1;
      setAnimateScreen(value);
    }
  }
}

void removeLevelScreenButton() {
  backLevel.hide();
  buttonLevel1.hide();
  buttonLevel2.hide();
  buttonLevel3.hide();
  buttonLevel4.hide();
  buttonLevel5.hide();
  buttonLevel6.hide();
  buttonLevel7.hide();
  buttonLevel8.hide();
  buttonLevel9.hide();
  buttonLevel10.hide();

  resetBackground();
}

void goBackToFirstScreen() {
  removeLevelScreenButton();
  setFirstScreen();
}