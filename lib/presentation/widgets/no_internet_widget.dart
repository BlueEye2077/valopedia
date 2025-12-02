import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/my_colors.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const .all(6),
      child: Center(
        child: Column(
          mainAxisSize: .min,
          children: [
            SvgPicture.asset(
              "assets/images/svgs/no_internet.svg",
              fit: .cover,
              height: 300,
            ),
            const SizedBox(height: 15),
            const Text(
              "No internet, Try again...",
              textAlign: .center,
              style: TextStyle(fontSize: 32, color: MyColors.myWhite),
            ),
          ],
        ),
      ),
    );
  }
}
