import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/weapon/weapon.dart';
import 'widgets/skin_card_item.dart';

class AllWeaponSkinsScreen extends StatelessWidget {
  final Weapon weapon;
  const AllWeaponSkinsScreen({super.key, required this.weapon});

  Widget _buildSkinsGrid() {
    final List<WeaponSkin> skins = weapon.skins!
        .where((skin) => skin.displayIcon != null)
        .toList();
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            padding: const .all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              return SkinCardItem(skin: skins[index]);
            },
            itemCount: skins.length,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${weapon.displayName.toString()} Skins",
          style: const TextStyle(color: MyColors.myWhite),
        ),
        backgroundColor: MyColors.myDarkRed,
        iconTheme: const IconThemeData(color: MyColors.myWhite),
      ),
      body: _buildSkinsGrid(),
    );
  }
}
