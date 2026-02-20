import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'agent_item_skeleton.dart';

class AgentSkeletonGridview extends StatelessWidget {
  const AgentSkeletonGridview({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      key: const ValueKey('skeleton'),
      enabled: true,
      child: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const AgentItemSkeleton();
        },
      ),
    );
  }
}
