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
    save();
  }

  Future<void> removeallchecklists() async {
    var keys = prefs.getKeys();
    for (var key in keys) {
      if (key.startsWith("key")) await prefs.remove(key);
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
