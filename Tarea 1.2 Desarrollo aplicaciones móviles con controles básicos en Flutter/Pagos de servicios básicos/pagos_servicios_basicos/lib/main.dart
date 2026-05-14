import 'package:flutter/material.dart';
import 'package:pagos_servicios_basicos/view/payment_form_view.dart';
import 'package:pagos_servicios_basicos/view/payment_summary_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Pagos MVC',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const PaymentFormView(),
        '/summary': (context) => const PaymentSummaryView(),
      },
    );
  }
}
