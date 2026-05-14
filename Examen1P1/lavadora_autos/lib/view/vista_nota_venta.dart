import 'package:flutter/material.dart';
import 'package:lavadora_autos/model/servicio_lavado_modelo.dart';
import 'widgets/atoms/atom_label.dart';
import 'widgets/molecules/molecule_resumen_row.dart';
import 'widgets/atoms/atom_button.dart'; // Usamos tu botón también aquí

class VistaNotaVenta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ServicioLavadoModelo;

    return Scaffold(
      appBar: AppBar(title: const Text('Resumen de Pago'), centerTitle: true),
      body: Container(
        width: double.infinity,
        color: Colors.blue.shade50, // Fondo suave para resaltar la tarjeta
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 15),
                  const AtomLabel(
                    '¡GRACIAS POR SU COMPRA!',
                    negrita: true,
                    fontSize: 18,
                  ),
                  const Divider(height: 40, thickness: 1.2),

                  // Información del Cliente
                  MoleculeResumenRow(
                    titulo: 'Cliente:',
                    valor: args.cliente,
                    icono: Icons.person_outline,
                  ),
                  MoleculeResumenRow(
                    titulo: 'Vehículo:',
                    valor: args.vehiculo,
                    icono: Icons.directions_car_filled_outlined,
                  ),
                  MoleculeResumenRow(
                    titulo: 'Servicio:',
                    valor: args.lavado,
                    icono: Icons.local_car_wash,
                  ),
                  MoleculeResumenRow(
                    titulo: 'Adicional:',
                    valor: args.adicional,
                    icono: Icons.add_task_rounded,
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(thickness: 1, indent: 10, endIndent: 10),
                  ),

                  // Desglose de Precios
                  MoleculeResumenRow(
                    titulo: 'Subtotal:',
                    valor: '\$${args.subtotal.toStringAsFixed(2)}',
                  ),
                  MoleculeResumenRow(
                    titulo: 'IVA (15%):',
                    valor: '\$${args.iva.toStringAsFixed(2)}',
                  ),

                  const SizedBox(height: 10),

                  // Total resaltado con un contenedor
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: MoleculeResumenRow(
                      titulo: 'TOTAL A PAGAR:',
                      valor: '\$${args.total.toStringAsFixed(2)}',
                      resaltar: true,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Botón para nueva venta
                  AtomButton(
                    text: 'NUEVA VENTA',
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
