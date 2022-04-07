import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/checkliste.dart';

class Abhaken extends StatefulWidget {
  const Abhaken({Key? key}) : super(key: key);

  @override
  State<Abhaken> createState() => _AbhakenState();
}

class _AbhakenState extends State<Abhaken> {
  List<Widget> texte = [];
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
      appBar: AppBar(
          title: Text(AppLocalization.of(context)!.appBarChecklistename)),
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
    texte.add(CheckboxListTile(
      title: Text(
        text ?? "default",
        style: TextStyle(color: Colors.red),
      ),
      onChanged: (newValue) {
        setState(() {});
      },
      controlAffinity: ListTileControlAffinity.leading,
      value: null, //  <-- leading Checkbox
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
