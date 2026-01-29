import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';

class Option extends StatelessWidget {
  final String optionName;
  final VoidCallback optionItem;
  final IconData icons;

  const Option({
    super.key,
    required this.optionName,
    required this.optionItem,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.horizontal(),
          color: Colors.transparent,
          child: InkWell(
            onTap: optionItem,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(icons, color: AppColor.primary, size: 24),
                      const SizedBox(width: 20),
                      Text(
                        optionName,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 1,
          indent: 20,
          endIndent: 10,
          color: AppColor.primary,
        ),
      ],
    );
  }
}
