import 'dart:convert';

import 'aufgabe.dart';

class Checkliste {
  late String titel;
  List<Aufgabe> aufgaben_liste = [];
  late List<bool> value;

  Checkliste(String titel) {
    this.titel = titel;
  }

  void addNewTask(String element) {
    aufgaben_liste.add(Aufgabe(false, element));
  }

  void addTask(Aufgabe aufgabe) {
    aufgaben_liste.add(aufgabe);
  }

  void checklistenReset() {
    for (var i = 0; i < aufgaben_liste.length; i++) {
      aufgaben_liste[i].fertig = false;
    }
  }

  Map<String, List<String>> toMap() {
    List<String> value = [];
    for (var aufgaben in this.aufgaben_liste) {
      value.add(jsonEncode(aufgaben));
    }

    return {this.titel: value};
  }
}

Checkliste fromMapToChecklist(var map) {
  var checkliste_name = map.keys.first;
  var checkliste_eintraege = map[checkliste_name];

  var checkliste = new Checkliste(checkliste_name);
  for (String json in checkliste_eintraege) {
    var aufgabe = jsonDecode(json);
    var fertig = aufgabe["fertig"];
    var beschreibung = aufgabe["Element"];
    checkliste.addTask(Aufgabe(fertig, beschreibung));
  }

  return checkliste;
}
