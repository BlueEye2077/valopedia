import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../constants/my_colors.dart';
import '../../../data/models/map/valorant_map.dart';
import 'custom_corners.dart';

class ImageWithCornersStack extends StatelessWidget {
  const ImageWithCornersStack({super.key, required this.valorantMap});

  final ValorantMap valorantMap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: valorantMap.displayIcon!,
          fit: .cover,
        ),
        const CustomCorners(top: 15, left: 15, color: MyColors.myRed, width: 2),
        const CustomCorners(
          top: 15,
          right: 15,
          color: MyColors.myRed,
          width: 2,
        ),
        const CustomCorners(
          bottom: 15,
          left: 15,
          color: MyColors.myRed,
          width: 2,
        ),
        const CustomCorners(
          bottom: 15,
          right: 15,
          color: MyColors.myRed,
          width: 2,
        ),
      ],
    );
  }
}
