import 'dart:convert';

import 'package:voodoolist/checkliste.dart';

class Aufgabe {
  late bool fertig;
  late String Element;

  Aufgabe(this.fertig, this.Element);

  Aufgabe.fromJson(Map<String, dynamic> json)
      : fertig = json['fertig'],
        Element = json['Element'];

  Map<String, dynamic> toJson() => {'fertig': fertig, 'Element': Element};
}

void main() {
  Checkliste checklist = new Checkliste(
      "namedercheckliste", [Aufgabe(false, "Element"), Aufgabe(true, "nio")]);
  String encodedAufgabe = jsonEncode(checklist.toMap());
  Map<String, dynamic> decodedAufgabe = jsonDecode(encodedAufgabe);

  var key_in_klammern = decodedAufgabe.keys.toString();
  var checkliste_name =
      key_in_klammern.substring(1, key_in_klammern.toString().length - 1);

  var checklist_as_map = decodedAufgabe[checkliste_name];
  List<Aufgabe> aufgaben_liste = [];

  for (String aufgabe_as_map in checklist_as_map) {
    var fertig = false;
    var element_from_aufgabe;
    if (aufgabe_as_map.contains('true')) {
      fertig = true;
      element_from_aufgabe =
          aufgabe_as_map.substring(26, aufgabe_as_map.length - 2);
    } else {
      element_from_aufgabe =
          aufgabe_as_map.substring(27, aufgabe_as_map.length - 2);
    }
    aufgaben_liste.add(Aufgabe(fertig, element_from_aufgabe));
  }
  var c = new Checkliste(checkliste_name, aufgaben_liste);
}
