import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';

class GreetingHomeScreen extends StatelessWidget {
  final String headerPrimary;
  final String headerSecondary;
  final String subHeader;
  final String textMessage;
  final String image;
  final String hint;
  final VoidCallback searchButton;
  final IconData Icons;
  final TextEditingController controller;
  final Function(String) onSearchChanged;

  const GreetingHomeScreen({
    super.key,
    this.headerPrimary = 'Little ',
    this.headerSecondary = 'Lemon',
    this.subHeader = 'Chicago',
    this.textMessage =
        'We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist',
    this.image = 'assets/hero.png',
    this.hint = 'Search Menu',
    required this.searchButton,
    required this.Icons,
    required this.controller,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.primary,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildTextSection()),
              _buildHeroImage(),
            ],
          ),
          _buildSearchBar(),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: headerPrimary,
              style: TextStyle(
                color: AppColor.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: headerSecondary,
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subHeader,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            textMessage,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 15, top: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(image, width: 135, height: 200, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: TextField(
        controller: controller,
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColor.white,
          hintText: hint,
          prefixIcon: Icon(Icons, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),

        textAlign: TextAlign.start,
      ),
    );
  }
}
