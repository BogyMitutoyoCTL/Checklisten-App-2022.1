import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:voodoolist/main.dart';

import 'checklisten.dart';
import 'coundown_timer.dart';
import 'language.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(75, 100, 0, 0),
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Agne',
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(''),
                    TypewriterAnimatedText('Voodoo-List',
                        speed: Duration(milliseconds: 100)),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
          ),
          CountDownTimer(whenTimeExpires: exitSplashScreen)
        ],
      ),
    );
  }

  void exitSplashScreen() {
    if (allData.firstStart) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Language()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Checklisten()));
    }
  }
}
