import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'checkliste.dart';

class AllData {
  late SharedPreferences prefs;

  Future<void> initInstance() async {
    prefs = await SharedPreferences.getInstance();
  }

  List<Checkliste> checklistenliste = [];

  void addNewChecklist(Checkliste checklist) {
    checklistenliste.add(checklist);
    saveallchecklists();
  }

  Future<void> remove(Checkliste checklist) async {
    checklistenliste.remove(checklist);
    await saveallchecklists();
  }

  Future<void> saveASingleChecklist(Checkliste checkliste, String key) async {
    String checkliststring = jsonEncode(checkliste);
    await prefs.setString(key, checkliststring);
  }

  Future<Checkliste?> loadSingleChecklist(String key) async {
    var json = await prefs.getString(key);
    if (json != null) {
      var map = jsonDecode(json);
      return Checkliste.fromJson(map);
    }
    return null;
  }

  Future<void> saveallchecklists() async {
    await removeallchecklists();
    var key = "key";
    List<MapEntry<String, Checkliste>> zuordnung = [];
    for (var counter = 0; counter < checklistenliste.length; counter++) {
      zuordnung
          .add(MapEntry(key + counter.toString(), checklistenliste[counter]));
    }

    for (MapEntry<String, Checkliste> pair in zuordnung) {
      await saveASingleChecklist(pair.value, pair.key);
    }
  }

  Future<void> removeallchecklists() async {
    var keys = prefs.getKeys();
    for (var key in keys) {
      if (key.startsWith("key")) await prefs.remove(key);
    }
  }

  Future<void> loadallchecklists() async {
    checklistenliste = [];
    var keys = prefs.getKeys();
    for (var key in keys) {
      if (key.startsWith("key")) {
        Checkliste? loadSingleChecklist2 = await loadSingleChecklist(key);
        if (loadSingleChecklist2 != null) {
          checklistenliste.add(loadSingleChecklist2);
        }
      }
    }
  }
}
