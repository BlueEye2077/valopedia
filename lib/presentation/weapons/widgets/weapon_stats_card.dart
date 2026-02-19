import 'package:flutter/material.dart';
import '../../../constants/my_colors.dart';

class WeaponStatsCard extends StatelessWidget {
  final String title;
  final String statistics;
  final String unit;
  final IconData icon;
  final double? fontSize;

  const WeaponStatsCard(
    this.title,
    this.statistics,
    this.unit,
    this.icon,
     {
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(89, 178, 180, 188)),
        borderRadius: BorderRadiusGeometry.circular(12),
      ),
      elevation: 3,
      color: const Color(0xFF1F2B38),
      child: Container(
        width: .infinity,
        height: 100,
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
                const SizedBox(width: 6),
                Icon(icon, color: MyColors.myRed, size: 24),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              statistics,
              style: TextStyle(color: MyColors.myWhite, fontSize: fontSize ?? 24),
              textAlign: .start,
            ),
            const SizedBox(height: 8),
            if (unit != "")
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
}
