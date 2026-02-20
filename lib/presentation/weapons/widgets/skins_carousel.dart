import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../data/models/weapon/weapon.dart';
import 'skin_card_item.dart';

class SkinsCarousel extends StatelessWidget {
  const SkinsCarousel({
    super.key,
    required this.weapon,
  });

  final Weapon weapon;

  @override
  Widget build(BuildContext context) {
    final List<WeaponSkin> skins = weapon.skins!
        .where(
          (skin) =>
              skin.displayIcon != null &&
              !skin.displayName!.contains("Standard"),
        )
        .toList();
    return CarouselSlider.builder(
      itemCount: skins.length,
      itemBuilder: (context, index, realIndex) {
        return SkinCardItem(skin: skins[index]);
      },
      options: CarouselOptions(
        aspectRatio: 3 / 2,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}