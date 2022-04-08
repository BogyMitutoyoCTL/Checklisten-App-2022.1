import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'AllData.dart';
import 'checkliste.dart';
import 'main.dart';

class Creation extends StatefulWidget {
  const Creation({Key? key}) : super(key: key);

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {
  List<Padding> textfields = [];
  String checklistenName = "";

  List<TextEditingController> _controllers = [];
  final TextEditingController _controller1 = TextEditingController();
  List<String> Elemente = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appBarCreateChecklist),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  children: (<Widget>[
                        TextField(
                          decoration: InputDecoration(
                            /**/
                            border: OutlineInputBorder(),
                            hintText: AppLocalizations.of(context)!.hintText,
                          ),
                          controller: _controller1,
                          onChanged: nameGeaendert,
                        )
                      ]) +
                      textfields +
                      [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: FloatingActionButton(
                            heroTag: 'btn1',
                            onPressed: neuerlistenteil,
                            child: Icon(Icons.add_circle_outline),
                          ),
                        )
                      ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'btn2',
          onPressed: save_and_navigate,
          child: Icon(Icons.save_alt_outlined)),
    );
  }

  var n = 0;

  void neuerlistenteil() {
    n++;
    setState(() {
      var controller2 = TextEditingController();
      _controllers.add(controller2);
      var textfeld = Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: InputDecoration(labelText: '$n. Element'),
          controller: controller2,
          onChanged: elementGeandert,
        ),
      );
      textfields.add(textfeld);
    });
  }

  Checkliste getChecklistFromInput() {
    var checkliste = new Checkliste(checklistenName);
    for (var x = 0; x < _controllers.length; x++) {
      checkliste.addNewTask(_controllers[x].text);
    }
    return checkliste;
  }

  void elementGeandert(String value) {}

  void nameGeaendert(String value) {
    setState(() {
      checklistenName = _controller1.text;
    });
  }

  void save_and_navigate() {
    Checkliste checkliste = getChecklistFromInput();
    allData?.addNewChecklist(checkliste);
    AllData().saveallchecklists;
    Navigator.of(context).pop();
  }
}
//
