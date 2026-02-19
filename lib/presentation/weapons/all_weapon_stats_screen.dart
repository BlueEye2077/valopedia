import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import '../../constants/my_colors.dart';
import '../../data/models/weapon/weapon.dart';
import '../common/details_divider.dart';
import '../common/section_title.dart';
import 'widgets/stats_snapshot.dart';
import 'widgets/weapon_stats_card.dart';

class AllWeaponStatsScreen extends StatelessWidget {
  final Weapon weapon;
  const AllWeaponStatsScreen({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          weapon.displayName.toString(),
          style: const TextStyle(color: MyColors.myWhite),
        ),
        backgroundColor: MyColors.myDarkRed,
        iconTheme: const IconThemeData(color: MyColors.myWhite),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const .symmetric(vertical: 12, horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: .infinity,
                child: Image.network(
                  weapon.killStreamIcon.toString(),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 16),
              SectionTitle(title: "All ${weapon.displayName} Stats"),
              const SizedBox(height: 12),
              const DetailsDivider(),
              const SizedBox(height: 12),

              // stats snapshot
              StatsSnapshot(weaponStats: weapon.weaponStats!),
              Row(
                mainAxisAlignment: .start,
                children: [
                  // run speed
                  if (weapon.weaponStats!.runSpeedMultiplier != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "Run Speed",
                        "${(weapon.weaponStats!.runSpeedMultiplier! * 100).toString()}%",
                        "",
                        FontAwesome5.running,
                      ),
                    ),

                  // first shot accuracy
                  if (weapon.weaponStats!.firstBulletAccuracy != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "1st Shot\nAccuracy",
                        weapon.weaponStats!.firstBulletAccuracy.toString(),
                        "",
                        Icons.center_focus_weak_sharp,
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: .start,
                children: [
                  // shotgun pellet count
                  if (weapon.weaponStats!.shotgunPelletCount != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "Shotgun Pellet\nCount",
                        weapon.weaponStats!.shotgunPelletCount.toString(),
                        "",
                        RpgAwesome.cannon_shot,
                      ),
                    ),

                  // wall penetration
                  if (weapon.weaponStats!.wallPenetration != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "Wall Penetration",
                        weapon.weaponStats!.wallPenetration!.split("::")[1],
                        "",
                        Icons.blinds_closed,
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: .start,
                children: [
                  // feature
                  if (weapon.weaponStats!.feature != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "Feature",
                        weapon.weaponStats!.feature!.split("::")[1],
                        "",
                        RpgAwesome.alien_fire,
                        fontSize: 23,
                      ),
                    ),

                  // alt fire type
                  if (weapon.weaponStats!.altFireType != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "Alt Fire Type",
                        weapon.weaponStats!.altFireType!.split("::")[1],
                        "",
                        RpgAwesome.frostfire,
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisAlignment: .start,
                children: [
                  // fire mode
                  if (weapon.weaponStats!.fireMode != null)
                    Expanded(
                      child: WeaponStatsCard(
                        "Fire Mode",
                        weapon.weaponStats!.fireMode!.split("::")[1],
                        "",
                        RpgAwesome.fire_ring,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
