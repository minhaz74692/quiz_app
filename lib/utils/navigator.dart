import 'package:flutter/material.dart';

class NavigatorHelper {
  static toScreen(context, screen) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => screen));
  }

  static back(context) {
    Navigator.pop(context);
  }

  static void nextScreenCloseOthers(context, page) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => page), (route) => false);
  }
}
