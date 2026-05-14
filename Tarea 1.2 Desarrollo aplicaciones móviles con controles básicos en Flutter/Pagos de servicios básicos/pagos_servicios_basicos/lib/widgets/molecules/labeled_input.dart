import 'package:flutter/material.dart';
import '../atoms/custom_text.dart';

class LabeledInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType type;

  const LabeledInput({
    super.key,
    required this.label,
    required this.controller,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: label, fontWeight: FontWeight.bold),
        TextField(controller: controller, keyboardType: type),
        const SizedBox(height: 15),
      ],
    );
  }
}
