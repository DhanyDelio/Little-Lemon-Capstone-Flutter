import 'package:flutter/material.dart';

class HeaderOnboarding extends StatelessWidget {
  final String image;

  const HeaderOnboarding({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset(image, height: 50, fit: BoxFit.contain)],
      ),
    );
  }
}
