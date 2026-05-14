import 'package:flutter/material.dart';

class AtomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AtomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Text(text),
    );
  }
}
