import 'package:flutter/material.dart';
import 'package:moviles_30737_david_pilaguano/view/friend_numbers_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Números Amigos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),

      home: FriendNumbersView(),
    );
  }
}
