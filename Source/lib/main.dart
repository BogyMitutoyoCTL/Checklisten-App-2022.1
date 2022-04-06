import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:voodoolist/choose_theme.dart';
import 'package:voodoolist/splash_screen.dart';
import 'RestartWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

_MyAppState? appState;

class _MyAppState extends State<MyApp> {
  late SharedPreferences prefs;

  var theme = 0;

  List themes = [ThemeMode.dark, ThemeMode.light, ThemeMode.system];

  _MyAppState() {
    appState = this;
    load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voodoo Checklist',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(primarySwatch: Colors.red),
      home: Splashscreen(),
      themeMode: themes[theme],
    );
  }

  void load() async {
    prefs = await SharedPreferences.getInstance();
    int? eintrag = prefs.getInt("themewahl");
    theme = eintrag!;
    setState(() {});
  }
}
