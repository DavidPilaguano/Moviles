class ServicioLavadoModelo {
  final String cliente;
  final String vehiculo;
  final String lavado;
  final String adicional;
  final double subtotal;
  final double iva;
  final double total;

  ServicioLavadoModelo({
    required this.cliente,
    required this.vehiculo,
    required this.lavado,
    required this.adicional,
    required this.subtotal,
    required this.iva,
    required this.total,
  });
}
