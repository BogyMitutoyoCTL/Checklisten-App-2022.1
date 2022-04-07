import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'checkliste.dart';

class AllData {
  List<Checkliste> checklistenliste = [];
  var key = 'key';
  void addNewChecklist(Checkliste checklist) {
    checklistenliste.add(checklist);
    saveallchecklists();
  }

  void saveasinglechecklist(Checkliste checkliste) async {
    String checkliststring = jsonEncode(checkliste.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, checkliststring);
  }

  Future<Checkliste?> loadSingleChecklist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString(key);
    if (name != null) {
      var check = jsonDecode(name);
      var checklist = fromMapToChecklist(check);
      return checklist;
    }
    return null;
  }

  void saveallchecklists() {}
  void loadallchecklists() {}
}
