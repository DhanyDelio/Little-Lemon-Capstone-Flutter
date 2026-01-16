import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/screen/login_screen.dart';
import 'package:little_lemon_flutter/screen/register_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      home: const RegisterScreen(),
    );

  }
}
