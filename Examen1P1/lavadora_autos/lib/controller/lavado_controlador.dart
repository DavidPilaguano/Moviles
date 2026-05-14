import 'package:lavadora_autos/model/servicio_lavado_modelo.dart';

class LavadoControlador {
  // PrecioVehiculo
  static const Map<String, double> preciosVehiculo = {
    'Auto': 10.0,
    'Camioneta': 15.0,
    'Moto': 5.0,
  };

  //PreciosLavado
  static const Map<String, double> preciosLavado = {
    'Básico': 5.0,
    'Completo': 10.0,
    'Premium': 20.0,
  };

  // Adicional
  static const Map<String, double> preciosAdicional = {
    'Ninguno': 0.0,
    'Encerado': 7.0,
    'Aspirado': 5.0,
  };

  static ServicioLavadoModelo calcular(
    String cliente,
    String vehiculo,
    String lavado,
    String adicional,
  ) {
    double precioVehiculo = preciosVehiculo[vehiculo] ?? 0;
    double precioLavado = preciosLavado[lavado] ?? 0;
    double precioExtra = preciosAdicional[adicional] ?? 0;

    double subtotal = precioVehiculo + precioLavado + precioExtra;
    double iva = subtotal * 0.15;
    double total = subtotal + iva;

    return ServicioLavadoModelo(
      cliente: cliente,
      vehiculo: vehiculo,
      lavado: lavado,
      adicional: adicional,
      subtotal: subtotal,
      iva: iva,
      total: total,
    );
  }

  static String? validarCampo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es obligatorio';
    }
    return null;
  }
}
