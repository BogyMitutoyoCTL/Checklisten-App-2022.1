import 'package:flutter/material.dart';
import 'Checklisten.dart';

class Creation extends StatefulWidget {
  const Creation({Key? key}) : super(key: key);

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {
  List<TextField> textfields = [];
  String checklistenName = "";
  List<TextEditingController> controlers = [];
  final TextEditingController _controller1 = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller1.text = checklistenName;
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Checklist"),
      ),
      body: Column(
        children: [
          //////////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    /**/ border: OutlineInputBorder(),
                    hintText: 'Name der Liste',
                  ),
                  controller: _controller1,
                  onChanged: nameGeaendert,
                ),
                Text(checklistenName),
                FloatingActionButton(
                  onPressed: neuerlistenteil,
                  child: Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: save, child: Icon(Icons.save_alt_outlined)),
    );
  }

  void neuerlistenteil() {
    var n = 0;
    n++;
    setState(() {
      TextField(
        decoration: InputDecoration(labelText: '$n. Element'),
        controller: _controller1,
        onChanged: elementGeandert,
      );
    });
  }

  void save() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Checklisten()));
  }

  void elementGeandert(String value) {}
  void nameGeaendert(String value) {
    setState(() {
      checklistenName = _controller1.text;
    });
  }
}
