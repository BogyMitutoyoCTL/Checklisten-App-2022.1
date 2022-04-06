import 'package:flutter/material.dart';
import 'package:voodoolist/Settingswitch.dart';
import 'Checklisten.dart';
import 'First_Check.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CoundownTimer.dart';
import 'Language.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({Key? key}) : super(key: key);

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  late SharedPreferences prefs;
  var firststart = true;

  @override
  void initState() {
    super.initState();
    loadFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/grau.png"), fit: BoxFit.cover)),
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
              //////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Background color
                      ),
                      child: Text("Dark-Mode")),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey, // Background color
                      ),
                      child: Text("Light-Mode")),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Background color
                        //Todo: -System-Mode Farbe anpassen ans System Theme
                      ),
                      child: Text("System-Mode")),
                ),
              ),
              //////////////////////////////////////////////////////////////////
            ]),
          ),
        ],
      ),
    ));
  }

  void onPressed() {
    //Theme-mode aendern
    if (firststart == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FirstCheck()));
    } else if (firststart == false) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Settingswitch()));
    }
  }
  void loadFile() async {
    prefs = await SharedPreferences.getInstance();
    bool? eintrag = prefs.getBool("firststart");
    if (eintrag == null) {
      firststart = true;
      prefs.setBool("firststart", false);
    } else {
      firststart = eintrag;
    }
  }
}
