import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/checklisten.dart';
import 'package:voodoolist/main.dart';
import 'settings_switch.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({Key? key}) : super(key: key);

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  late SharedPreferences prefs;
  var firststart = true;
  var themewahl = 2;

  @override
  void initState() {
    super.initState();
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
                    onPressed: onPressed1,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black, // Background color
                    ),
                    child: Text("Dark-Mode"),
                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onPressed2,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey, // Background color
                    ),
                    child: Text("Light-Mode"),
                  ),
                ),
              ),
              //////////////////////////////////////////////////////////////////
              Center(
                child: SizedBox(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: onPressed3,
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

  void onPressed1() {
    setState(() {
      themewahl = 0;
    });
    saveFile();
  }

  void onPressed2() {
    setState(() {
      themewahl = 1;
    });
    saveFile();
  }

  void onPressed3() {
    setState(() {
      themewahl = 2;
    });
    saveFile();
  }

  void saveFile() async {
    prefs = await SharedPreferences.getInstance();
    bool? eintrag = prefs.getBool("firststart");
    prefs.setInt('themewahl', themewahl);
    if (eintrag == null) {
      firststart = true;
      prefs.setBool("firststart", false);
    } else {
      firststart = eintrag;
    }
    appState?.load();
    if (firststart == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Checklisten()));
    } else if (firststart == false) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Settingswitch()));
    }
  }
}
//Tom
