import 'package:flutter/material.dart';

class AtomLabel extends StatelessWidget {
  final String texto;
  final bool negrita;
  final double fontSize;

  const AtomLabel(this.texto, {this.negrita = false, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: negrita ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
