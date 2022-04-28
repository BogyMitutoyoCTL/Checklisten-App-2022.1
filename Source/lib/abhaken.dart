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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: new AppBar(
          automaticallyImplyLeading: false,
          title: new Text(widget.checkliste.titel)),
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
                save();
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
                allData.remove(widget.checkliste);
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
      body: new ListView(
        children: widget.checkliste.aufgaben_liste.map((Aufgabe aufgabe) {
          return new CheckboxListTile(
            title: new Text(aufgabe.Element),
            value: aufgabe.fertig,
            onChanged: (bool? value) {
              setState(() {
                aufgabe.fertig = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }

  void save() {
    allData.save();
  }
}
