import 'package:pagos_servicios_basicos/model/payment_model.dart';

class PaymentController {
  // Tarifas por unidad
  final Map<String, double> rates = {
    'Agua': 0.75,
    'Luz': 0.12,
    'Internet': 30.0,
    'TV/Cable': 25.0,
  };

  double calculateSubtotal(PaymentModel data) {
    double rate = rates[data.serviceType] ?? 0.0;
    // Internet y TV suelen ser tarifa plana, Agua y Luz por consumo
    if (data.serviceType == 'Internet' || data.serviceType == 'TV/Cable') {
      return rate;
    }
    return data.consumption * rate;
  }

  double calculateTotal(PaymentModel data) {
    double subtotal = calculateSubtotal(data);
    double total = subtotal;

    // Lógica automática basada en la edad
    if (data.age >= 65) {
      data.isSeniorDiscount = true; // Actualizamos el estado del modelo
      total -= subtotal * 0.50; // Aplicar 50% de descuento
    } else {
      data.isSeniorDiscount = false;
    }

    if (data.hasLateFee) total += subtotal * 0.10;

    return total;
  }
}
