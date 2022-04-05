import 'package:flutter/material.dart';
import 'Creation.dart';

class FirstCheck extends StatefulWidget {
  const FirstCheck({Key? key}) : super(key: key);

  @override
  State<FirstCheck> createState() => _First_CheckState();
}

//
class _First_CheckState extends State<FirstCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(title: Text(""), backgroundColor: Colors.white),
        body: Center(
      child: SizedBox(
        width: 300,
        height: 300,
        child: ElevatedButton(
          onPressed: weiter,
          child: Text(
            "Create your first checklist!", /* style: TextStyle(color: Colors.black)*/
          ),
          //style: ElevatedButton.styleFrom(primary: Colors.white),
        ),
      ),
    ));
  }

  void weiter() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Creation()));
  }
}
