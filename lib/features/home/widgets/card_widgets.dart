import 'package:flutter/material.dart';
import 'package:real_estate/shared/custom_text.dart';
import '../../../shared/favorite_button.dart';

class CustomCard extends StatelessWidget {
  final String price;
  final String title;
  final String location;
  final List<String> images;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;

  const CustomCard({
    super.key,
    required this.price,
    required this.title,
    required this.location,
    required this.images,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ الصور المتداخلة + زر المفضلة
          SizedBox(
            width: 240,
            height: 160,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ...List.generate(images.length, (i) {
                  return Positioned(
                    top: i * 5.0,
                    left: i * 10.0,
                    child: _buildImage(images[i]),
                  );
                }),

                // ❤️ زر المفضلة فوق يمين
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: FavoriteButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap ?? () {},
                    backgroundColor: Colors.brown,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // 📝 التفاصيل
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "$price ريال",
                  color: Colors.white,
                  size: 20,
                  weight: FontWeight.bold,
                  fontFamily: "Cairo",
                ),
                const SizedBox(height: 8),
                CustomText(
                  size: 16,
                  text: title,
                  weight: FontWeight.w500,
                  color: Colors.white70,
                  fontFamily: "Cairo",
                ),
                const SizedBox(height: 4),
                CustomText(
                  text: location,
                  color: Colors.white54,
                  size: 14,
                  fontFamily: "Cairo",
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String path) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: 218,
        height: 150,
        child: Image.asset(path, fit: BoxFit.cover),
      ),
    );
  }
}
