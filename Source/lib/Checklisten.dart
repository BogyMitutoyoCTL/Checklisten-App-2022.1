import 'package:flutter/material.dart';
import 'package:voodoolist/Settingswitch.dart';

class Checklisten extends StatefulWidget {
  const Checklisten({Key? key}) : super(key: key);

  @override
  State<Checklisten> createState() => _ChecklistenState();
}

class _ChecklistenState extends State<Checklisten> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checklisten'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Settingswitch()));
            },
          )
        ],
      ),
    );
  }
}
