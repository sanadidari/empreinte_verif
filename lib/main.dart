import 'package:flutter/material.dart';
import 'views/login_view.dart';

void main() {
  runApp(const EmpreinteApp());
}

class EmpreinteApp extends StatelessWidget {
  const EmpreinteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Empreinte Vérif",
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}
