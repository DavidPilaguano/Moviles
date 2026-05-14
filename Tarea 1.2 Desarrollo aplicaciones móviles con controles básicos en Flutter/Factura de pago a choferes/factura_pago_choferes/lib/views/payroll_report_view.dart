import 'package:flutter/material.dart';
import '../controllers/payroll_controller.dart';
import '../widgets/atoms/custom_text.dart';

class PayrollReportView extends StatelessWidget {
  const PayrollReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final payroll =
        ModalRoute.of(context)!.settings.arguments as PayrollController;

    return Scaffold(
      appBar: AppBar(title: const Text("Reporte General")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text:
                  "Total General Empresa: \$${payroll.calculateCompanyTotal().toStringAsFixed(2)}",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
            CustomText(
              text: "Más horas el Lunes: ${payroll.getTopMondayDriver()}",
              color: Colors.orange,
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: payroll.drivers.length,
                itemBuilder: (context, index) {
                  final driver = payroll.drivers[index];
                  return Card(
                    child: ListTile(
                      title: Text(driver.name),
                      subtitle: Text(
                        "Horas: ${driver.totalHours} | Sueldo: \$${driver.weeklySalary}",
                      ),
                      trailing: Icon(
                        Icons.circle,
                        color: driver.isActive ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
