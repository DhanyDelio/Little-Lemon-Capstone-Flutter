import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  final String greetingText;

  const Greeting({super.key, required this.greetingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, left: 10, right: 10),
      padding: EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF495E57),
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: Center(
        child: Text(
          greetingText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
    );
  }
}
