import 'package:flutter/material.dart';

Future<dynamic> alertScreen(
  BuildContext context,
  String title,
  String content,
) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: Text(content, style: const TextStyle(color: Colors.black)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'OK',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
