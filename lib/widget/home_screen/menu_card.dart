import 'package:flutter/material.dart';
import 'package:little_lemon_flutter/models/menu_item.dart';
import 'package:shimmer/shimmer.dart';

class MenuCard extends StatelessWidget {
  final MenuItem item;

  const MenuCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildMenuInfo()),
            const SizedBox(width: 16),
            _buildMenuImage(),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          item.description,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 16),
        Text(
          "\$${item.price}",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget _buildMenuImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        item.image,
        width: 90,
        height: 90,
        fit: BoxFit.cover,
        errorBuilder: (context, error, StackTrace) =>
            const Icon(Icons.broken_image, size: 90),
        loadingBuilder: (context, image, loadingProgress) {
          if (loadingProgress == null) {
            return image;
          }
          return _buildImageSkeleton();
        },
      ),
    );
  }

  Widget _buildImageSkeleton() {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ttb,
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
