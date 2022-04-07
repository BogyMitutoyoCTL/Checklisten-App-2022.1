import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checklisten.dart';
import 'coundown_timer.dart';
import 'language.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

//neuester stand
class _SplashscreenState extends State<Splashscreen> {
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
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/voodoopuppe.png"),

            /* color: Colors.white,*/
          ),
          Text("VOODOO",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 50,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.black,
              )),
          Text("LIST",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.black)),
          CountDownTimer(whenTimeExpires: exitSplashScreen)
        ],
      ),
    );
  }

  void exitSplashScreen() {
    if (firststart == true) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Language()));
      firststart = false;
    } else if (firststart == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Checklisten()));
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
