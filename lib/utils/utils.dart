import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey();

  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.amber,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
