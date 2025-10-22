import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:real_estate/features/home/widgets/header_hero.dart';
import 'package:real_estate/shared/favorite_button.dart';

import '../../../shared/custom_text.dart';
import '../widgets/user_header.dart';
import '../widgets/card_widgets.dart';
import '../widgets/slider_section.dart';
import '../model/card_item.dart';
import '../animation/animate_route.dart';
import 'more_view.dart';
import '../../favorite/cubit/favorite_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  // هنا داتا مؤقتة (بدل API). لاحقًا خليها تيجي من Repository.
  List<CardItem> get premiumUnits => const [
    CardItem(
      id: "u1",
      price: "80,554",
      title: "شقة مطلة على البحر",
      location: "الدمام/الخبر (المنطقة الشرقية، ساحل الخليج العربي)",
      images: [
        "assets/test/1797364de6d9a9e8d1ec42b30ae7669e.jpg",
        "assets/test/house1.png",
        "assets/test/Homesea.jpg",
      ],
    ),
    CardItem(
      id: "u2",
      price: "250,000",
      title: "منزل بتصميم عصري وموقع مميز",
      location: "الرياض - حي النرجس",
      images: ["assets/test/house3.png"],
    ),
    CardItem(
      id: "u3",
      price: "250,000",
      title: "شقه مطله علي البحر",
      location: "الدمام/الخبر (المنطقة الشرقية، ساحل الخليج العربي)",
      images: ["assets/test/fa83556bd91b050ce9bbe45f8ee9b330.jpg"],
    ),
  ];

  // أمثلة لسلايدر
  List<CardItem> get familyUnits => const [
    CardItem(id: "f1", price: "250,000", title: "منزل بتصميم عصري", location: "الرياض - حي النرجس", images: ["assets/test/Dammam-hotel-apartments-overlooking-the-sea-1-1024x683.jpg"]),
    CardItem(id: "f2", price: "180,000", title: "شقة مطلة على البحر", location: "الدمام - الخبر", images: ["assets/test/home_in_sea.jpg"]),
    CardItem(id: "f3", price: "430,000", title: "فيلا راقية بتشطيب فاخر", location: "جدة - حي الشاطئ", images: ["assets/test/house1.png"]),
  ];

  List<CardItem> get economyUnits => const [
    CardItem(id: "e1", price: "160,000", title: "استوديو رايق", location: "الدمام - حي المزروعية", images: ["assets/test/house1.png"]),
    CardItem(id: "e2", price: "130,000", title: "شقة اقتصادية", location: "الرياض - حي اليرموك", images: ["assets/test/house3.png"]),
    CardItem(id: "e3", price: "120,000", title: "سكن شبابي", location: "جدة - الصفا", images: ["assets/test/home_in_sea.jpg"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: const UserHeader(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Gap(15),
              const HeaderHero(),
              const Gap(20),

              // العنوان + المزيد
              Row(
                children: [
                  const CustomText(
                    text: "الوحدات الراقية",
                    color: Colors.white70,
                    size: 20,
                    weight: FontWeight.w600,
                    fontFamily: "Cairo",
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(createSlideUpRoute(MoreView(items: premiumUnits)));
                    },
                    child: const Row(
                      children: [
                        CustomText(text: "المزيد", color: Colors.white70, size: 12, weight: FontWeight.w600, fontFamily: "Cairo"),
                        Gap(4),
                        Icon(CupertinoIcons.right_chevron, color: Colors.white70, size: 14),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(20),

              // أول كارد (يراعي Cubit)
              BlocBuilder<FavoriteCubit, Set<String>>(
                builder: (context, favs) {
                  final first = premiumUnits.first;
                  final isFav = favs.contains(first.id);
                  return CustomCard(
                    price: first.price,
                    title: first.title,
                    location: first.location,
                    images: first.images,
                    isFavorite: isFav,
                    onFavoriteTap: () => context.read<FavoriteCubit>().toggle(first.id),
                  );
                },
              ),

              const Gap(16),

              // سلايدر: مساحات عائلية كبيرة
              SliderSection(
                title: "مساحات عائلية كبيرة",
                items: familyUnits,
                onMoreTap: () => Navigator.push(context, createSlideUpRoute(MoreView(items: familyUnits))),
                onCardTap: (item) {
                  // افتح تفاصيل العنصر لو حابب
                },
              ),

              const Gap(16),

              // سلايدر: خيارات اقتصادية
              SliderSection(
                title: "خيارات اقتصادية",
                items: economyUnits,
                onMoreTap: () => Navigator.push(context, createSlideUpRoute(MoreView(items: economyUnits))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

