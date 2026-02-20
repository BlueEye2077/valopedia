import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'map_item_skeleton.dart';

class MapsSkeletonListView extends StatelessWidget {
  const MapsSkeletonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      key: const ValueKey('skeleton'),
      enabled: true,
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const MapItemSkeleton();
          },
        ),
      ),
    );
  }
}