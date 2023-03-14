class Frage
{
  String frage;
  String[] antwort;
  color[] antwortFarben;
  int richtig;
  int gewinn;
  Frage(String frage1, String[] antworten1, int richtig1, int geld)
  {
    frage = frage1;
    antwort = antworten1;
    //antwortFarben = new color[]{0x000000, 0x000000, 0x000000, 0x000000};
    antwortFarben = new color[]{0xFFFFFF, 0xFFFFFF, 0xFFFFFF, 0xFFFFFF};
    richtig = richtig1;
    gewinn = geld;
  }
  String gibFrage()
  {
    return frage;
  }
  String[] gibAntworten()
  {
    return antwort;
  }
  color[] gibAntwortFarben()
  {
    return antwortFarben;
  }
  String gibAntwort(int antwort1)
  {
    return antwort[antwort1];
  }
  void setzeAntwortFarbe(int antwort, color farbe)
  {
    antwortFarben[antwort] = farbe;
  }
  boolean istRichtig(int antwort)
  {
    if (antwort == richtig) return true;
    else return false;
  }
  String gibRichtigeAntwort()
  {
    return antwort[richtig - 1];
  }
  int gibRichtigeAntwortIndex()
  {
    return richtig - 1;
  }
  int gibGewinn()
  {
    return gewinn;
  }
}
