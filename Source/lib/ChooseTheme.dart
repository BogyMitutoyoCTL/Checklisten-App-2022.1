import 'package:flutter/material.dart';
import 'First_Check.dart';

class ChooseTheme extends StatefulWidget {
  const ChooseTheme({Key? key}) : super(key: key);

  @override
  State<ChooseTheme> createState() => _ChooseThemeState();
}

class _ChooseThemeState extends State<ChooseTheme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Choose your theme:",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w100,
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
    ));
  }

  void onPressed() {
    //Theme-mode aendern
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => FirstCheck()));
  }
}
