import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';
import '../../data/models/weapon/weapon.dart';
import 'section_title.dart';

class WeaponSectionTitle extends StatelessWidget {
  final String title;
  final Weapon weapon;
  final String route;
  const WeaponSectionTitle({super.key, required this.title, required this.weapon, required this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        SectionTitle(title: title),
        TextButton(
          onPressed: () => Navigator.pushNamed(
            context,
            route,
            arguments: weapon,
          ),
          child: const Text(
            "View all",
            style: TextStyle(color: MyColors.myWhite),
          ),
        ),
      ],
    );
  }
}