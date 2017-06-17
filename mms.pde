import ddf.minim.*;
import processing.sound.*;
import controlP5.*;

ControlP5 cp5;    //library za buttone
Status currentStatus;     // varijable za trenutni screen
int currentLevel;     // varijabla za odabrabi level na level screenu
int widthOfStroke = 2;     // sirina stroka

int isUserDrawing = 0;     // ako user klikne i drzi misa (u drawing screenu) onda je 1 i tad se crta stroke kako se mis pomice, i kad pusti tipku misa opet je 0
int isSoundOn = 1;       // za gasenje i paljenje zvuka

PImage imgStarEmpty;  
PImage imgStarFill;
PImage pozadina;
PImage razine;
PImage razine_clicked;
PImage imageGame;
PImage imageGame_clicked;
PImage imageNazad;
PImage imageNazad_clicked;
PImage imageGotovo;
PImage imageGotovo_clicked;
PImage imageGotovo_clear;
PImage imagePonovno;
PImage imagePonovno_clicked;
PImage imageSljedece_clicked;
PImage imageSljedece;
PImage imagePreskoci;
PImage imagePreskoci_clicked;
PImage soundOnImage;
PImage soundOffImage;
PImage soundClearBackgroundImage;
//SoundFile correctSound;
//SoundFile wrongSound;
Minim minim;     //library za zvuk
AudioPlayer correctSound;
AudioPlayer wrongSound;

AudioPlayer numberSound;

Button buttonSound;

PFont font;

void setup() {

  //fullScreen();
  size(800, 600);
  background(255);
  cp5 = new ControlP5(this);     //incijaliziramo library za buttone
  currentStatus = Status.FIRST_SCREEN;    //inicijaliziramo status - firstscreen
  setUpDataManager();  
  imgStarEmpty = loadImage("assets/slike/star_empty.PNG");
  imgStarFill = loadImage("assets/slike/star_filled.PNG");
  pozadina = loadImage("assets/slike/pozadina.jpg");
  imageNazad = loadImage("assets/slike/nazad.png");
  imageNazad_clicked = loadImage("assets/slike/nazad_clicked.png");
  imageGotovo = loadImage("assets/slike/gotovo.png");
  imageGotovo_clicked = loadImage("assets/slike/gotovo_clicked.png");
  imageGotovo_clear = loadImage("assets/slike/gotovo_background.png");
  imagePonovno = loadImage("assets/slike/ponovno.png");
  imagePonovno_clicked = loadImage("assets/slike/ponovno_clicked.png");
  imageSljedece = loadImage("assets/slike/sljedece.png");
  imageSljedece_clicked = loadImage("assets/slike/sljedece_clicked.png");
  imagePreskoci = loadImage("assets/slike/preskoci.png");
  imagePreskoci_clicked = loadImage("assets/slike/preskoci_clicked.png");
  //correctSound = new SoundFile(this, "correct.mp3");
  //wrongSound = new SoundFile(this, "wrong.mp3");
  soundOnImage = loadImage("assets/slike/sound_on.png");
  soundOffImage = loadImage("assets/slike/sound_off.png");
  soundClearBackgroundImage = loadImage("assets/slike/sound_clear_background.png");

  minim = new Minim(this);    //inicijaliziranje library za zvukove
  correctSound = minim.loadFile("correct.mp3");
  wrongSound = minim.loadFile("wrong.mp3");

  font = createFont("assets/mms5.ttf",16); 

  image(pozadina, 0, 0, width, height);
  
  setFirstScreen();
  addSoundOnOff();
}

void draw() {

  if (currentStatus == Status.ANIMATE_SCREEN) {
    onDrawingInAnimateScreen();
  }else if (currentStatus == Status.DRAWING_SCREEN) {
    onDrawingInDrawingScreen();
  }else if(currentStatus == Status.GAME_SCREEN){
    drawGame();
  }
}

void resetBackground() {
  background(255);
  image(pozadina, 0, 0, width, height);
}

enum Status
{
  FIRST_SCREEN, LEVEL_SCREEN, ANIMATE_SCREEN, DRAWING_SCREEN, GAME_SCREEN
};

void mouseDragged() {
  if (currentStatus == Status.DRAWING_SCREEN) {
    isUserDrawing = 1;
  }
}
void mouseReleased() {
  if (currentStatus == Status.DRAWING_SCREEN) {
    isUserDrawing = 0;
  }
}

void playSound(AudioPlayer file){
  if(isSoundOn == 1){
    //file.play();
    file.play();
    file.rewind();
  }
}

void addSoundOnOff(){    //dodavanje sound buttona na screen
  if (buttonSound != null) {
    buttonSound.show();
  } else {
    buttonSound = cp5.addButton("sound_button").setCaptionLabel("Sound").setValue(1).setPosition(width - 20 - 32, 20).setSize(32, 32).setImage(soundOnImage).addListener(new SoundOnOffButtonListener());
  }
}

class SoundOnOffButtonListener implements ControlListener {
  int value;
  public void controlEvent(ControlEvent theEvent) {
    value = (int)theEvent.getController().getValue();
    if (value == 1) {
      image(soundClearBackgroundImage, width - 20 - 32, 20);
      if(isSoundOn == 0){
        buttonSound.setImage(soundOnImage);
        isSoundOn = 1;
      }else{
        buttonSound.setImage(soundOffImage);
        isSoundOn = 0;
      }
      buttonSound.show();
    } 
  }
}

class Cordinate{
  public float x;
  public float y;
  public Cordinate(float x, float y){
    this.x = x;
    this.y = y;
  }
}