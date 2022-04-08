import 'package:flutter/material.dart';
import 'package:voodoolist/checkliste.dart';

import 'aufgabe.dart';
import 'main.dart';

class Abhaken extends StatefulWidget {
  late Checkliste checkliste;

  Abhaken(Checkliste liste, {Key? key}) : super(key: key) {
    checkliste = liste;
  }

  @override
  State<Abhaken> createState() => _AbhakenState();
}

class _AbhakenState extends State<Abhaken> {
  var first = true;
  Map<String, bool> values = {};

  @override
  Widget build(BuildContext context) {
    loadData();
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: new AppBar(title: new Text(widget.checkliste.titel)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              heroTag: 'btn1',
              child: Icon(Icons.arrow_back, size: 40),
              elevation: 0,
              onPressed: () {
                first = true;
                //TODO: Checkliste Speichern
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              heroTag: 'btn2',
              child: Icon(Icons.delete_forever, size: 40),
              elevation: 0,
              onPressed: () {
                allData?.remove(widget.checkliste);
                first = true;
                //hier die funktion
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: new ListView(
        children: values.keys.map((String key) {
          return new CheckboxListTile(
            title: new Text(key),
            value: values[key],
            onChanged: (bool? value) {
              setState(() {
                values[key] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  void loadData() {
    if (first) {
      for (Aufgabe aufgabe in widget.checkliste.aufgaben_liste) {
        values[aufgabe.Element] = aufgabe.fertig;
      }
      first = false;
    }
  }
}
