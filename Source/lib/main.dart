import 'dart:convert';

import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/splash_screen.dart';

import 'AllData.dart';
import 'checkliste.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  prefs = await SharedPreferences.getInstance();
  allData.initInstance(prefs!);
  var myApp = MyApp();
  runApp(myApp);
}

Future<void> khj() async {
  var prefs = await SharedPreferences.getInstance();
  var allDataJson = prefs.getString("allData");
  if (allDataJson == null) return;

  AllData allData = AllData.fromJson(jsonDecode(allDataJson));
  allData.initInstance(prefs);
  print(allData.checklistenliste);
  allData.remove(allData.checklistenliste[0]);
  print(allData.checklistenliste);
}

Future<void> nameok() async {
  var prefs = await SharedPreferences.getInstance();
  AllData allData = AllData();
  allData.initInstance(prefs);
  await allData.clearAllSavedData();
  var check = new Checkliste("namedercheckliste");
  check.addNewTask("element1");
  allData.addNewChecklist(check);
  var checkliste = new Checkliste("2");
  checkliste.addNewTask("das funktioniert so lol");
  allData.addNewChecklist(checkliste);
  var checki = new Checkliste("noname");
  check.addNewTask("neues element");
  allData.addNewChecklist(checki);
  allData.save();
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

_MyAppState? appState = null;
AllData allData = AllData();
SharedPreferences? prefs;

class _MyAppState extends State<MyApp> {
  //var theme = 0;

  List themes = [ThemeMode.dark, ThemeMode.light, ThemeMode.system];

  Locale sprache = Locale('de', '');

  changeLanguage(Locale neueSprache) {
    setState(() {
      sprache = neueSprache;
    });
  }

  _MyAppState() {
    appState = this;
    load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: sprache,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Voodoo-List',
      //////////////////////////////////////////////////////////////////////////
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              /*enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),*/
              color: Colors.blue.shade900,
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue.shade900))),
        hintColor: Colors.blue,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.blue), //Textfarbe für die Textbox
        ),
      ),
      //////////////////////////////////////////////////////////////////////////
      darkTheme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.white30, //Farbe der Border beim schreiben
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white10))),
        //Farbe der Border bevor man drauf geht
        hintColor: Colors.grey,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF323131),
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.grey), //farbe für die Textbox
        ),
      ),
      //////////////////////////////////////////////////////////////////////////
      home: Splashscreen(),
      themeMode: themes[allData.themeWahl],
    );
  }

  void load() async {
    String? data = prefs?.getString("allData");
    if (data != null) {
      allData = AllData.fromJson(jsonDecode(data));
      allData.initInstance(prefs!);
    }
    sprache = Locale(allData.language);
  }

  void updateTheme() {
    setState(() {});
  }
}
