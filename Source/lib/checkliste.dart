import 'dart:convert';

import 'aufgabe.dart';

class Checkliste {
  late String titel;
  late List<Aufgabe> aufgaben_liste;

  Checkliste(String titel, List<Aufgabe> aufgaben_liste) {
    this.titel = titel;
    this.aufgaben_liste = aufgaben_liste;
  }

  Map<String, List<String>> toMap() {
    List<String> value = [];
    for (var aufgaben in this.aufgaben_liste) {
      value.add(jsonEncode(aufgaben));
    }
    return {this.titel: value};
  }
}
