import 'package:flutter/material.dart';
import 'package:lavadora_autos/view/vista_lavado.dart';
import 'package:lavadora_autos/view/vista_nota_venta.dart';
import 'theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lavado de Autos',

      theme: AppTheme.lightTheme,

      initialRoute: '/lavado',
      routes: {
        '/lavado': (context) => VistaLavado(),
        '/notaVenta': (context) => VistaNotaVenta(),
      },
    );
  }
}
