import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'weapon_item_skeleton.dart';

class WeaponsSkeletonGridView extends StatelessWidget {
  const WeaponsSkeletonGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      key: const ValueKey('skeleton'),
      enabled: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(4),
        child: Column(
          children: [
            GridView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 12,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return const WeaponItemSkeleton();
              },
            ),
          ],
        ),
      ),
    );
  }
}
