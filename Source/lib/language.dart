import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'main.dart';

import 'alert_klasse.dart';
import 'choose_theme.dart';
import 'settings_switch.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late SharedPreferences prefs;
  var firststart = true;

  @override
  void initState() {
    super.initState();
    loadFile();
  }

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
    return WillPopScope(
      onWillPop: Meldung,
      child: Scaffold(
          body: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(AppLocalizations.of(context)!.languageSettings,
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 30)),
                  ),
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map(convertStringToMenuItem).toList(),
                    onChanged: uebersetzen,
                  ),
                ]),
              ]),
            ]),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (firststart == true) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChooseTheme()));
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Icon(Icons.arrow_forward, size: 40),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black87,
            elevation: 0,
          )),
    );
  }

  void loadFile() async {
    prefs = await SharedPreferences.getInstance();
    bool? eintrag = prefs.getBool("firststart");
    if (eintrag == null) {
      firststart = true;

      prefs.setBool("firststart", false);
    } else {
      firststart = eintrag;
    }
  }

  Future<bool> Meldung() async {
    var warnSignal = AlertButton();
    return await warnSignal.beforeExit(context);
  }

  void uebersetzen(value) {
    if (value == 'English') {
      Locale englisch = Locale('en', '');
      appState?.changeLanguage(englisch);
    } else {
      Locale deutsch = Locale('de', '');
      appState?.changeLanguage(deutsch);
    }
    setState(() {
      dropdownvalue = value;
    });
  }
}
//
