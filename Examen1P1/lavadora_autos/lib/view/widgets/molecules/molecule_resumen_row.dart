import 'package:flutter/material.dart';
import '../atoms/atom_label.dart';

class MoleculeResumenRow extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData? icono; // Icono opcional
  final bool resaltar;

  const MoleculeResumenRow({
    super.key,
    required this.titulo,
    required this.valor,
    this.icono,
    this.resaltar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          if (icono != null) Icon(icono, size: 20, color: Colors.blue.shade300),
          if (icono != null) const SizedBox(width: 10),
          AtomLabel(titulo, negrita: resaltar),
          const Spacer(),
          AtomLabel(valor, negrita: resaltar, fontSize: resaltar ? 18 : 16),
        ],
      ),
    );
  }
}
