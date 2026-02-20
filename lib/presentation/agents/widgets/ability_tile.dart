import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';
import '../../../data/models/agent/ability.dart';

class AbilityTile extends StatelessWidget {
  final Ability ability;

  const AbilityTile({super.key, required this.ability});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ability.displayIcon != null
          ? Image.network(
              ability.displayIcon!,
              alignment: .topCenter,
              fit: .cover,
            )
          : Image.asset(
              "assets/images/backgrounds/white_valorant_logo.png",
              alignment: .topCenter,
              fit: .cover,
            ),
      title: Text(ability.displayName!),
      subtitle: Text(ability.description!),
      titleTextStyle: const TextStyle(
        color: MyColors.myRed,
        fontSize: 24,
        fontWeight: .bold,
      ),
      subtitleTextStyle: const TextStyle(
        color: MyColors.mySilver,
        fontWeight: .bold,
        fontSize: 13,
      ),
    );
  }
}
