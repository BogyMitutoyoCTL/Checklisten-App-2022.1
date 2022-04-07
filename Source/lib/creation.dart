import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/aufgabe.dart';

import 'Checklisten.dart';
import 'checkliste.dart';

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
    getData();
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Name', checklistenName);
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('Name');
    if (name != null) {
      setState(() {
        this.checklistenName = name;
        _controller1.text = this.checklistenName;
      });
    }
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
        title: Text("Create Checklist"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  children: ([
                        TextField(
                          decoration: InputDecoration(
                            /**/ border: OutlineInputBorder(),
                            hintText: 'Name der Liste',
                          ),
                          controller: _controller1,
                          onChanged: nameGeaendert,
                        ) as Widget
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
          onPressed: save,
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

  void save() {
    List<Aufgabe> aufgaben_liste = [];
    for (var x = 0; x < _controllers.length; x++) {
      aufgaben_liste.add(Aufgabe(false, _controllers[x].text));
    }
    var checkliste = new Checkliste(checklistenName, aufgaben_liste);
    setState(() {});
    setData();
    Navigator.of(context)
        .pop(MaterialPageRoute(builder: (context) => Checklisten()));
  }

  void elementGeandert(String value) {}

  void nameGeaendert(String value) {
    setState(() {
      checklistenName = _controller1.text;
    });
  }
}
