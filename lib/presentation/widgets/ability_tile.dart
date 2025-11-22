import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/ability.dart';

class AbilityTile extends StatelessWidget {
  final Ability ability;

  const AbilityTile({super.key, required, required this.ability});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(ability.displayIcon!, alignment: .topCenter),
      title: Text(ability.displayName!),
      subtitle: Text(ability.description!),
      titleTextStyle: const TextStyle(
        color: MyColors.myRed,
        fontSize: 24,
        fontWeight: .bold,
      ),
      subtitleTextStyle: const TextStyle(
        color: MyColors.mySilver,
        fontSize: 14,
      ),
    );
  }
}
