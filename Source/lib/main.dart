import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/splash_screen.dart';

import 'AllData.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

_MyAppState? appState = null;
AllData? allData = null;

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;

  var theme = 0;

  List themes = [ThemeMode.dark, ThemeMode.light, ThemeMode.system];

  _MyAppState() {
    appState = this;
    allData = AllData();
    allData?.loadallchecklists();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        //Todo: Outline sichtbar machen und in den anderen Textfields entfernen
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
      themeMode: themes[theme],
    );
  }

//
  void load() async {
    prefs = await SharedPreferences.getInstance();
    int? eintrag = prefs.getInt("themewahl");
    theme = eintrag ?? 0;
    setState(() {});
  }
}
