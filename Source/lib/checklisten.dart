import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

import 'creation.dart';
import 'settings_switch.dart';

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
        title: Text(AppLocalizations.of(context)!.appBarChecklists),
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
      floatingActionButton: FloatingActionButton(
        //neue Liste
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Creation()));
        },
        child: Icon(Icons.add, size: 30),
        foregroundColor: Colors.white,
        elevation: 10,
      ),
    );
  }
}
