import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("voodoopuppe.png"),

      /* color: Colors.white,*/
    );
  }
}
