import 'package:flutter/material.dart';

// Snackbar Function
snackbar(BuildContext context, Widget msg, {bool isFloating = false}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: isFloating ? SnackBarBehavior.floating : null,
      width: isFloating ? 400 : null,
      shape: isFloating
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      backgroundColor: Colors.blue[300],
      content: Center(
        child: msg,
      ),
      duration: const Duration(seconds: 1),
    ),
  );
}
