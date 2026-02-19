import 'package:flutter/material.dart';
import '../../constants/my_colors.dart';

class WeaponItemSkeleton extends StatelessWidget {
  const WeaponItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.blueGrey),
      ),
      margin: const EdgeInsets.all(6),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background placeholder
          Container(color: MyColors.myplaceholderGrey),

          // Weapon name placeholder
          const Positioned(
            bottom: 2,
            left: 6,
            right: 6,
            child: Text(
              "Vandal",
              style: TextStyle(fontSize: 18, color: MyColors.myWhite),
            ),
          ),

          // Price placeholder
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color.fromARGB(84, 96, 125, 139),
              ),
              child: Text(
                "1600 \$",
                style: const TextStyle(fontSize: 18, color: MyColors.myWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
