import 'package:flutter/material.dart';
import '../controller/friend_numbers_controller.dart';

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
        title: Text('Verificador de Números Amigos'),
        backgroundColor: const Color.fromARGB(255, 82, 172, 220),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Verifica si dos números son "Amigos"',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numAController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Primer número (a)',
                hintText: 'Ej: 220',
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _numBController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Segundo número (b)',
                hintText: 'Ej: 284',
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton.icon(
              onPressed: _ejecutarVerificacion,
              label: Text('Verificar Amistad'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _resultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: _resultado.contains('¡') ? Colors.green : Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
