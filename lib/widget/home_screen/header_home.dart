import 'package:flutter/material.dart';

class HeaderHome extends StatelessWidget {
  final String image;
  final String? text;
  final String? profileImage;
  final VoidCallback? onProfileTap;

  const HeaderHome({
    super.key,
    required this.image,
    this.text,
    this.profileImage,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(child: SizedBox()),
          Image.asset(image, height: 50, fit: BoxFit.contain),

          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: onProfileTap,
                child: profileImage != null
                    ? CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(profileImage!),
                      )
                    : const Icon(Icons.account_circle, size: 40),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
