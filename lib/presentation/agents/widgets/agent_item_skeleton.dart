import 'package:flutter/material.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/my_fonts.dart';

class AgentItemSkeleton extends StatelessWidget {
  const AgentItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColors.myRed, Colors.transparent],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [MyColors.myGrey, Colors.transparent],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 6, 0, 6),
              child: const RotatedBox(
                quarterTurns: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Duelist",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: MyFonts.fontDrukWideStyle,
                    ),
                    Text(
                      "GEKKO",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: MyFonts.fontDrukWideOutlinedStyle,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(child: Container(color: MyColors.myGrey)),
          ],
        ),
      ),
    );
  }
}
