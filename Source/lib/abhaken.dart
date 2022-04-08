import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/checkliste.dart';
import 'aufgabe.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: new AppBar(title: new Text(widget.checkliste.titel)),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: 'kkk',
            child: Icon(Icons.arrow_back, size: 40),
            elevation: 0,
            onPressed: () {
              first = true;
              //TODO: Checkliste Speichern
              Navigator.of(context).pop();
            },
          ),
          FloatingActionButton(
            heroTag: 'kk',
            child: Icon(Icons.delete_forever, size: 40),
            elevation: 0,
            onPressed: () {
              first = true;
              //hier die funktion
              Navigator.of(context).pop();
            },
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
