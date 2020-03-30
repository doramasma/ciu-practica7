import gifAnimation.*;

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput piano;
PFont font1;

int counter = 0;
GifMaker ficherogif;

// Array que contiene las notas desde Do en 4 hasta si 5
String [] notas={"C3", "D3", "E3", "F3", "G3", "A3", "B3", "C4"};
String [] keys1 ={"Q", "W", "E", "R", "T", "Y", "U", "I"};
String [] keys2 ={"Do", "Re", "Mi", "Fa", "Sol", "La", "Si", "Do"};
boolean [] teclas = new boolean[8];
int [] teclasAux = new int [8];

void setup()
{
  size(400, 100);
  font1 = loadFont("OCRAExtended-48.vlw");
  minim = new Minim(this);
  piano = minim.getLineOut();
  
  ficherogif = new GifMaker( this , "animacion.gif") ;
  ficherogif.setRepeat(0);
}

void draw() {
  for (int i=0; i<8; i++) {
    rect(i*50, 0, 50, 100);
    pushStyle();
    textFont(font1, 25);
    fill(0);
    text(keys1[i], i*50+20, 85 );
    popStyle();
    pushStyle();
    textFont(font1, 10);
    fill(0);
    text(keys2[i], i*50+22, 15 );
    popStyle();
  }
  piano();
  counter++;
  if (counter > 5) {
    ficherogif.addFrame();
    counter = 0;
  }
}

void piano() {
  if (teclas[0] == true) {
    pianoAuxiliar(0);
  }
  if (teclas[1] == true) {
    pianoAuxiliar(1);
  }
  if (teclas[2] == true) {
    pianoAuxiliar(2);
  }
  if (teclas[3] == true) {
    pianoAuxiliar(3);
  }
  if (teclas[4] == true) {
    pianoAuxiliar(4);
  }
  if (teclas[5] == true) {
    pianoAuxiliar(5);
  }
  if (teclas[6] == true) {
    pianoAuxiliar(6);
  }
  if (teclas[7] == true) {
    pianoAuxiliar(7);
  }
}

void pianoAuxiliar(int number) {
  if (teclasAux[number] == 0) {
    piano.playNote( 0.0, 0.9, new SineInstrument( Frequency.ofPitch( notas[number] ).asHz() ) );
  }
  pushStyle();
  fill(0);
  rect(number*50, 0, 50, 100);
  popStyle();
  pushStyle();
  fill(255);
  text(keys1[number], number*50+20, 85 );
  popStyle();
  pushStyle();
  textFont(font1, 10);
  fill(255);
  text(keys2[number], number*50+22, 15 );
  popStyle();
  teclasAux[number]++;
} 


void keyPressed() {
  if (key == 'q' || key == 'Q') teclas[0] =true; 
  if (key == 'w' || key == 'W') teclas[1] =true;
  if (key == 'e' || key == 'E') teclas[2] =true;
  if (key == 'r' || key == 'R') teclas[3] =true;
  if (key == 't' || key == 'T') teclas[4] =true;
  if (key == 'y' || key == 'Y') teclas[5] =true;
  if (key == 'u' || key == 'U') teclas[6] =true;
  if (key == 'i' || key == 'I') teclas[7] =true;
}

void keyReleased() {
  if (key == 'q' || key == 'Q') {
    teclas[0] =false; 
    teclasAux[0] = 0;
  }
  if (key == 'w' || key == 'W') {
    teclas[1] =false; 
    teclasAux[1] = 0;
  }
  if (key == 'e' || key == 'E') {
    teclas[2] =false; 
    teclasAux[2] = 0;
  }
  if (key == 'r' || key == 'R') {
    teclas[3] =false; 
    teclasAux[3] = 0;
  }
  if (key == 't' || key == 'T') {
    teclas[4] =false; 
    teclasAux[4] = 0;
  }
  if (key == 'y' || key == 'Y') {
    teclas[5] =false; 
    teclasAux[5] = 0;
  }
  if (key == 'u' || key == 'U') {
    teclas[6] =false; 
    teclasAux[6] = 0;
  }
  if (key == 'i' || key == 'I') {
    teclas[7] =false; 
    teclasAux[7] = 0;
  }
}




class SineInstrument implements Instrument
{
  Oscil wave;
  Line  ampEnv;

  SineInstrument( float frequency )
  {
    // Oscilador sinusoidal con envolvente
    wave   = new Oscil( frequency, 0, Waves.SINE );
    ampEnv = new Line();
    ampEnv.patch( wave.amplitude );
  }

  // Secuenciador de notas
  void noteOn( float duration )
  {
    // Amplitud de la envolvente
    ampEnv.activate( duration, 0.5f, 0 );
    // asocia el oscilador a la salida
    wave.patch( piano );
  }

  // Final de la nota
  void noteOff()
  {
    wave.unpatch( piano );
  }
}
