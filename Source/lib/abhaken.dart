import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/checkliste.dart';

import 'creation.dart';
import 'package:flutter/material.dart';

class Abhaken extends StatefulWidget {
  const Abhaken({Key? key}) : super(key: key);

  @override
  State<Abhaken> createState() => _AbhakenState();
}

class _AbhakenState extends State<Abhaken> {
  List<Widget> texte = [];

  @override
  Widget build(BuildContext context) {
    elementErstellen();
    return Scaffold(
      appBar: AppBar(title: Text("ChecklistenName")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: texte,
        ),
      ),
    );
  }

  elementErstellen() async {
    List<Checkliste> checklisten = [];
    var prefs = await SharedPreferences.getInstance();
    var text = prefs.getString("Element");
    texte.add(Text(
      text ?? "default",
      style: TextStyle(color: Colors.red),
    ));
    for (var i = 0; i < checklisten.length; i++) {
      for (var n = 0; n < checklisten.length; n++) {
        //List checklisten[n] = await SharedPreferences.getInstance();

      }
      setState(() {});
    }
  }

  void elementGeandert(String value) {}
}
