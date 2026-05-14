import 'package:flutter/material.dart';

class AppTheme {
  // principales
  static const Color primaryBlue = Color.fromARGB(255, 85, 142, 188);
  static const Color backgroundLight = Color.fromARGB(
    255,
    219,
    107,
    107,
  ); // Gris muy claro
  static const Color surfaceWhite = Colors.white;

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false, // estilos
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: backgroundLight,

      // appbar
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: surfaceWhite,
        elevation: 0,
      ),

      // botones redondeao
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: surfaceWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25), // Redondeado
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // borde de texto
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceWhite,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
