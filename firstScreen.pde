Button buttonFirstScreen1;
Button buttonFirstScreen2;

void setFirstScreen() {
  
  if(razine == null){
    razine = loadImage("assets/slike/razine.png");
  }
  if(razine_clicked == null){
    razine_clicked = loadImage("assets/slike/razine_clicked.png");
  }
  
  if(imageGame == null){
    imageGame = loadImage("assets/slike/game.png");
  }
  if(imageGame_clicked == null){
    imageGame_clicked = loadImage("assets/slike/game_clicked.png");
  }

  int halfScreen = height / 2;
  int heightOfButton = halfScreen / 2;
  int marginBetween = heightOfButton * 20 / 100;
  int yPositionFirst = halfScreen - heightOfButton - marginBetween - 50;
  int xPosition = width * 10 / 100;
  int widthOfButton = width - xPosition * 2;
  int yPositionSecond = halfScreen + marginBetween - 50;

  if (buttonFirstScreen1 != null) {
    buttonFirstScreen1.show();
  } else {
    buttonFirstScreen1 = cp5.addButton("startScreenButton1").setCaptionLabel("Razine").setValue(1).setPosition(xPosition, yPositionFirst).setSize(widthOfButton, heightOfButton).setImages(razine, razine_clicked, razine_clicked).addListener(new FirstScreenButtonListener());
  }
  if (buttonFirstScreen2 != null) {
    buttonFirstScreen2.show();
  } else {
    buttonFirstScreen2 = cp5.addButton("startScreenButton2").setValue(2).setPosition(xPosition, yPositionSecond).setSize(widthOfButton, heightOfButton).setImages(imageGame, imageGame_clicked, imageGame).addListener(new FirstScreenButtonListener());
  }
}

class FirstScreenButtonListener implements ControlListener {
  int value;
  public void controlEvent(ControlEvent theEvent) {
    value = (int)theEvent.getController().getValue();
    if (value == 1) {
      startLevelButton();
    } else if (value == 2) {
      removeStartScreenButton();
      setupGame();
      currentStatus = Status.GAME_SCREEN;
    }
  }
}

void removeStartScreenButton() {
  buttonFirstScreen1.hide();
  buttonFirstScreen2.hide();
  resetBackground();
}

void startLevelButton() {
  removeStartScreenButton();
  setLevelScreen();
}