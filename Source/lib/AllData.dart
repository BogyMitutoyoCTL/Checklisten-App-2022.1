import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'checkliste.dart';

class AllData {
  List<Checkliste> checklistenliste = [];

  void addNewChecklist(Checkliste checklist) {
    checklistenliste.add(checklist);
    saveallchecklists();
  }

  void remove(Checkliste checklist) {
    checklistenliste.remove(checklist);
    saveallchecklists();
  }

  Future<void> saveASingleChecklist(Checkliste checkliste, String key) async {
    String checkliststring = jsonEncode(checkliste.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, checkliststring);
  }

  Future<Checkliste?> loadSingleChecklist(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString(key);
    if (name != null) {
      var check = jsonDecode(name);
      var checklist = fromMapToChecklist(check);
      return checklist;
    }
    return null;
  }

  Future<void> saveallchecklists() async {
    var key = "key";
    for (var counter = 0; counter < checklistenliste.length; counter++) {
      await saveASingleChecklist(
          checklistenliste[counter], key + counter.toString());
    }
  }

  Future<void> loadallchecklists() async {
    var key = "key";
    var counter = 0;
    Checkliste? loadSingleChecklist2;
    do {
      loadSingleChecklist2 =
          await loadSingleChecklist(key + counter.toString());

      if (loadSingleChecklist2 != null) {
        checklistenliste.add(loadSingleChecklist2);
      }
      counter++;
    } while (loadSingleChecklist2 != null);
  }
}
