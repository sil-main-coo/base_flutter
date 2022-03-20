import 'package:flutter/material.dart';

class LoaderDialog {
  BuildContext? _ct;

  void showDefault(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (cx) {
          _ct ??= cx;
          return WillPopScope(
            onWillPop: () async => false,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  bool popDialog({BuildContext? context}) {
    if (context == null) {
      if (_ct != null) {
        try {
          if (Navigator.canPop(_ct!)) {
            Navigator.pop(_ct!);
            _ct = null;
            return true;
          }
        } catch (e) {
          debugPrint(e.toString());
          _ct = null;
          return false;
        }
      }
      return false;
    } else {
      Navigator.pop(context);
      _ct = null;
      return true;
    }
  }
}
