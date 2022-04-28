import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:voodoolist/checklisten.dart';
import 'package:voodoolist/main.dart';

import 'main.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({Key? key}) : super(key: key);

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalizations.of(context)!.settingsChooseTheme,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onDarkThemeSelected,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45, // Background color for Button
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.settingsDarkMode,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onLightThemeSelected,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Background color for Button
                    ),
                    child:
                        Text(AppLocalizations.of(context)!.settingsLightMode),
                  ),
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onSystemThemeSelected,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color for Button
                      ),
                      child: Text(
                          AppLocalizations.of(context)!.settingsSystemMode)),
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
            ]),
          ),
        ],
      ),
    ));
  }

  void onDarkThemeSelected() {
    saveFile(0);
  }

  void onLightThemeSelected() {
    saveFile(1);
  }

  void onSystemThemeSelected() {
    saveFile(2);
  }

  void saveFile(int theme) {
    setState(() {
      allData.themeWahl = theme;
    });
    appState?.updateTheme();
    if (allData.firstStart) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Checklisten()));
    } else {
      Navigator.of(context).pop();
    }
    allData.firstStart = false;
    allData.save();
  }
}
