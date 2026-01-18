import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';
import 'package:little_lemon_flutter/widget/home_screen/category_section.dart';
import 'package:little_lemon_flutter/widget/home_screen/greeting_home_screen.dart';
import 'package:little_lemon_flutter/widget/home_screen/header_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              HeaderHome(
                image: "assets/Logo.png",
                profileImage: "assets/Profile.png",
                onProfileTap: () {
                  setState(() {
                    print("context.go('/profile')");
                  });
                },
              ),
              const SizedBox(height: 17),
              GreetingHomeScreen(
                Header: "Little Lemon",
                subHeader: "Chicago",
                textMessage:
                    "We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.",
                image: "assets/hero.png",
                hint: "Search Menu",
                searchButton: () => print("search screen"),
                Icons: Icons.search,
              ),
              const SizedBox(height: 15),
              CategorySections(
                title: "ORDER FOR DELIVERY",
                categories: ['all', 'Starters', 'Desserts', 'Mains'],
                onSelect: (value) {
                  print("done");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
