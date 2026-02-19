import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import '../../../data/models/weapon/weapon.dart';
import 'weapon_stats_card.dart';

class StatsSnapshot extends StatelessWidget {
  final WeaponStats weaponStats;
  const StatsSnapshot({super.key, required this.weaponStats});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .start,
          children: [
            if (weaponStats.fireRate != null)
              Expanded(
                child: WeaponStatsCard(
                  "Fire Rate",
                  weaponStats.fireRate.toString(),
                  "rds/sec",
                  Icons.local_fire_department,
                ),
              ),
            if (weaponStats.reloadTimeSeconds != null)
              Expanded(
                child: WeaponStatsCard(
                  "Reload",
                  weaponStats.reloadTimeSeconds.toString(),
                  "seconds",
                  Icons.replay_outlined,
                ),
              ),
          ],
        ),
        Row(
          mainAxisAlignment: .start,
          children: [
            if (weaponStats.equipTimeSeconds != null)
              Expanded(
                child: WeaponStatsCard(
                  "Equip",
                  weaponStats.equipTimeSeconds.toString(),
                  "seconds",
                  Icons.watch_later,
                ),
              ),
            if (weaponStats.magazineSize != null)
              Expanded(
                child: WeaponStatsCard(
                  "Zoom",
                  "${weaponStats.magazineSize.toString()}x",
                  "magnification",
                  RpgAwesome.targeted,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
