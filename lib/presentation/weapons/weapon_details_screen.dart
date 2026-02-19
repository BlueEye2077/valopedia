import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

import '../../business_logic/cubit/favourites/favourites_cubit.dart';
import '../../constants/my_colors.dart';
import '../../constants/strings.dart';
import '../../data/models/weapon/weapon.dart';
import '../common/custom_sliver_app_bar.dart';
import '../common/details_divider.dart';
import '../common/section_title.dart';
import 'widgets/skin_card_item.dart';
import 'widgets/stats_snapshot.dart';
import 'widgets/weapon_section_title.dart';

class WeaponDatailsScreen extends StatelessWidget {
  final Weapon weapon;
  const WeaponDatailsScreen({super.key, required this.weapon});

  Widget _flexibleSpaceBarBackground() {
    return Hero(
      tag: weapon.uuid!,
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          child: Stack(
            alignment: .center,
            children: [
              Image.asset(
                "assets/images/backgrounds/background1.jpg",
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
      ),
    );
  }

  Widget _buildSliverBody() {
    var weaponStats = weapon.weaponStats;
    return SliverList(
      delegate: SliverChildListDelegate([
        weaponStats != null
            ? Container(
                margin: const .symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const SizedBox(height: 20),

                    WeaponSectionTitle(
                      title: "Statistics",
                      weapon: weapon,
                      route: allWeaponStatsScreen,
                    ),
                    const SizedBox(height: 12),

                    StatsSnapshot(weaponStats: weaponStats),

                    const SizedBox(height: 6),
                    const DetailsDivider(),
                    const SizedBox(height: 6),
                    const SectionTitle(
                      title: "Damage Ranges",
                      textAlign: .left,
                    ),
                    const SizedBox(height: 12),
                    _buildDamageRangesTable(weaponStats),
                    const SizedBox(height: 6),
                    const DetailsDivider(),
                    const SizedBox(height: 6),

                    //todo: add skins
                    WeaponSectionTitle(
                      title: "Skins",
                      weapon: weapon,
                      route: allWeaponSkinsScreen,
                    ),

                    const SizedBox(height: 12),

                    _buildSkinsCarousel(),
                  ],
                ),
              )
            : _buildNoWeaponStatsWidget(),
      ]),
    );
  }

  Widget _buildDamageRangesTable(WeaponStats weaponStats) {
    return Table(
      defaultVerticalAlignment: .middle,
      columnWidths: const {0: IntrinsicColumnWidth()},
      border: TableBorder.all(
        color: MyColors.mySilver,
        borderRadius: BorderRadius.circular(12),
        width: 1,
      ),
      children: [
        // Header row
        TableRow(
          decoration: const BoxDecoration(color: Color(0xFF0E232C)),
          children: [
            const Text(
              "Range",
              style: TextStyle(color: MyColors.mySilver, fontSize: 18),
              textAlign: .center,
            ),
            _buildHeaderCell("Head", RpgAwesome.death_skull, 18),
            _buildHeaderCell("Body", Icons.accessibility_new, 18),
            _buildHeaderCell("Leg", FontAwesome5.running, 18),
          ],
        ),

        // BodyRows
        ...weaponStats.damageRanges!.map(
          (damageRangeArea) => TableRow(
            children: [
              _buildBodyCell(
                "${damageRangeArea.rangeStartMeters} - ${damageRangeArea.rangeEndMeters}m",
                18,
              ),

              _buildBodyCell(damageRangeArea.headDamage.toString(), 18),
              _buildBodyCell(damageRangeArea.bodyDamage.toString(), 18),
              _buildBodyCell(damageRangeArea.legDamage.toString(), 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderCell(String title, IconData icon, double fontSize) {
    return Padding(
      padding: const .symmetric(vertical: 12, horizontal: 8),
      child: Column(
        children: [
          Icon(icon, color: MyColors.myRed),
          const SizedBox(height: 3),
          Text(
            title,
            style: TextStyle(color: MyColors.mySilver, fontSize: fontSize),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyCell(String title, double fontSize) {
    return Padding(
      padding: const .symmetric(vertical: 16, horizontal: 10),
      child: Text(
        title,
        style: TextStyle(color: MyColors.myWhite, fontSize: fontSize),
        textAlign: .center,
      ),
    );
  }

  Widget _buildNoWeaponStatsWidget() {
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

  Widget _buildSkinsCarousel() {
    final List<Skins> skins = weapon.skins!
        .where(
          (skin) =>
              skin.displayIcon != null &&
              !skin.displayName!.contains("Standard"),
        )
        .toList();
    return CarouselSlider.builder(
      itemCount: skins.length,
      itemBuilder: (context, index, realIndex) {
        return SkinCardItem(skin: skins[index]);
      },
      options: CarouselOptions(
        // height: 400,
        aspectRatio: 3 / 2,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
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
