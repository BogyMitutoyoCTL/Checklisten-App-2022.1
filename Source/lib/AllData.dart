import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'checkliste.dart';

class AllData {
  late SharedPreferences prefs;
  bool firstStart = true;
  int themeWahl = 2;
  String language = "en";
  List<Checkliste> checklistenliste = [];

  void initInstance(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  void addNewChecklist(Checkliste checklist) {
    checklistenliste.add(checklist);
    save();
  }

  void remove(Checkliste checklist) {
    checklistenliste.remove(checklist);
    save();
  }

  Future<void> clearAllSavedData() async {
    var keys = prefs.getKeys();
    for (var key in keys) {
      await prefs.remove(key);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "firstStart": firstStart,
      "themeWahl": themeWahl,
      "language": language,
      "checklisten": checklistenliste,
    };
  }

  AllData() {}

  AllData.fromJson(Map<String, dynamic> json)
      : firstStart = json["firstStart"],
        themeWahl = json["themeWahl"],
        language = json["language"],
        checklistenliste = List<Checkliste>.from(
            json["checklisten"].map((json) => Checkliste.fromJson(json)));

  void save() {
    prefs.setString("allData", jsonEncode(this));
  }
}
