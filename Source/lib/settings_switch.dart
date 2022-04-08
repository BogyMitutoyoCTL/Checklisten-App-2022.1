import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:voodoolist/Checklisten.dart';

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
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appBarSettings)),
      body: Container(
        /*decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/grau.png"), fit: BoxFit.cover)),*/
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
                      child: Text(
                          AppLocalizations.of(context)!
                              .mainScreenLanguageSettings,
                          style: TextStyle(fontSize: 30))),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                      onPressed: theme,
                      child: Text(
                          AppLocalizations.of(context)!.mainScreenThemeSettings,
                          style: TextStyle(fontSize: 30))),
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
        child: Icon(Icons.arrow_back, size: 40),
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
