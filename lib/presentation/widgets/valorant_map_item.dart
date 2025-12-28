import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valopedia/data/models/map/map.dart';

class ValorantMapItem extends StatelessWidget {
  final ValorantMap valorantMap;

  const ValorantMapItem({super.key, required this.valorantMap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      margin: const .all(8),

      child: Stack(
        alignment: .centerLeft,
        children: [
          CachedNetworkImage(
            imageUrl: valorantMap.splash!,
            fit: .cover,
            placeholder: (context, url) => Image.asset(
              "assets/images/backgrounds/maps_placeholder.gif",
              fit: .cover,
      
            ),
          ),
          Positioned(
            left: 20,
            child: Column(
              crossAxisAlignment: .start,
      
              children: [
                Text(
                  valorantMap.displayName ?? "",
                  style: const TextStyle(
                    fontSize: 42,
                    color: Color.fromARGB(255, 238, 236, 204),
                  ),
                ),
                Text(
                  valorantMap.tacticalDescription ?? "Site",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 238, 236, 204),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
