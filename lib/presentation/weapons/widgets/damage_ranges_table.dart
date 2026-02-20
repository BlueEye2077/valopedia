import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import '../../../constants/my_colors.dart';
import '../../../data/models/weapon/weapon.dart';

class DamageRangesTable extends StatelessWidget {
  final WeaponStats weaponStats;
  const DamageRangesTable({super.key, required this.weaponStats});

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
}
