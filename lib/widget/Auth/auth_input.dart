import 'package:flutter/material.dart';

class AuthInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscure;
  final TextInputType keyboardType;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixPressed;
  final TextEditingController controller;
  final Color focusedColor;
  final String? error;

  const AuthInput({
    super.key,
    required this.label,
    required this.hint,
    required this.keyboardType,
    required this.controller,
    this.obscure = false,
    this.suffixIcon,
    this.onSuffixPressed,
    required this.focusedColor,
    required this.error
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: focusedColor),
          hintText: hint,
          errorText: error,
          errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
          suffixIcon: suffixIcon != null
              ? IconButton(onPressed: onSuffixPressed, icon: Icon(suffixIcon))
              : null,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(color: focusedColor, width: 2),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        ),
        keyboardType: keyboardType,
        obscureText: obscure,
        controller: controller,
      ),
    );
  }
}
