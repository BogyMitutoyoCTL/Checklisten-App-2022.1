import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/checklisten.dart';
import 'package:voodoolist/main.dart';

import 'main.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({Key? key}) : super(key: key);

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  // late SharedPreferences prefs;
  // var firststart = true;
  // var themewahl = 2;

  @override
  void initState() {
    super.initState();
  }

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
                  "Choose your theme:",
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
                    onPressed: onPressed1,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black45, // Background color for Button
                    ),
                    child: Text(
                      "Dark-Mode",
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
                    onPressed: onPressed2,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Background color for Button
                    ),
                    child: Text("Light-Mode"),
                  ),
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onPressed3,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color for Button
                      ),
                      child: Text("System-Mode")),
                ),
              ),
////////////////////////////////////////////////////////////////////////////////
            ]),
          ),
        ],
      ),
    ));
  }

  void onPressed1() {
    setState(() {
      allData.themeWahl = 0;
    });
    saveFile();
  }

  void onPressed2() {
    setState(() {
      allData.themeWahl = 1;
    });
    saveFile();
  }

  void onPressed3() {
    setState(() {
      allData.themeWahl = 2;
    });
    saveFile();
  }

  void saveFile() async {
    allData.save();
    appState?.updateTheme();
    // prefs = await SharedPreferences.getInstance();
    // bool? eintrag = prefs.getBool("firststart");
    // prefs.setInt('themewahl', themewahl);
    // if (eintrag == null) {
    //   firststart = true;
    //   prefs.setBool("firststart", false);
    // } else {
    //   firststart = eintrag;
    // }
    // appState?.load();
    if (allData.firstStart) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Checklisten()));
    } else {
      Navigator.of(context).pop();
    }
  }
}
