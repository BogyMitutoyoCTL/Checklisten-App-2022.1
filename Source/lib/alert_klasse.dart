import 'package:flutter/material.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class AlertButton {
  Future<bool> beforeExit(BuildContext context) async {
    var ergebnis;
    if (Navigator.canPop(context)) {
      ergebnis = true;
    } else {
      ergebnis = await meldung(context);
    }
    ;
    return (ergebnis) ?? false;
  }

  Future<dynamic> meldung(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: new Text(AppLocalizations.of(context)!.exitAreYouSure),
        content: new Text(
          AppLocalizations.of(context)!.exitDoYouWantToExit,
          style: TextStyle(
            //better control over the alert
            fontWeight: FontWeight.w300,
            color: Colors.grey.shade700,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            //<-- SEE HERE
            child: new Text(AppLocalizations.of(context)!.exitNo),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            // <-- SEE HERE
            child: new Text(AppLocalizations.of(context)!.exitYes),
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
//
