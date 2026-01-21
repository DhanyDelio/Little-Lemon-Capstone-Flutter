import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';
import 'package:little_lemon_flutter/widget/home_screen/category_section.dart';
import 'package:little_lemon_flutter/widget/home_screen/greeting_home_screen.dart';
import 'package:little_lemon_flutter/widget/home_screen/header_home.dart';
import 'package:little_lemon_flutter/widget/home_screen/menu_card.dart';
import '../controller/menu_controller.dart' as custom;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final custom.MenuController _menuController = custom.MenuController();
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'all';

  @override
  void initState() {
    super.initState();
    _menuController.fetchMenuData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SafeArea(
        child: ListenableBuilder(
          listenable: _menuController,
          builder: (context, child) {
            return SingleChildScrollView(
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
                    controller: _searchController,
                    onSearchChanged: (value) {
                      _menuController.searchInput(value);
                    },
                    searchButton: () => print("search screen"),
                    Icons: Icons.search,
                  ),
                  const SizedBox(height: 15),
                  CategorySections(
                    selectedCategory: _selectedCategory,
                    onSelect: (value) {
                      setState(() {
                        _selectedCategory = value;
                        _searchController.clear();
                      });
                      FocusScope.of(context).unfocus();
                      _menuController.filterByCategory(value);
                    },
                  ),
                  const SizedBox(height: 8),
                  _buildMenuContent(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMenuContent() {
    if (_menuController.status == custom.MenuStatus.loading) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (_menuController.status == custom.MenuStatus.error) {
      return Center(child: Text("Error : ${_menuController.errorMessage}"));
    }
    if (_menuController.status == custom.MenuStatus.empty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 80),
        child: Center(
          child: Text(
            "for now isn't ready",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
            ),
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: _menuController.listMenu.length,
        itemBuilder: (context, index) {
          return MenuCard(item: _menuController.listMenu[index]);
        },
      );
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
