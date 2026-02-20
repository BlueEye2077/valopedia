import 'package:flutter/material.dart';

import '../../../data/models/agent/ability.dart';
import '../../common/section_title.dart';
import 'ability_tile.dart';

class AbilitiesSection extends StatelessWidget {
  final List<Ability> agentAbilities;
  const AbilitiesSection({super.key, required this.agentAbilities});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .all(12),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          const SectionTitle(title: "Abilities"),
          ...agentAbilities.map(
            (ability) => AbilityTile(ability: ability),
          ),
        ],
      ),
    );
  }
}