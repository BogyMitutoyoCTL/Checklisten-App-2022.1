import 'package:flutter/material.dart';
import 'package:voodoolist/ChooseTheme.dart';

import 'CoundownTimer.dart';
import 'Language.dart';

var firststart = 0;

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
    if (firststart == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Language()));
    } else if (firststart > 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChooseTheme()));
    }
  }
}
