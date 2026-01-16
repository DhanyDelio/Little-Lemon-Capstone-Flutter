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
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
     child: SizedBox(
        width: 375,
        height: 50,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
          ),
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(textButton),
        ),
      ),
    );
  }
}
