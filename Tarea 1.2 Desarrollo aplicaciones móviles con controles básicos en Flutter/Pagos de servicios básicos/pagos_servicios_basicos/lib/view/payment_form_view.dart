import 'package:flutter/material.dart';
import 'package:pagos_servicios_basicos/controller/payment_controller.dart';
import 'package:pagos_servicios_basicos/model/payment_model.dart';

import '../widgets/atoms/custom_button.dart';
import '../widgets/atoms/custom_text.dart';
import '../widgets/molecules/labeled_input.dart';

class PaymentFormView extends StatefulWidget {
  const PaymentFormView({super.key});

  @override
  State<PaymentFormView> createState() => _PaymentFormViewState();
}

class _PaymentFormViewState extends State<PaymentFormView> {
  // Controladores para los campos de texto
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _valController = TextEditingController();

  // Instancia del controlador de lógica
  final _controller = PaymentController();

  // Instancia del modelo para manejar el estado
  PaymentModel _data = PaymentModel();

  void _calculate() {
    setState(() {
      _data.clientName = _nameController.text;

      // CORRECCIÓN AQUÍ: Usar ?? 0 para asegurar que siempre sea un int
      _data.age = int.tryParse(_ageController.text) ?? 0;

      _data.consumption = double.tryParse(_valController.text) ?? 0.0;
    });

    double total = _controller.calculateTotal(_data);

    Navigator.pushNamed(
      context,
      '/summary',
      arguments: {'model': _data, 'total': total},
    );
  }

  void _clear() {
    setState(() {
      _nameController.clear();
      _ageController.clear();
      _valController.clear();
      _data = PaymentModel(); // Resetear el modelo a valores iniciales
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registro de Pago de Servicios"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECCIÓN: DATOS DEL CLIENTE ---
            const CustomText(
              text: "Datos del Cliente",
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            LabeledInput(label: "Nombre completo", controller: _nameController),
            LabeledInput(
              label: "Edad",
              controller: _ageController,
              type: TextInputType.number,
            ),

            const Divider(height: 30),

            // --- SECCIÓN: SERVICIO ---
            const CustomText(
              text: "Seleccione el Servicio",
              fontWeight: FontWeight.bold,
            ),
            ...['Agua', 'Luz', 'Internet', 'TV/Cable'].map(
              (servicio) => RadioListTile(
                title: Text(servicio),
                value: servicio,
                groupValue: _data.serviceType,
                onChanged: (v) =>
                    setState(() => _data.serviceType = v.toString()),
              ),
            ),

            const SizedBox(height: 10),
            LabeledInput(
              label: "Consumo (m3/kWh) o Valor Base (\$)",
              controller: _valController,
              type: TextInputType.number,
            ),

            const Divider(height: 30),

            // --- SECCIÓN: ADICIONALES ---
            const CustomText(
              text: "Opciones Adicionales",
              fontWeight: FontWeight.bold,
            ),
            CheckboxListTile(
              title: const Text("Recargo por pago fuera de fecha (10%)"),
              value: _data.hasLateFee,
              onChanged: (v) => setState(() => _data.hasLateFee = v!),
              controlAffinity: ListTileControlAffinity.leading,
            ),

            // Nota informativa sobre la edad
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: CustomText(
                text: _data.age >= 65
                    ? "✓ Descuento de 3ra edad aplicado automáticamente."
                    : "* El descuento de 3ra edad requiere 65 años o más.",
                fontSize: 12,
                color: _data.age >= 65 ? Colors.green : Colors.grey,
              ),
            ),

            const SizedBox(height: 30),

            // --- BOTONES DE ACCIÓN ---
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "Calcular Pago",
                    onPressed: _calculate,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CustomButton(
                    label: "Limpiar",
                    onPressed: _clear,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
