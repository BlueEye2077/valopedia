import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../data/models/agent/ability.dart';

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
        fontWeight: .bold,
        fontSize: 13
        ,
      ),
    );
  }
}
