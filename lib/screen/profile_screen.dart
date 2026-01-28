import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/controller/profile_controller.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';
import 'package:little_lemon_flutter/widget/profile_screen/information_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  final ProfileController controller = ProfileController();

  Future<void> _loadProfile() async {
    await controller.fetchProfile();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          children: [
            InformationHeader(controller: controller),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }
}
