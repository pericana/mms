PImage img;

Button backGame;
Button buttonKreniGame;
Button buttonNextGame;
Button buttonTryAgainGame;
Button buttonIzadjiGame;

PImage imgKreniButton;
PImage imgKreniButton_clicked;
PImage imgNextButton;
PImage imgNextButton_clicked;
PImage imgPonovnoButton;
PImage imgPonovnoButton_clicked;
PImage imgIzadjiButton;
PImage imgIzadjiButton_clicked;

int score;
int currentPosition;
char odabranoSlovo;
ArrayList<Slika> slike;

int statusGame = -1;

void setupGame() {   
  score = 0;
  resetBackground();
  
  imgKreniButton = loadImage("assets/slike/kreni.png");
  imgKreniButton_clicked = loadImage("assets/slike/kreni_clicked.png");
  imgNextButton = loadImage("assets/slike/next_game.PNG");
  imgNextButton_clicked = loadImage("assets/slike/next_game_clicked.PNG");
  imgPonovnoButton = loadImage("assets/slike/pokusaj_ponovno.png");
  imgPonovnoButton_clicked = loadImage("assets/slike/pokusaj_ponovno_clicked.png");
  imgIzadjiButton = loadImage("assets/slike/izadji.png");
  imgIzadjiButton_clicked = loadImage("assets/slike/izadji_clicked.png");
  
  if (backGame != null) {
    backGame.show();
  } else {
    backGame = cp5.addButton("back_game").setCaptionLabel("Nazad").setValue(-1).setPosition(20, 29).setSize(80, 30).setImages(imageNazad, imageNazad_clicked, imageNazad).addListener(new GameScreenButtonListener());
  }
  
  if (buttonKreniGame != null) {
    buttonKreniGame.show();
  } else {
    buttonKreniGame = cp5.addButton("game_kreni").setCaptionLabel("Kreni").setValue(1).setPosition(300, 400).setSize(200, 50).setImages(imgKreniButton, imgKreniButton_clicked, imgKreniButton).addListener(new GameScreenButtonListener());
  }
  
}

class GameScreenButtonListener implements ControlListener {
  int value;
  public void controlEvent(ControlEvent theEvent) {
    value = (int)theEvent.getController().getValue();
    if (value == -1) {
      goBackToFirstScreenFromGame();
      statusGame = -1;
    } else if (value == 1){
      pokreniIgru();
    } else if (value == 2){
      statusGame = 0;
      getRandom();
    } else if (value == 3){
      removeGameScreenButton();
      statusGame = -1;
      buttonKreniGame.show();
    }
  }
}

void pokreniIgru(){
  removeGameScreenButton();
  ispuniListu();
  score = 0;
  getRandom();
  statusGame = 0;
}

void goBackToFirstScreenFromGame() {
  currentStatus = Status.FIRST_SCREEN;
  removeGameScreenButton();
  setFirstScreen();
}

void removeGameScreenButton() {
  backGame.hide();
  buttonKreniGame.hide();
  if(buttonNextGame != null) buttonNextGame.hide();
  if(buttonTryAgainGame != null) buttonTryAgainGame.hide();
  if(buttonIzadjiGame != null) buttonIzadjiGame.hide();
  resetBackground();
}

void drawGame() {
  
  resetBackground();
  
  if (statusGame == -1){
    // početni screen
    textFont(font);
    textSize(40);
    textAlign(CENTER);
    text("Pritisnite broj koji opisuje koliko je objekata na slici.", 100, 150, 600, 160);
    return;
  }else if(statusGame == 1){
    //sljedeći button
    if (buttonNextGame != null) {
       buttonNextGame.show();
    } else {
      buttonNextGame = cp5.addButton("game_next").setCaptionLabel("Sljedeće").setValue(2).setPosition(460, 400).setSize(160, 50).setImages(imgNextButton, imgNextButton_clicked, imgNextButton).addListener(new GameScreenButtonListener());
    }
    stroke(255);
    textSize(20);
    textAlign(CENTER);
    text("Bravo, pametna glavo!!!", 470, 125, 140, 50);
    textSize(180);
    text("" + odabranoSlovo, 470, 175, 140, 200);
  }else if(statusGame == 2){
    //kraj igre
    if (buttonTryAgainGame != null) {
      buttonTryAgainGame.show();
    } else {
      buttonTryAgainGame = cp5.addButton("game_again").setCaptionLabel("Pokušaj ponovo").setValue(3).setPosition(100, 415).setSize(250, 50).setImages(imgPonovnoButton, imgPonovnoButton_clicked, imgPonovnoButton).addListener(new GameScreenButtonListener());
    }
    
    if (buttonIzadjiGame != null) {
      buttonIzadjiGame.show();
    } else {
      buttonIzadjiGame = cp5.addButton("game_izadji").setCaptionLabel("Izadji").setValue(-1).setPosition(450, 415).setSize(250, 50).setImages(imgIzadjiButton, imgIzadjiButton_clicked, imgIzadjiButton).addListener(new GameScreenButtonListener());
    }
    
    String sMessage;
    int xTop = 45;
    if(score <= 0){
       xTop = 70;
       sMessage = "Moglo je to puno bolje, \n vrati se kad budeš dobre volje! \n\n Bodovi: " + score;
    }else if(score > 0 && score < 400){
       xTop = 100;
       sMessage = "Nisi bio loš, \n ali provježbaj brojeve još!! \n\n Bodovi: " + score;
    }else{
       xTop = 70;
       sMessage = "Sve brojeve savršeno znaš, \n u ovoj igri ti si super baš!!! \n\n Bodovi: " + score;
    }
    stroke(255);
    textAlign(CENTER);
    textSize(40);
    text(sMessage, 100, xTop, 600, 300);
    return;
  } 
  
  stroke(255);
  fill(255, 255, 255);
  rect(20, 30, 420, 420);
  image(img, 30, 40, 400, 400);
  textSize(20);
  textAlign(LEFT);
  text("Bodovi: " + score, 470, 45, 160, 30);
}

void getRandom(){
  if(slike.size() == 0){
    statusGame = 2;
    if(buttonNextGame != null){
      buttonNextGame.hide();
    }
    return;
  }
  currentPosition = (int)random(0, slike.size());
  Slika slika = slike.get(currentPosition);
  img = loadImage(slika.pathOfImage);
}

void keyPressed() {
  if(statusGame != 0){
    return;
  }
  boolean isCorrect = true;
  Slika slika = slike.get(currentPosition);
  if(key == slika.broj) {
    score = score + 100;
  }
  else
  {
    isCorrect = false;
    score = score - 50;
  }
  
  if(isCorrect){
    odabranoSlovo = key;
    slike.remove(currentPosition);
    statusGame = 1;
    playSound(correctSound);
  }else{
    playSound(wrongSound);
  }
}

class Slika{
char broj;
String pathOfImage;

  Slika(char a , String path){
    broj=a;
    pathOfImage = path;
  }
}

void ispuniListu(){
  slike = new ArrayList();
  slike.add(new Slika('1',  "assets/brojevi/1.jpg"));
  slike.add(new Slika('2',  "assets/brojevi/2.png"));
  slike.add(new Slika('3',  "assets/brojevi/3.jpg"));
  slike.add(new Slika('4',  "assets/brojevi/4.png"));
  slike.add(new Slika('6',  "assets/brojevi/6.png"));
  slike.add(new Slika('5',  "assets/brojevi/5.jpg"));
  slike.add(new Slika('7',  "assets/brojevi/7.jpg"));
  slike.add(new Slika('8',  "assets/brojevi/8.jpg"));
  slike.add(new Slika('9',  "assets/brojevi/9.jpg")); 
  
}