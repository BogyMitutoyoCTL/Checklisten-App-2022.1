import 'package:flutter/material.dart';
import 'choose_theme.dart';
import 'language.dart';

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: language, child: Text("Language Settings")),
              OutlinedButton(onPressed: theme, child: Text("Theme Settings")),
            ],
          ),
        ],
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
