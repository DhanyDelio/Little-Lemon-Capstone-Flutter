import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:little_lemon_flutter/models/profile_dashboard.dart';
import 'package:little_lemon_flutter/utils/app_color.dart';
import 'package:little_lemon_flutter/controller/profile_controller.dart';
import 'package:shimmer/shimmer.dart';

class InformationHeader extends StatelessWidget {
  final String headerText;
  final String profileImage;
  final ProfileController controller;

  const InformationHeader({
    super.key,
    this.headerText = 'User Profile',
    this.profileImage = 'assets/Profile.png',
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final user = controller.userProfile;

    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                onPressed:() {
                  if(Navigator.canPop(context)){
                    Navigator.pop(context);
                  } else {
                    debugPrint("lower level stack");
                  }
                },
                icon: const Icon(Icons.arrow_back, size: 22),
              ),
              const SizedBox(width: 5),
              Text(
                headerText,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              CircleAvatar(
                radius: 42,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(profileImage),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.isLoading
                        ? _buildSkeletonText(width: 150, height: 16)
                        : Text(
                            user?.email ?? 'No Email',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColor.black,
                            ),
                          ),
                    const SizedBox(height: 5),
                    controller.isLoading
                        ? _buildSkeletonText(width: 120, height: 16)
                        : Text(
                            user?.fullname ?? 'No Name',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: AppColor.black,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildSkeletonText({required double width, required double height}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}
