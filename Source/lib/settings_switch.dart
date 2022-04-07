import 'package:flutter/material.dart';
import 'package:voodoolist/Checklisten.dart';
import 'language.dart';
import 'choose_theme.dart';

class Settingswitch extends StatefulWidget {
  const Settingswitch({Key? key}) : super(key: key);

  @override
  State<Settingswitch> createState() => _SettingswitchState();
}

class _SettingswitchState extends State<Settingswitch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/grau.png"), fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: language,
                      child: Text("Language Settings",
                          style: TextStyle(color: Colors.black, fontSize: 30))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: theme,
                      child: Text("Theme Settings",
                          style: TextStyle(color: Colors.black, fontSize: 30))),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pop(MaterialPageRoute(builder: (context) => Checklisten()));
        },
        child: Text("Back", style: TextStyle(fontSize: 23)),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
    );
  }

  void language() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Language()));
  }

  void theme() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChooseTheme()));
  }
}
//
