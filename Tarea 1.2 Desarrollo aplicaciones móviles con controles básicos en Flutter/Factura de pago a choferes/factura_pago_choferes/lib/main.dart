import 'package:flutter/material.dart';
import 'views/payroll_form_view.dart';
import 'views/payroll_report_view.dart';

void main() => runApp(const PayrollApp());

class PayrollApp extends StatelessWidget {
  const PayrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nómina Choferes',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const PayrollFormView(),
        '/report': (context) => const PayrollReportView(),
      },
    );
  }
}
