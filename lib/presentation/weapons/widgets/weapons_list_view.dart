import 'package:flutter/material.dart';

import '../../../data/models/weapon/weapon.dart';
import 'weapon_item.dart';

class WeaponsListView extends StatelessWidget {
  final List<Weapon> weapons;

  const WeaponsListView({super.key, required this.weapons});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const .all(4),
      child: Column(
        children: [
          GridView.builder(
            physics: const ClampingScrollPhysics(),
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
            shrinkWrap: true,
            cacheExtent: 2000,
            itemCount: weapons.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => WeaponItem(weapon: weapons[index]),
          ),
          const SizedBox(height: 75,)
        ],
      ),
    );
  }
}
