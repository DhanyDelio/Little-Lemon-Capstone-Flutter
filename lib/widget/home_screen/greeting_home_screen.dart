import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';

class GreetingHomeScreen extends StatelessWidget {
  final String Header;
  final String subHeader;
  final String textMessage;
  final String image;
  final String hint;
  final VoidCallback searchButton;
  final IconData Icons;

  const GreetingHomeScreen({
    super.key,
    required this.Header,
    required this.subHeader,
    required this.textMessage,
    required this.image,
    required this.hint,
    required this.searchButton,
    required this.Icons,
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Little ',
                          style: TextStyle(
                            color: AppColor.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text: 'Lemon',
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, left: 15, top: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    image,
                    width: 135,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColor.white,
                hintText: hint,
                prefixIcon: Icon(Icons, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              ),

              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
