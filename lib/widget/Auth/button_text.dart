import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';

class ButtonText extends StatelessWidget {
  final String askingtext;
  final String text;
  final VoidCallback button;
  final bool isloading;

  const ButtonText({
    super.key,
    required this.askingtext,
    required this.text,
    required this.button,
    this.isloading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(askingtext),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: isloading ? null : button,
            child: isloading
                ? SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColor.primary,
                    ),
                  )
                : Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
