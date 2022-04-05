import 'package:flutter/material.dart';
import 'package:voodoolist/Checklisten.dart';

import 'ChooseTheme.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String dropdownvalue = 'English';

  // List of items in our dropdown menu
  var items = [
    'English',
    'German',
  ];

  DropdownMenuItem convertStringToMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Text(item,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/grau.png"), fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Choose your language:",
                    style:
                        TextStyle(fontWeight: FontWeight.w100, fontSize: 30)),
              ),
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map(convertStringToMenuItem).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (dynamic? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ]),
          ]),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Checklisten()));
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black54,
            child: const Icon(Icons.arrow_back, size: 40),
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ChooseTheme()));
            },
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black54,
            child: const Icon(Icons.arrow_forward, size: 40),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
