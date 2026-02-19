import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../constants/my_colors.dart';

class MapItemSkeleton extends StatelessWidget {
  const MapItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      color: MyColors.mySilver,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: Container(
        color: MyColors.myplaceholderGrey,
        child: Stack(
          // alignment: Alignment.bottomLeft,
          children: [
            // Map splash image placeholder
            Skeleton.ignore(
              child: Container(
                color: MyColors.myGrey,
                width: double.infinity,
                height: 200,
              ),
            ),

            // Text overlay placeholder
            const Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Skeleton.shade(
                        child: Icon(
                          Icons.location_on_outlined,
                          color: MyColors.myLightYellow,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "34°N, 118°W",
                        style: TextStyle(color: MyColors.myLightYellow),
                      ),
                    ],
                  ),
                  Text(
                    "Haven",
                    style: TextStyle(
                      fontSize: 42,
                      color: MyColors.myLightYellow,
                    ),
                  ),
                  Text(
                    "A / B / C Sites",
                    style: TextStyle(
                      fontSize: 16,
                      color: MyColors.myLightYellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
