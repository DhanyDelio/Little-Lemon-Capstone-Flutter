import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final bool obscure;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextEditingController controller;

  const AuthInput({

    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.keyboardType,
    required this.controller,
    this.obscure = false,
    this.suffixIcon,
    this.onSuffixPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: onSuffixPressed, icon: Icon(suffixIcon))
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
        keyboardType: keyboardType,
        obscureText: obscure,
        controller: controller,
      ),
    );
  }
}
