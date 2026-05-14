import 'package:flutter/material.dart';
import 'view/member_view.dart'; // Importa el archivo donde creaste la vista

void main() {
  runApp(ClubObesidadApp());
}

class ClubObesidadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control de Peso MVC',
      theme: ThemeData(
        // Un tema profesional con colores azules
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Definimos la vista principal (nuestro MemberWeightView)
      home: MemberWeightView(),
    );
  }
}
