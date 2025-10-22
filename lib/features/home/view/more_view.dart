import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../shared/custom_text.dart';
import '../../favorite/cubit/favorite_cubit.dart';
import '../model/card_item.dart';
import '../../../core/utils/helpers.dart';
import '../../../shared/favorite_button.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key, required this.items});
  final List<CardItem> items;

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteCubit>();

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const CustomText(text: "الوحدات الراقية", color: Colors.white, size: 18, fontFamily: "Cairo"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        separatorBuilder: (_, __) => const Gap(12),
        itemBuilder: (context, index) {
          final it = items[index];
          final isFav = fav.isFav(it.id);

          return Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(image: providerFromPath(it.images.first), fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black.withOpacity(0.6), Colors.transparent]),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomText(text: "ريال ${it.price}", color: Colors.white70, size: 18, fontFamily: "Cairo", weight: FontWeight.bold),
                        const Gap(2),
                        CustomText(text: it.title, color: Colors.white, size: 16, fontFamily: "Cairo", weight: FontWeight.w600),
                        const Gap(2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.location_on_sharp, color: Colors.grey, size: 15),
                            const Gap(4),
                            CustomText(text: it.location, color: Colors.grey, size: 13, fontFamily: "Cairo"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10, right: 10,
                child: FavoriteButton(
                  isFavorite: isFav,
                  onTap: () => context.read<FavoriteCubit>().toggle(it.id),
                  backgroundColor: Colors.black38,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
