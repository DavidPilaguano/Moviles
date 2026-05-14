import 'package:flutter/material.dart';

class MoleculeFormGroup extends StatelessWidget {
  final List<Widget> children;

  const MoleculeFormGroup({required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children
          .map(
            (widget) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: widget,
            ),
          )
          .toList(),
    );
  }
}
