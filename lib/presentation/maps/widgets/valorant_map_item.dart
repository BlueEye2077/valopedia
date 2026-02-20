import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/strings.dart';
import '../../../data/models/map/valorant_map.dart';

class ValorantMapItem extends StatelessWidget {
  final ValorantMap valorantMap;

  const ValorantMapItem({super.key, required this.valorantMap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      color: MyColors.mySilver,
      clipBehavior: Clip.hardEdge,
      margin: const .all(8),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          mapDetailsScreen,
          arguments: valorantMap,
        ),
        child: Stack(
          // alignment: .centerLeft,
          alignment: .bottomLeft,
          children: [
            Hero(
              tag: valorantMap.uuid!,
              child: CachedNetworkImage(
                imageUrl: valorantMap.splash!,
                cacheKey: valorantMap.uuid, // Explicit cache key
                fit: BoxFit.cover,
                memCacheWidth: 800, // Optimize memory cache
                memCacheHeight: 450, // Optimize memory cache
                maxWidthDiskCache: 1000, // Optimize disk cache
                maxHeightDiskCache: 600, // Optimize disk cache
                width: .infinity,
                // height: MediaQuery.of(context).size.height * 0.25,
                height: 200,
              
                placeholder: (context, url) =>
                    Container(color: MyColors.myPlaceholderGrey),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: .start,

                children: [
                  Row(
                    mainAxisAlignment: .start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: MyColors.myLightYellow,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        valorantMap.coordinates ?? "No Coordinates",
                        style: const TextStyle(color: MyColors.myLightYellow),
                      ),
                    ],
                  ),
                  Text(
                    valorantMap.displayName ?? "",
                    style: const TextStyle(
                      fontSize: 42,
                      color: MyColors.myLightYellow,
                    ),
                  ),
                  Text(
                    valorantMap.tacticalDescription ?? "Site",
                    style: const TextStyle(
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
