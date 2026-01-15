import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';


class Button extends StatelessWidget {
  final String textButton;
  final VoidCallback onPressed;
  final bool isLoading;

  const Button({
    super.key,
    required this.textButton,
    required this.onPressed,
    this.isLoading = false
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(10)
            ),
          ),
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(textButton)
      ),
    );
  }

}