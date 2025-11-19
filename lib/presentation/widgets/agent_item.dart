import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valopedia/constants/my_colors.dart';
import 'package:valopedia/constants/my_fonts.dart';

import 'package:valopedia/data/models/agent.dart';

class AgentItem extends StatelessWidget {
  final Agent agent;

  const AgentItem({super.key, required this.agent});

  Widget buildRotatedText() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: RotatedBox(
        quarterTurns: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              agent.role?["displayName"] ?? "Unknown",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: MyFonts.fontDrukWideStyle,
            ),
            Text(
              agent.displayName ?? "Unknown",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: MyFonts.fontDrukWideOutlinedStyle,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAgentImage() {
    return Expanded(
      child: SizedBox(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image.network(agent.background ?? ""),

            CachedNetworkImage(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              //   filterQuality: FilterQuality.low,
              fit: BoxFit.cover,
              imageUrl:
                  agent.fullPortrait ??
                  agent.fullPortraitV2 ??
                  agent.bustPortrait ??
                  "",

              errorWidget: (context, url, error) => const Icon(Icons.error),

              placeholder: (context, url) =>
                  Image.asset("assets/images/jet.gif", fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColors.myRed, Colors.transparent],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
        // border: Border.all(width: 1),
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
          children: [buildRotatedText(), buildAgentImage()],
        ),
      ),
    );
  }
}
