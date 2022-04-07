import 'package:flutter/material.dart';

class AlertButton {
  Future<bool> beforeExit(BuildContext context) async {
    var ergebnis;
    if (Navigator.canPop(context)) {
      ergebnis = true;
    } else
      () async {
        ergebnis = await meldung(context);
      };
    return (ergebnis) ?? false;
  }

  Future<dynamic> meldung(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            //<-- SEE HERE
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            // <-- SEE HERE
            child: new Text('Yes'),
          ),
        ],
      ),
    );
  }

  static bool canPop(BuildContext context) {
    final NavigatorState? navigator = Navigator.maybeOf(context);
    return navigator != null && navigator.canPop();
  }
}
