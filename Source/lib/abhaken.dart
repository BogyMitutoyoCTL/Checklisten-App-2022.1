import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/checkliste.dart';

class Abhaken extends StatefulWidget {
  late Checkliste checkliste;
  Abhaken(Checkliste liste, {Key? key}) : super(key: key) {
    checkliste = liste;
  }

  @override
  State<Abhaken> createState() => _AbhakenState();
}

class _AbhakenState extends State<Abhaken> {
  List<Widget> texte = [];

  var _checked = false;

  var _activeColor;

  var _selected = false;

  var _checkColor;
  //final TextEditingController _controller1 = ();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    //_controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    elementErstellen();
    return Scaffold(
      appBar: AppBar(title: Text(widget.checkliste.titel)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: texte,
          ),
        ),
      ),
    );
  }

//
  elementErstellen() async {
    List<Checkliste> checklisten = [];
    var prefs = await SharedPreferences.getInstance();
    var text = prefs.getString("Element");
    texte.add(
      CheckboxListTile(
        value: _checked,
        title: Text(
          text ?? "default",
          style: TextStyle(color: Colors.grey),
        ),
        onChanged: (bool? value) {
          setState(() {
            _checked = value!;
            _selected = value;
          });
        },
        selected: _selected,
        //secondary: Icon(Icons.beach_access),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  void elementGeandert(String value) {}
}
