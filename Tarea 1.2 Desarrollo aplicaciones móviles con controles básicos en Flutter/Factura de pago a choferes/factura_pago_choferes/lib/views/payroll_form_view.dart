import 'package:flutter/material.dart';
import '../controllers/payroll_controller.dart';
import '../models/driver_model.dart';
import '../widgets/atoms/custom_button.dart';
import '../widgets/molecules/labeled_input.dart';

class PayrollFormView extends StatefulWidget {
  const PayrollFormView({super.key});

  @override
  State<PayrollFormView> createState() => _PayrollFormViewState();
}

class _PayrollFormViewState extends State<PayrollFormView> {
  final _payrollCtrl = PayrollController();
  final _nameCtrl = TextEditingController();
  final _rateCtrl = TextEditingController();
  final List<TextEditingController> _hourCtrls = List.generate(
    6,
    (_) => TextEditingController(),
  );

  DriverModel _currentDriver = DriverModel();

  void _registerDriver() {
    _currentDriver.name = _nameCtrl.text;
    _currentDriver.hourlyRate = double.tryParse(_rateCtrl.text) ?? 0.0;
    _currentDriver.dailyHours = _hourCtrls
        .map((c) => double.tryParse(c.text) ?? 0.0)
        .toList();

    setState(() {
      _payrollCtrl.addDriver(_currentDriver);
      _clearInputs();
    });

    if (_payrollCtrl.drivers.length == 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Límite de 5 choferes alcanzado. Puede ver el reporte.",
          ),
        ),
      );
    }
  }

  void _clearInputs() {
    _nameCtrl.clear();
    _rateCtrl.clear();
    for (var c in _hourCtrls) {
      c.clear();
    }
    _currentDriver = DriverModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Choferes (${_payrollCtrl.drivers.length}/5)"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LabeledInput(label: "Nombre del Chofer", controller: _nameCtrl),
            LabeledInput(
              label: "Sueldo por Hora",
              controller: _rateCtrl,
              type: TextInputType.number,
            ),

            const Text(
              "Horas por día (Lun - Sab):",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 2,
              children: List.generate(
                6,
                (index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                    controller: _hourCtrls[index],
                    decoration: InputDecoration(labelText: "Día ${index + 1}"),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ),

            RadioListTile(
              title: const Text("Jornada Diurna"),
              value: "Diurna",
              groupValue: _currentDriver.shift,
              onChanged: (v) => setState(() => _currentDriver.shift = v!),
            ),
            RadioListTile(
              title: const Text("Jornada Nocturna"),
              value: "Nocturna",
              groupValue: _currentDriver.shift,
              onChanged: (v) => setState(() => _currentDriver.shift = v!),
            ),

            CheckboxListTile(
              title: const Text("Chofer Activo"),
              value: _currentDriver.isActive,
              onChanged: (v) => setState(() => _currentDriver.isActive = v!),
            ),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  label: "Registrar",
                  onPressed: _registerDriver,
                  color: Colors.blue,
                ),
                CustomButton(
                  label: "Ver Reporte",
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/report',
                      arguments: _payrollCtrl,
                    );
                  },
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
