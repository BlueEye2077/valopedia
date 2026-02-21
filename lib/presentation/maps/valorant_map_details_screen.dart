import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transparent_image/transparent_image.dart';
import '../common/divider_with_space.dart';
import 'widgets/no_map_icon_card.dart';
import '../../business_logic/cubit/favourites/favourites_cubit.dart';
import '../../constants/my_colors.dart';
import '../../data/models/map/valorant_map.dart';
import '../common/custom_sliver_app_bar.dart';
import '../common/section_title.dart';
import 'widgets/image_with_corners_stack.dart';
import 'widgets/info_square_row.dart';
import 'widgets/map_icon_card.dart';

class ValorantMapDetailsScreen extends StatelessWidget {
  final ValorantMap valorantMap;
  const ValorantMapDetailsScreen({super.key, required this.valorantMap});

  Widget _buildFlexibleSpaceBarBackground() {
    return Hero(
      tag: valorantMap.uuid!,

      child: CachedNetworkImage(
        imageUrl: valorantMap.splash!,
        cacheKey: valorantMap.uuid!, // Explicit cache key
        fit: BoxFit.cover,
        memCacheWidth: 800, // Optimize memory cache
        memCacheHeight: 450, // Optimize memory cache
        maxWidthDiskCache: 1000, // Optimize disk cache
        maxHeightDiskCache: 600, // Optimize disk cache
        placeholder: (context, url) =>
            Container(color: MyColors.myPlaceholderGrey),
      ),
    );
  }

  Widget _buildSliverBody() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Column(
          children: [
            InfoSquareRow(valorantMap: valorantMap),

            Padding(
              padding: const .all(12),

              child:
                  valorantMap.displayIcon == null &&
                      valorantMap.stylizedBackgroundImage == null &&
                      valorantMap.premierBackgroundImage == null
                  ? const NoMapIconCard()
                  : Column(
                      children: [
                        const SizedBox(height: 20),
                        valorantMap.displayIcon != null
                            ? Column(
                                children: [
                                  const SectionTitle(title: "Map Icon"),
                                  const SizedBox(height: 6),
                                  MapIconCard(
                                    height: 380,
                                    child: ImageWithCornersStack(
                                      valorantMap: valorantMap,
                                    ),
                                  ),
                                  const DividerWithSpace(),
                                ],
                              )
                            : const SizedBox.shrink(),

                        valorantMap.stylizedBackgroundImage != null
                            ? Column(
                                children: [
                                  const SectionTitle(
                                    title: "Stylized Background Image",
                                  ),
                                  const SizedBox(height: 6),
                                  MapIconCard(
                                    height: 230,
                                    child: FadeInImage.memoryNetwork(
                                      fit: .cover,
                                      placeholder: kTransparentImage,
                                      image:
                                          valorantMap.stylizedBackgroundImage!,
                                    ),
                                  ),
                                  const DividerWithSpace(),
                                ],
                              )
                            : const SizedBox.shrink(),

                        valorantMap.premierBackgroundImage != null
                            ? Column(
                                children: [
                                  const SectionTitle(
                                    title: "Premier Background Image",
                                  ),
                                  const SizedBox(height: 6),
                                  MapIconCard(
                                    height: 230,
                                    child: FadeInImage.memoryNetwork(
                                      fit: .cover,
                                      placeholder: kTransparentImage,
                                      image:
                                          valorantMap.premierBackgroundImage!,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
            ),
          ],
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavouritesCubit<ValorantMap>, FavouritesState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomSliverAppBar(
                item: valorantMap,
                flexibleSpaceBarBackground: _buildFlexibleSpaceBarBackground,
                expandedHeight: 400,
                title: valorantMap.displayName!,
              ),

              _buildSliverBody(),
            ],
          );
        },
      ),
    );
  }
}
