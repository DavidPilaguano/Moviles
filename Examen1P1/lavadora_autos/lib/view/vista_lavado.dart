import 'package:flutter/material.dart';
import '../controller/lavado_controlador.dart';
import 'widgets/atoms/atom_button.dart';
import 'widgets/atoms/atom_dropdown.dart';
import 'widgets/atoms/atom_input.dart';
import 'widgets/molecules/molecule_service_card.dart';

class VistaLavado extends StatefulWidget {
  @override
  _VistaLavadoState createState() => _VistaLavadoState();
}

class _VistaLavadoState extends State<VistaLavado> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();

  String _tipoVehiculo = 'Auto';
  String _tipoLavado = 'Básico';
  String _adicional = 'Ninguno';

  void _enviar() {
    if (_formKey.currentState!.validate()) {
      final resultado = LavadoControlador.calcular(
        _nombreController.text,
        _tipoVehiculo,
        _tipoLavado,
        _adicional,
      );
      Navigator.pushNamed(context, '/notaVenta', arguments: resultado);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CarWash Pro'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade50, Colors.white],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.local_car_wash, size: 80, color: Colors.blue),
                const SizedBox(height: 20),

                // ÁTOMO: Input con mejor estilo
                AtomInput(
                  controller: _nombreController,
                  label: 'Nombre del Cliente',
                  validator: LavadoControlador.validarCampo,
                ),

                const SizedBox(height: 25),

                // MOLÉCULA: Agrupamos los selectores en una tarjeta elegante
                MoleculeServiceCard(
                  title: 'DETALLES DEL SERVICIO',
                  children: [
                    AtomDropdown(
                      label: 'Vehículo',
                      value: _tipoVehiculo,
                      icon: Icons.directions_car,
                      items: const ['Auto', 'Camioneta', 'Moto'],
                      onChanged: (val) => setState(() => _tipoVehiculo = val!),
                    ),
                    const SizedBox(height: 15),
                    AtomDropdown(
                      label: 'Tipo de Lavado',
                      value: _tipoLavado,
                      icon: Icons.water_drop,
                      items: const ['Básico', 'Completo', 'Premium'],
                      onChanged: (val) => setState(() => _tipoLavado = val!),
                    ),
                    const SizedBox(height: 15),
                    AtomDropdown(
                      label: 'Servicio Adicional',
                      value: _adicional,
                      icon: Icons.add_circle_outline,
                      items: const ['Ninguno', 'Encerado', 'Aspirado'],
                      onChanged: (val) => setState(() => _adicional = val!),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // ÁTOMO: Botón principal
                AtomButton(text: 'GENERAR NOTA DE VENTA', onPressed: _enviar),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
