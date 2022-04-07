import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/abhaken.dart';

import 'alert_klasse.dart';
import 'checkliste.dart';
import 'creation.dart';
import 'settings_switch.dart';

class Checklisten extends StatefulWidget {
  const Checklisten({Key? key}) : super(key: key);

  @override
  State<Checklisten> createState() => _ChecklistenState();
}

class _ChecklistenState extends State<Checklisten> {
  var key = 'key';
  List<TextButton> Checklistenbutton = [];
  List<Checkliste> checklistenliste = [];

  _ChecklistenState() {
    getData();
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    checklistenliste.clear();
    var name = prefs.getString(key);
    if (name != null) {
      var check = jsonDecode(name);
      var checklist = fromMapToChecklist(check);
      checklistenliste.add(checklist);
    }
    buttoncreation();
    setState(() {});
  }

  void buttoncreation() {
    Checklistenbutton.clear();
    for (var checkliste in checklistenliste) {
      if (checkliste.titel != '') {
        var button = TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Abhaken(checkliste)));
          },
          child: Text(checkliste.titel),
        );
        Checklistenbutton.add(button);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Meldung,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Checklisten'),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Settingswitch()));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Creation()))
                .then((value) => getData());
          },
          child: Icon(Icons.add, size: 30),
          foregroundColor: Colors.white,
          elevation: 10,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: Checklistenbutton,
          ),
        ),
      ),
    );
  }

  Future<bool> Meldung() async {
    var warnSignal = AlertButton();
    return await warnSignal.beforeExit(context);
  }
}
