import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../constants/my_fonts.dart';
import '../../constants/strings.dart';
import '../../data/models/agent/agent.dart';

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
              agent.role!.displayName,
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
            CachedNetworkImage(
              imageUrl: agent.background ?? "",
              fit: BoxFit.cover,
              memCacheHeight: 600,

              errorWidget: (context, url, error) =>
                  Container(color: MyColors.myGrey),
            ),

            Material(
              type: MaterialType.transparency,
              child: Hero(
                tag: agent.uuid!,
                child: CachedNetworkImage(
                  imageUrl:
                      agent.fullPortrait ??
                      agent.fullPortraitV2 ??
                      agent.bustPortrait ??
                      "",
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                  memCacheHeight: 800,
                  placeholder: (context, url) =>
                      Image.asset("assets/images/jet.gif", fit: BoxFit.cover),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, agentDetailsScreen, arguments: agent),

      child: Container(
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
            children: [buildRotatedText(), buildAgentImage()],
          ),
        ),
      ),
    );
  }
}
