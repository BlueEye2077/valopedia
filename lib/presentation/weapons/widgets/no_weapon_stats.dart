import 'package:flutter/material.dart';

import '../../../constants/my_colors.dart';

class NoWeaponStats extends StatelessWidget {
  const NoWeaponStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: MyColors.myGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: MyColors.myRed, width: 1.5),
                ),
                title: const Text(
                  "🕵️ YOU FOUND ME",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.myRed,
                    fontSize: 20,
                    fontFamily: 'DrukWide',
                    letterSpacing: 2,
                  ),
                ),
                content: const Text(
                  "Congrats agent, you discovered the secret knife zone. "
                  "No stats here... just vibes 🔪",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: MyColors.mySilver,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                actionsAlignment: MainAxisAlignment.center,
                actions: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: MyColors.myRed,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "I know.",
                      style: TextStyle(
                        color: MyColors.myWhite,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            child: Image.asset(
              "assets/images/backgrounds/good_image.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "Don't worry, it's just a placeholder image...",
            style: TextStyle(color: MyColors.mySilver, fontSize: 24),
            textAlign: .center,
          ),
        ],
      ),
    );
  }
}
