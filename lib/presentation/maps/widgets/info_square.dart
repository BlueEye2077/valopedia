import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';

class InfoSquare extends StatelessWidget {
  final String title;
  final String data;
  const InfoSquare({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 0.5,
            color: const Color.fromARGB(68, 178, 180, 188),
          ),
        ),
        child: Padding(
          padding: const .all(6),
          child: Center(
            child: Column(
              mainAxisSize: .min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 12, color: MyColors.myRed),
                ),
                const SizedBox(height: 5),
                Text(
                  data,
                  style: const TextStyle(fontSize: 14, color: MyColors.myWhite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
