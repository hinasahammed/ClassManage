import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Utils {
  static void showSnackbarToast(
    BuildContext context,
    String message,
    IconData icon,
  ) {
    Flushbar(
      message: message,
      margin: const EdgeInsets.all(8),
      icon: Icon(
        icon,
        size: 28.0,
        color: Colors.purple[300],
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: Colors.purple[300],
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }
}
