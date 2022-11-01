import 'package:flutter/material.dart';

// Generic dialog to display login errors
Future<void> showErrorDialog(
    BuildContext context,
    String text,
    ) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something happened!'),
          content: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok')),
          ],
        );
      });
}
