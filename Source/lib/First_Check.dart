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
      padding: const EdgeInsets.fromLTRB(
          100, 350, 50, 50), //ToDO: Größe von Schrift und Button
      child: ElevatedButton(
          onPressed: weiter,
          /*child: Text("Create your first checklist!"),*/ child:
              Container(height: 80, width: 80)
          // style: ElevatedButton.styleFrom(primary: Colors.white),
          ),
    ));
  }

  void weiter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Creation()));
  }
}
