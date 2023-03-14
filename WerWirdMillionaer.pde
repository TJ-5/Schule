import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import processing.video.*;
PImage img;

//Movie myMovie;

enum Anzeige {
  JOKER, FRAGE, WARTEN, AUSWERTUNG
}

ArrayList<Frage> alleFragen = new ArrayList<>();

/*
int[] prizeMoney = {
 64000,
 125000,
 500000,
 1000000
 };
 */

Anzeige a;
int frageIndex;
int score = 0;
int money = 0;
boolean fiftyFifty = true;
boolean call = true;
boolean publikum = true;





void setup() {

  size(1000, 800);
  video = new Movie(this, "intro.mp4");
  video. play() ;
  //delay(1000000);

  img = loadImage("overlay.png");

  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  textSize(20);
  noStroke();

  a = Anzeige.FRAGE;
  alleFragen.add(new Frage("Welchen Brauch pflegt man in der walpurgisnacht?", new String[]{"Sing in den März", "Rock in den April", "Tanz in den Mai", "Jam in den Juni"}, 3, 50));
  alleFragen.add(new Frage("Statt 'Verschwinde!' sagt man auch salopp 'Mach dich vom ...!'", new String[]{"Acker", "Rasen", "Garten", "Spielplatz"}, 1, 100));
  alleFragen.add(new Frage("Gärtner wissen: Viele Platzen mögen keine ...?", new String[]{"verwehten Haare", "kalten Popos", "nassen Füße", "blau gefrorene Hände"}, 3, 200));
  alleFragen.add(new Frage("Redensartlich kann keiner ...?", new String[]{"aus seiner Haut", "mit seiner Frau", "in seinen 4 Wänden", "unter seinem Niveau"}, 1, 300));
  alleFragen.add(new Frage("Wer eloquent ist, kann sich gut...?", new String[]{"schminken", "verstecken", "orientieren", "ausdrücken"}, 4, 500));
  alleFragen.add(new Frage("Was ist vor allem an Jacken und Mänteln zu finden?", new String[]{"Handschellenärmel", "Fesselkragen", "Kettenfutter", "Knebelknöpfe"}, 4, 1000));
  alleFragen.add(new Frage("Was gibt es u.a. in den Größen CR1025, CR1616, CR2032, CR2354 und CR2477 zu kaufen?", new String[]{"Knopfzellen", "Druckerpatronen", "Rasierklingen", "Staubsaugerbeutel"}, 1, 2000));
  alleFragen.add(new Frage("Opernstar ANna Netrebko was liiert mit dem ...?", new String[]{"Mist", "Plunder", "Ramsch", "Schrott"}, 4, 4000));
  alleFragen.add(new Frage("Der Brite Benedict Cumerbatch gehört zu den derzeit angesagtesten ...?", new String[]{"Fußballern", "Schauspielern", "Fernsehköchen", "Bestsellerautoren"}, 2, 8000));
  alleFragen.add(new Frage("Die TV-Abenteuer des Raumschiffs Enterprise beginnen mit den kultverdächtigen Worten 'Der Weltraum -...?'", new String[]{"unzählige Sterne", "unglaubliche Ferne", "unendliche Weiten", "unfassbar viel Schrott"}, 3, 16000));
  alleFragen.add(new Frage("Mit welhem Film lieferte Rapper Eminem sein Kinodebüt als Schauspieler?", new String[]{"The One", "8 Mile", "Super Troppers", "Blood Work"}, 2, 32000));
}

void draw() {

  background(100);
  image(img, 0, 0);
  
  switch (a) {
  case FRAGE:
    fill(0);
    text(alleFragen.get(frageIndex).gibGewinn() + "€ Frage: " + alleFragen.get(frageIndex).gibFrage(), width / 2, (height) - (height / 7) - (height / 8), width, height / 4);
    fill(red(alleFragen.get(frageIndex).gibAntwortFarben()[0]), green(alleFragen.get(frageIndex).gibAntwortFarben()[0]), blue(alleFragen.get(frageIndex).gibAntwortFarben()[0]));
    text("1: " + alleFragen.get(frageIndex).gibAntwort(0), (width / 2) - (width / 4), (height) - (height / 3.3) + (height / 8), width / 2, height / 4);
    fill(red(alleFragen.get(frageIndex).gibAntwortFarben()[1]), green(alleFragen.get(frageIndex).gibAntwortFarben()[1]), blue(alleFragen.get(frageIndex).gibAntwortFarben()[1]));
    text("2: " + alleFragen.get(frageIndex).gibAntwort(1), (width / 2) + (width / 4), (height) - (height / 3.3) + (height / 8), width / 2, height / 4);
    fill(red(alleFragen.get(frageIndex).gibAntwortFarben()[2]), green(alleFragen.get(frageIndex).gibAntwortFarben()[2]), blue(alleFragen.get(frageIndex).gibAntwortFarben()[2]));
    text("3: " + alleFragen.get(frageIndex).gibAntwort(2), (width / 2) - (width / 4), (height / 2) + (height / 2) - (height / 8), width / 2, height / 4);
    fill(red(alleFragen.get(frageIndex).gibAntwortFarben()[3]), green(alleFragen.get(frageIndex).gibAntwortFarben()[3]), blue(alleFragen.get(frageIndex).gibAntwortFarben()[3]));
    text("4: " + alleFragen.get(frageIndex).gibAntwort(3), (width / 2) + (width / 4), (height / 2) + (height / 2) - (height / 8), width / 2, height / 4);
    fill(0);
    text("'1', '2', '3' oder '4' auswählen\n'0' für Joker", width / 2, (height / 2) + (height / 4) + (height / 8), width, height / 4);
    break;
  case JOKER:
    text("'1' für 50/50 Joker\n'2' für Anrufen", width / 2, height / 2, width, height);
    break;
  case WARTEN:
    text("Sie haben insgesamt " + score + " Frage(n) richtig beantwortet und dadurch " + money + "€ gewonnen!\n'n' für die nächste Frage", width / 2, height / 2, width, height);
    break;
  case AUSWERTUNG:
    text("Insgesamt: " + money + "€.", width / 2, height / 2, width, height);
    break;
  }
  if (video.available()) {
    video.read();
    image(video, 0, 0, width, height);
  }
}

void keyPressed() {
  switch (a) {
  case FRAGE:
    switch (keyCode) {
    case 48: // = 0
      a = Anzeige.JOKER;
      break;
    case 49: // = 1
    case 50: // = 2
    case 51: // = 3
    case 52: // = 4
      if (alleFragen.get(frageIndex).istRichtig(keyCode - 48) == true) beantworteFrage(true);
      else beantworteFrage(false);
      break;
    }
    break;
  case JOKER:
    switch (keyCode) {
    case 49: // = 1
      if (fiftyFifty == true)
      {
        fiftyFifty = false;
        alleFragen.get(frageIndex).setzeAntwortFarbe(alleFragen.get(frageIndex).gibRichtigeAntwortIndex(), 0x007CFF);
        alleFragen.get(frageIndex).setzeAntwortFarbe((alleFragen.get(frageIndex).gibRichtigeAntwortIndex() + int(random(1, 4))) % 4, 0x007CFF);
      }
      a = Anzeige.FRAGE;
      break;
    case 50: // = 2
      if (call == true)
      {
        call = false;
        alleFragen.get(frageIndex).setzeAntwortFarbe(alleFragen.get(frageIndex).gibRichtigeAntwortIndex(), 0x00FF00);
      }
      a = Anzeige.FRAGE;
      break;
    }
    break;
  case WARTEN:
    switch (keyCode) {
    case 78: // 'n'
      a = Anzeige.FRAGE;
      break;
    }
  case AUSWERTUNG:
    break;
  }
}

void beantworteFrage(boolean richtig) {
  if (richtig == true) {
    score++;
    money += alleFragen.get(frageIndex).gibGewinn();
    a = Anzeige.WARTEN;
  } else {
    if (money < 500) {
      money = 0;
    } else if (money < 64000) {
      money = 500;
    }
    a = Anzeige.AUSWERTUNG;
  }
  frageIndex++;
}
