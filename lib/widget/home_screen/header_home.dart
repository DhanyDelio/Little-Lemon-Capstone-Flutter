import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String image;
  final String? text;
  final String? profileImage;
  final VoidCallback? onProfileTap;

  const Header({
    super.key,
    required this.image,
    this.text,
    this.profileImage,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(image, height: 40),

              if (profileImage != null)
                GestureDetector(
                  onTap: onProfileTap,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(profileImage!),
                    radius: 20,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
