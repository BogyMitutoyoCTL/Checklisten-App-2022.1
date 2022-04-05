import 'package:flutter/material.dart';
import 'Creation.dart';

class FirstCheck extends StatefulWidget {
  const FirstCheck({Key? key}) : super(key: key);

  @override
  State<FirstCheck> createState() => _First_CheckState();
}

class _First_CheckState extends State<FirstCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(""), backgroundColor: Colors.white),
        body: Padding(
      padding:
          const EdgeInsets.fromLTRB(70, 300, 70, 80), //ToDO: Größe von Schrift
      child: ElevatedButton(
        onPressed: weiter,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(80, 70, 70, 80),
          child: Text(
            "Create your first checklist!", /* style: TextStyle(color: Colors.black)*/
          ),
        ),
        //style: ElevatedButton.styleFrom(primary: Colors.white),
      ),
    ));
  }

  void weiter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Creation()));
  }
}
