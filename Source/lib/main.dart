import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/choose_theme.dart';
import 'package:voodoolist/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late SharedPreferences prefs;
  var theme = 0;
  List themes = [ThemeMode.dark, ThemeMode.light, ThemeMode.system];

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    load();
    return MaterialApp(
      themeMode: themes[theme],
      debugShowCheckedModeBanner: false,
      title: 'Voodoo Checklist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //lightmode
      darkTheme: ThemeData(primarySwatch: Colors.red),
      //darkmode
      home: Splashscreen(),
      //home: First_Check(),
    );
  }

  void load() async {
    prefs = await SharedPreferences.getInstance();
    int? eintrag = prefs.getInt("themewahl");
    if (eintrag != null && eintrag >= 0 && eintrag <= 2) {
      theme = eintrag;
    }
  }
}
