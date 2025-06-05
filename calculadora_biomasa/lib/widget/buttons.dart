import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  const ButtonCommon({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
    );
  }
}

class ButtonWithFunction extends StatelessWidget {
  const ButtonWithFunction({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: ButtonCommon(text: text),
    );
  }
}
