import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/favourites/favourites_cubit.dart';
import '../../constants/strings.dart';
import '../../data/models/weapon/weapon.dart';
import '../common/custom_sliver_app_bar.dart';
import '../common/divider_with_space.dart';
import '../common/section_title.dart';
import 'widgets/damage_ranges_table.dart';
import 'widgets/no_weapon_stats.dart';
import 'widgets/skins_carousel.dart';
import 'widgets/stats_snapshot.dart';
import 'widgets/weapon_section_title.dart';

class WeaponDetailsScreen extends StatelessWidget {
  final Weapon weapon;
  const WeaponDetailsScreen({super.key, required this.weapon});

  Widget _flexibleSpaceBarBackground() {
    return Hero(
      tag: weapon.uuid!,
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          alignment: .center,
          children: [
            Image.asset(
              "assets/images/backgrounds/weapon_background.jpg",
              fit: .cover,
              height: .infinity,
              width: .infinity,
            ),

            Padding(
              padding: const .all(12),
              child: CachedNetworkImage(
                imageUrl: weapon.displayIcon ?? "",
                fit: BoxFit.cover,
                memCacheHeight: 600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildWeaponStats(WeaponStats weaponStats) {
    return [
      const SizedBox(height: 12),
      WeaponSectionTitle(
        title: "Statistics",
        weapon: weapon,
        route: allWeaponStatsScreen,
      ),
      const SizedBox(height: 12),
      StatsSnapshot(weaponStats: weaponStats),
      const DividerWithSpace(),
      const SectionTitle(title: "Damage Ranges", textAlign: .left),
      const SizedBox(height: 12),
      DamageRangesTable(weaponStats: weaponStats),
    ];
  }

  Widget _buildSliverBody() {
    var weaponStats = weapon.weaponStats;
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          margin: const .symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              if (weaponStats != null)
                ..._buildWeaponStats(weaponStats)
              else
                const NoWeaponStats(),

              const DividerWithSpace(),
              WeaponSectionTitle(
                title: "Skins",
                weapon: weapon,
                route: allWeaponSkinsScreen,
              ),
              const SizedBox(height: 12),

              SkinsCarousel(weapon: weapon),
            ],
          ),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavouritesCubit<Weapon>, FavouritesState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                item: weapon,
                flexibleSpaceBarBackground: _flexibleSpaceBarBackground,
                expandedHeight: 400,
                title: weapon.displayName!,
              ),
              _buildSliverBody(),
            ],
          );
        },
      ),
    );
  }
}
