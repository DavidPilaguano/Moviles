import 'package:flutter/material.dart';
import 'package:pagos_servicios_basicos/model/payment_model.dart';

import '../widgets/atoms/custom_text.dart';
import '../widgets/atoms/custom_button.dart';

class PaymentSummaryView extends StatelessWidget {
  const PaymentSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final PaymentModel model = args['model'];
    final double total = args['total'];

    return Scaffold(
      appBar: AppBar(title: const Text("Resumen")),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomText(
                  text: "Resumen de Pago",
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                const Divider(),
                CustomText(text: "Cliente: ${model.clientName}"),
                CustomText(text: "Servicio: ${model.serviceType}"),
                CustomText(
                  text: "Total Final: \$${total.toStringAsFixed(2)}",
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  label: "Regresar",
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
