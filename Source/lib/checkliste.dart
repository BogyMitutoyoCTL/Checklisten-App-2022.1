import 'aufgabe.dart';

class Checkliste {
  late String titel;
  late List<Aufgabe> aufgaben_liste;

  Checkliste(String titel, List<Aufgabe> aufgaben_liste) {
    this.titel = titel;
    this.aufgaben_liste = aufgaben_liste;
  }
}