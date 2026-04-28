import 'package:flutter/material.dart';
import '../controller/friend_numbers_controller.dart';

//todo
class FriendNumbersView extends StatefulWidget {
  @override
  _FriendNumbersViewState createState() => _FriendNumbersViewState();
}

class _FriendNumbersViewState extends State<FriendNumbersView> {
  final FriendNumbersController _controller = FriendNumbersController();
  final TextEditingController _numAController = TextEditingController();
  final TextEditingController _numBController = TextEditingController();
  String _resultado = "Ingrese los números para verificar";

  void _ejecutarVerificacion() {
    setState(() {
      _resultado = _controller.checkAmigos(
        _numAController.text,
        _numBController.text,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lección - Números Amigos'),
        backgroundColor: const Color.fromARGB(255, 82, 172, 220),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextAtom(
              text: 'Verifica si dos números son "Amigos"',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 30),
            // Llamada al Organismo
            FriendCheckerForm(
              numAController: _numAController,
              numBController: _numBController,
              onVerify: _ejecutarVerificacion,
            ),
            const SizedBox(height: 30),
            // Llamada a la Molécula de resultado
            ResultDisplayMolecule(message: _resultado),
          ],
        ),
      ),
    );
  }
}

//atomos
class TextAtom extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const TextAtom({
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) => Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
  );
}

//modelucas
class NumberInputMolecule extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;

  const NumberInputMolecule({
    required this.controller,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}

class ResultDisplayMolecule extends StatelessWidget {
  final String message;

  const ResultDisplayMolecule({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextAtom(
        text: message,
        fontWeight: FontWeight.w600,
        color: message.contains('¡') ? Colors.green : Colors.red,
      ),
    );
  }
}

//organismo
class FriendCheckerForm extends StatelessWidget {
  final TextEditingController numAController;
  final TextEditingController numBController;
  final VoidCallback onVerify;

  const FriendCheckerForm({
    required this.numAController,
    required this.numBController,
    required this.onVerify,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberInputMolecule(
          controller: numAController,
          label: 'Primer número (a)',
          hint: 'Ej: 220',
        ),
        const SizedBox(height: 15),
        NumberInputMolecule(
          controller: numBController,
          label: 'Segundo número (b)',
          hint: 'Ej: 284',
        ),
        const SizedBox(height: 25),
        ElevatedButton.icon(
          onPressed: onVerify,
          icon: const Icon(Icons.compare_arrows),
          label: const Text('Verificar Amistad'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          ),
        ),
      ],
    );
  }
}
