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

Checkliste fromMapToChecklist(var checkliste_as_string) {
  var key_in_klammern = checkliste_as_string.keys.toString();
  var checkliste_name =
      key_in_klammern.substring(1, key_in_klammern.length - 1);

  var checklist_as_map = checkliste_as_string[checkliste_name];

  var checkliste = new Checkliste(checkliste_name);
  for (String aufgabe_as_map in checklist_as_map) {
    var fertig = false;
    var element_from_aufgabe;
    if (aufgabe_as_map.substring(10, 11) == 't') {
      fertig = true;
      element_from_aufgabe =
          aufgabe_as_map.substring(26, aufgabe_as_map.length - 2);
    } else {
      element_from_aufgabe =
          aufgabe_as_map.substring(27, aufgabe_as_map.length - 2);
    }
    checkliste.addTask(Aufgabe(fertig, element_from_aufgabe));
  }

  return checkliste;
}
