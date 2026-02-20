import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';

class NoWeaponStats extends StatelessWidget {
  const NoWeaponStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .symmetric(vertical: 12, horizontal: 16),
      child: const Center(
        child: Text(
          "Just the good old knife",
          style: TextStyle(color: MyColors.myWhite, fontSize: 24),
        ),
      ),
    );
  }
}