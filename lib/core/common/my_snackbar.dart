import 'package:final_practice/app/navigator_key/navigator_key.dart';
import 'package:flutter/material.dart';


showMySnackBar({
  required String message,
  Color? color,
}) {
  ScaffoldMessenger.of(
    // We already created this navigator key in the navigator_key.dart file
    AppNavigator.navigatorKey.currentState!.context,
  ).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: color ?? Colors.green,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

