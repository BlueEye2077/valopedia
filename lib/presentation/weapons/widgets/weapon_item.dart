import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';
import '../../../data/models/weapon/weapon.dart';

class WeaponItem extends StatelessWidget {
  final Weapon weapon;

  const WeaponItem({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, weaponDetailsScreen, arguments: weapon),
      child: Hero(
        tag: weapon.uuid!,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: .infinity,
            height: .infinity,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blueGrey),
            ),
            margin: const .all(6),
            child: Stack(
              alignment: .center,

              children: [
                Image.asset(
                  "assets/images/backgrounds/weapon_background.jpg",
                  fit: .cover,
                  height: .infinity,
                  width: .infinity,
                ),

                Padding(
                  padding: const .all(12),
                  child: CachedNetworkImage(
                    imageUrl: weapon.displayIcon!,
                    fit: BoxFit.cover,
                    memCacheHeight: 600,
                  ),
                ),
                Positioned(
                  bottom: 2,
                  left: 6,
                  right: 6,
                  child: Text(
                    weapon.displayName!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: MyColors.myWhite,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const .all(4),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(84, 96, 125, 139),
                    ),
                    child: Text(
                      "${weapon.shopData != null ? weapon.shopData!.cost.toString() : 'Owned'} \$",
                      style: const TextStyle(
                        fontSize: 18,
                        color: MyColors.myWhite,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
