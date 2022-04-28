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

  Map<String, dynamic> toJson() {
    return {"titel": this.titel, "aufgaben": this.aufgaben_liste};
  }

  Checkliste.fromJson(Map<String, dynamic> json)
      : titel = json["titel"],
        aufgaben_liste = List<Aufgabe>.from(
            json["aufgaben"].map((json) => Aufgabe.fromJson(json)));
}
