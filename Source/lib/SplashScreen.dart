import 'package:flutter/material.dart';
import 'package:voodoolist/Checklisten.dart';

import 'CoundownTimer.dart';
import 'Language.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage("assets/voodoopuppe.png"),

          /* color: Colors.white,*/
        ),
        CountDownTimer(whenTimeExpires: exitSplashScreen)
      ],
    );
  }

  void exitSplashScreen() {
    if (firststart == true) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Language()));
      firststart = false;
    } else if (firststart == false) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Checklisten()));
    }
  }
}

var firststart = true;
