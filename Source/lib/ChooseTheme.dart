import 'package:flutter/material.dart';

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
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Choose your theme:",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w100,
            ),
          ),
          //////////////////////////////////////////////////////////////////
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // Background color
              ),
              child: Text("Dark-Mode")),
          //////////////////////////////////////////////////////////////////
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.grey, // Background color
              ),
              child: Text("Light-Mode")),
          //////////////////////////////////////////////////////////////////
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                //Todo: -System-Mode Farbe anpassen ans System Theme
              ),
              child: Text("System-Mode")),
          //////////////////////////////////////////////////////////////////
        ]),
      ],
    ));
  }

  void onPressed() {
    //Theme-mode aendern
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => First_Check()));
  }
}

class First_Check extends StatelessWidget {
  const First_Check({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
