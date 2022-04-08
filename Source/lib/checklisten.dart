import 'package:flutter/material.dart';
import 'package:voodoolist/abhaken.dart';

import 'alert_klasse.dart';
import 'checkliste.dart';
import 'creation.dart';
import 'main.dart';
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

  void buttoncreation() {
    checklistenliste = allData!.checklistenliste;
    Checklistenbutton.clear();
    for (var checkliste in checklistenliste) {
      var button = TextButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Abhaken(checkliste)));
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(checkliste.titel, style: TextStyle(fontSize: 20)),
                  ],
                ))
          ]));
      Checklistenbutton.add(button);
    }
  }

  @override
  Widget build(BuildContext context) {
    buttoncreation();
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
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Settingswitch()))
                    .then((value) => setState(() {}));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Creation()))
                .then((value) => setState(() {}));
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
