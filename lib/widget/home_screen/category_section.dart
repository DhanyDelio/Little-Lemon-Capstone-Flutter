import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';

class CategorySections extends StatelessWidget {
  final String title;
  final List<String> categories;
  final Function(String) onSelect;

  const CategorySections({
    super.key,
    required this.title,
    required this.categories,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: OutlinedButton(
                    onPressed: () => onSelect(categories[index]),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey[400],
                      side: BorderSide.none,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyle(color: AppColor.black),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
