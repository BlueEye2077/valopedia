import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:valopedia/business_logic/cubit/favourites/favourites_cubit.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/data/models/weapon/weapon.dart';
import 'package:valopedia/presentation/widgets/custom_sliver_app_bar.dart';
import 'package:valopedia/presentation/widgets/details_divider.dart';
import 'package:valopedia/presentation/widgets/section_title.dart';

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

                child: FadeInImage.memoryNetwork(
                  // width: double.infinity,
                  // height: double.infinity,
                  placeholder: kTransparentImage,
                  image: weapon.displayIcon!,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverBody() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          margin: const .symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 20),

              _buildWeaponSectionTitle("Statistics"),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: .start,
                children: [
                  Expanded(
                    child: _buildStatisticsCard(
                      "Fire Rate",
                      weapon.weaponStats!.fireRate.toString(),
                      "rds/sec",
                      Icons.local_fire_department,
                    ),
                  ),
                  Expanded(
                    child: _buildStatisticsCard(
                      "Reload",
                      weapon.weaponStats!.reloadTimeSeconds.toString(),
                      "seconds",
                      Icons.replay_outlined,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: .start,
                children: [
                  Expanded(
                    child: _buildStatisticsCard(
                      "Equip",
                      weapon.weaponStats!.equipTimeSeconds.toString(),
                      "seconds",
                      Icons.watch_later,
                    ),
                  ),
                  Expanded(
                    child: _buildStatisticsCard(
                      "Zoom",
                      "${weapon.weaponStats!.magazineSize.toString()}x",
                      "magnification",
                      RpgAwesome.targeted,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const DetailsDivider(),
              const SizedBox(height: 6),
              const SectionTitle(title: "Damage Ranges", textAlign: .left),
              const SizedBox(height: 12),
              _buildDamageRangesTable(),
              const DetailsDivider(),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildStatisticsCard(
    String title,
    String statistics,
    String unit,
    IconData icon,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(89, 178, 180, 188)),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      elevation: 3,
      color: const Color(0xFF1F2B38),
      child: Container(
        width: .infinity,
        // height: height,
        margin: const .all(12),
        child: Column(
          crossAxisAlignment: .start,

          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              mainAxisSize: .max,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: MyColors.mySilver),
                  textAlign: .start,
                ),
                Icon(icon, color: MyColors.myRed, size: 24),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              statistics,
              style: const TextStyle(color: MyColors.myWhite, fontSize: 24),
              textAlign: .start,
            ),
            const SizedBox(height: 8),
            Text(
              unit,
              style: const TextStyle(color: MyColors.mySilver),
              textAlign: .start,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeaponSectionTitle(String title) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        SectionTitle(title: title),
        TextButton(
          onPressed: () {},
          child: const Text(
            "View all",
            style: TextStyle(color: MyColors.myWhite),
          ),
        ),
      ],
    );
  }

  Widget _buildDamageRangesTable() {
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
        ...weapon.weaponStats!.damageRanges!.map(
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
