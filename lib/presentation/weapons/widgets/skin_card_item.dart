import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../constants/my_colors.dart';
import '../../../data/models/weapon/weapon.dart';
import '../../common/app_loading_indicator.dart';

class SkinCardItem extends StatelessWidget {
  final Skins skin;
  const SkinCardItem({super.key, required this.skin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: MyColors.mySilver)),
      child: Stack(
        alignment: .center,
        children: [
          if (skin.wallpaper != null)
            CachedNetworkImage(
              imageUrl: skin.wallpaper!,
              cacheKey: skin.uuid,
              memCacheHeight: 600,
              memCacheWidth: 800,
              maxWidthDiskCache: 1000,
              maxHeightDiskCache: 600,
              placeholder: (context, url) => Image.memory(kTransparentImage),
              fit: .cover,
              height: double.infinity,
              width: double.infinity,
            ),

          if (skin.wallpaper == null)
            Image.asset(
              "assets/images/backgrounds/weapon_default_wallpaper.jpg",
              fit: .cover,
              height: double.infinity,
              width: double.infinity,
            ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              cacheKey: skin.uuid! * 2,
              memCacheHeight: 600,
              memCacheWidth: 800,
              maxWidthDiskCache: 1000,
              maxHeightDiskCache: 600,
              imageUrl: skin.displayIcon!,
              placeholder: (context, url) => const AppLoadingIndicator(),
              fit: .contain,
              height: double.infinity,
              width: double.infinity,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const .all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withValues(alpha: .7),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Text(
                skin.displayName.toString(),
                style: const TextStyle(color: MyColors.myWhite),
                textAlign: .center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
