import 'dart:math';

import 'package:flutter/material.dart';
import 'package:voodoolist/ChooseTheme.dart';

import 'CoundownTimer.dart';
import 'Language.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Random random = new Random();
  int randomNumber = 0;
  _SplashscreenState() {
    randomNumber = random.nextInt(11);
  }
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
    if (randomNumber > 5) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Language()));
    } else if (randomNumber < 5) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ChooseTheme()));
    }
  }
}
