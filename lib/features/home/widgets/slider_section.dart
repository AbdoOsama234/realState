import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../shared/custom_text.dart';
import '../../../shared/favorite_button.dart';
import '../../../core/utils/helpers.dart';
import '../../favorite/cubit/favorite_cubit.dart';
import '../model/card_item.dart';

class SliderSection extends StatelessWidget {
  final String title;
  final List<CardItem> items;
  final VoidCallback? onMoreTap;
  final void Function(CardItem item)? onCardTap; // اختياري

  const SliderSection({
    super.key,
    required this.title,
    required this.items,
    this.onMoreTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: title,
              color: Colors.white70,
              size: 20,
              weight: FontWeight.w600,
              fontFamily: "Cairo",
            ),
            const Spacer(),
            GestureDetector(
              onTap: onMoreTap,
              child: const Row(
                children: [
                  CustomText(
                    text: "المزيد",
                    color: Colors.white70,
                    size: 12,
                    weight: FontWeight.w600,
                    fontFamily: "Cairo",
                  ),
                  Gap(4),
                  Icon(CupertinoIcons.right_chevron, color: Colors.white70, size: 14),
                ],
              ),
            ),
          ],
        ),
        const Gap(16),

        SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => const Gap(12),
            itemBuilder: (context, index) {
              final it = items[index];
              return _SliderCard(
                item: it,
                onTap: () => onCardTap?.call(it),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _SliderCard extends StatelessWidget {
  final CardItem item;
  final VoidCallback? onTap;

  const _SliderCard({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteCubit>();
    final isFavorite = fav.isFav(item.id);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: 280,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 10, offset: const Offset(0, 6))],
              image: DecorationImage(image: providerFromPath(item.images.first), fit: BoxFit.cover),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter, end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
              padding: const EdgeInsets.all(12),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(text: "ريال ${item.price}", color: Colors.white70, size: 16, weight: FontWeight.bold, fontFamily: "Cairo"),
                    const Gap(2),
                    CustomText(text: item.title, color: Colors.white, size: 14, fontFamily: "Cairo", weight: FontWeight.w600),
                    const Gap(2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.location_on_sharp, color: Colors.grey, size: 14),
                        const Gap(4),
                        CustomText(text: item.location, color: Colors.grey, size: 12, fontFamily: "Cairo"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: FavoriteButton(
              isFavorite: isFavorite,
              onTap: () => context.read<FavoriteCubit>().toggle(item.id),
            ),
          ),
        ],
      ),
    );
  }
}
