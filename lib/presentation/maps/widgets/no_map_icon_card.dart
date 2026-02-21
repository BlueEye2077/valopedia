import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';

class NoMapIconCard extends StatelessWidget {
  const NoMapIconCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.map, size: 100, color: MyColors.myWhite),
            SizedBox(height: 12),
            Text(
              "No Map Images Available",
              style: TextStyle(color: MyColors.myWhite, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
