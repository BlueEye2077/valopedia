import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';

class WeaponItem extends StatelessWidget {
  final Weapon weapon;

  const WeaponItem({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blueGrey),
      ),
      margin: const .all(6),
      child: Stack(
        alignment: .center,
        children: [
          Image.asset(
            "assets/images/backgrounds/background.jpg",
            fit: .cover,
            height: .infinity,
            width: .infinity,
          ),

          Padding(
            padding: const .all(12),
            child: CachedNetworkImage(
              imageUrl: weapon.displayIcon!,
              fit: .cover,

              // placeholder: (context, url) => Image.asset(
              //   "assets/images/backgrounds/weapon_placeholder.gif",
              //   fit: .cover,
              //   width: .infinity,
              //   height: .infinity,
              // ),
            ),
          ),
          Positioned(
            bottom: 2,
            left: 6,
            child: Column(
              crossAxisAlignment: .start,

              children: [
                Text(
                  weapon.displayName!,
                  style: const TextStyle(
                    fontSize: 18,
                    // fontVariations: [FontVariation.italic(0.129)],
                    color: MyColors.myWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
