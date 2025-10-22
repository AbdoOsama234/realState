import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/favorite_button.dart';
import '../../favorite/cubit/favorite_cubit.dart';

class HeaderHero extends StatelessWidget {
  const HeaderHero({super.key});

  @override
  Widget build(BuildContext context) {
    const propertyId = "house_1"; // 👈 ده المعرّف الفريد للعقار مثلاً

    return BlocBuilder<FavoriteCubit, Set<String>>(
      builder: (context, favorites) {
        final isFav = favorites.contains(propertyId);

        return Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          child: Stack(
            children: [
              /// 🖼️ الصورة الخلفية
              Image.asset(
                "assets/test/house3.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),

              /// 🔖 الوسم الأعلى اليمين
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xfff3f0f0).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const CustomText(
                    text: "#الأكثر بحثًا",
                    color: Colors.white,
                    size: 12,
                    fontFamily: "Cairo",
                  ),
                ),
              ),

              /// ⭐ التقييم الأعلى اليسار
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black45.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: const CustomText(
                    text: "⭑ 4.6",
                    color: Colors.white,
                    size: 12,
                    fontFamily: "Cairo",
                  ),
                ),
              ),

              /// ❤️ زر المفضلة (يتصل بـ Cubit)
              Positioned(
                bottom: 10,
                left: 10,
                child: FavoriteButton(
                  isFavorite: isFav,
                  onTap: () {
                    context.read<FavoriteCubit>().toggle(propertyId);
                  },
                  backgroundColor: Colors.black38,
                ),
              ),

              /// 💬 النصوص (السعر والوصف والموقع)
              Positioned(
                bottom: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CustomText(
                      text: "ريال 250,000",
                      color: Colors.white70,
                      weight: FontWeight.bold,
                      size: 22,
                      fontFamily: "Cairo",
                    ),
                    CustomText(
                      text: "منزل بتصميم عصري وموقع مميز",
                      color: Colors.grey,
                      weight: FontWeight.w500,
                      size: 16,
                      fontFamily: "Cairo",
                    ),
                    Row(
                      children: [
                        Gap(5),
                        CustomText(
                          text: "الرياض - حي النرجس",
                          color: Colors.grey,
                          size: 14,
                          weight: FontWeight.w500,
                          fontFamily: "Cairo",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
