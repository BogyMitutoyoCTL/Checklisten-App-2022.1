import 'package:flutter/material.dart';

class Creation extends StatefulWidget {
  const Creation({Key? key}) : super(key: key);

  @override
  State<Creation> createState() => _CreationState();
}

class _CreationState extends State<Creation> {
  String eingegebenerText = "";
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = eingegebenerText;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Checklist"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name der Liste',
                ),
                controller: _controller,
                onChanged: textGeaendert,
              ),
            ),
            Text(eingegebenerText),
            FloatingActionButton(
              onPressed: neuerlistenteil,
              child: Icon(Icons.add_circle_outline),
            )
          ],
        ));
  }

  void neuerlistenteil() {}
}

void textGeaendert(String value) {}
